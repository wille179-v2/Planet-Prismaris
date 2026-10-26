local hostility_delta = 0.01 -- The rate at which hostility increases as roboports are built
local aggressiveness_scale_factor = 1 -- A tuning number for how aggressive lightning is at max hostility, representing maximum number of robots struck per lightning cycle
local tick_scale = 120 -- Rate at which lightning script is called, in ticks between calls.
local lightning_collector_protection = true


--[[
On startup: set up the storage table. Variables:
	<array> active_chunks:			a table of prismaris chunks where the key is the string `chunk.x .. " " .. chunk.y` and the value is the ChunkPositionAndArea returned by LuaChunkIterator. 
										Chunks listed here must contain a roboport, and if the last roboport is removed the chunk must be cleared from the list.
	<float> hostility_level:		a decimal number representing the aggressiveness of the lightning. 0 disables the script entirely and 1 represents maximum aggressiveness. 
										Starts at 0.01 and increments by 0.01 (to a max of 1.0) every time a roboport is built, decriments by 0.01 (to a min of 0) when a roboport dies. 
	<boolean> hostility_enabled:	equal to the inverse of settings.startup["prismaris-lightning-mercy"].value. Skips processing if true.
	
]]

function prismaris_exists()
	return game.surfaces["prismaris"] ~= nil
end


script.on_init(function()
	storage.active_chunks = {}
	storage.hostility_level = 0
	storage.hostility_enabled = not settings.startup["prismaris-lightning-mercy"].value
end)


script.on_configuration_changed(function()
	storage.hostility_enabled = not settings.startup["prismaris-lightning-mercy"].value
	if prismaris_exists() then
		-- Recalculates the hostility value and rebuilds active_chunks when on_configuration_changed is called just in case.
		local prismaris_roboports = game.surfaces["prismaris"].find_entities_filtered{type = "roboport"}
		storage.hostility_level = #prismaris_roboports * hostility_delta
		storage.active_chunks = {}
		for _,roboport in pairs(prismaris_roboports) do
			local chunk = chunk_from_map_position(roboport.position)
			storage.active_chunks[chunk.key] = chunk
		end
	end
end)


function chunk_from_map_position(mapPosition)
	local chunk = {x = math.floor(mapPosition.x/32), y =  math.floor(mapPosition.y/32)}
	chunk.key = chunk.x .. " " .. chunk.y
	chunk.bounding_box = {{chunk.x * 32, chunk.y*32},{(chunk.x+1)*32,(chunk.y+1)*32}}
	return chunk
end


-- called when a roboport is constructed. Stores the chunk coordinates in storage.active_chunks under the key `chunk.x .. "-" .. chunk.y`. Also increments hostility_level to a max of 1.
function roboport_added(event)
	if event.entity.surface.name == "prismaris" then
		local chunk = chunk_from_map_position(event.entity.position)
		storage.active_chunks[chunk.key] = chunk
		storage.hostility_level = math.min(storage.hostility_level + hostility_delta,1)
	end
end


-- called when a roboport is removed. Checks if the chunk contains any other roboports and removes the chunk from storage.active_chunks if no other roboports exist. Also decriments hostility_level to a min of 0.
function roboport_removed(event)
	if event.entity.surface.name == "prismaris" then
		local chunk = chunk_from_map_position(event.entity.position)
		local roboports = game.surfaces["prismaris"].find_entities_filtered{area = chunk.bounding_box, type = "roboport"}
		if #roboports == 1 then -- if there is only one last roboport in the chunk, delete this chunk from storage
			storage.active_chunks[chunk.key] = nil
		end
		storage.hostility_level = math.max(storage.hostility_level - hostility_delta,0)
	end
end


local roboport_filter = {{filter = "type", type = "roboport"}}

script.on_event(defines.events.on_built_entity, roboport_added, roboport_filter)
script.on_event(defines.events.on_robot_built_entity, roboport_added, roboport_filter)

script.on_event(defines.events.on_entity_died, roboport_removed, roboport_filter)
script.on_event(defines.events.on_robot_mined_entity, roboport_removed, roboport_filter)
script.on_event(defines.events.on_player_mined_entity, roboport_removed, roboport_filter)


--[[
	Goal: 
		1. iterate through active chunks
		2. At a rate determined by hostility_level, flag a chunk for a lightning strike
		3. Search flagged chunks for active robots; if any, continue, else move onto next chunk
		4. Select a random number of active robots depending on aggressiveness_scale_factor
		5. Summon lightning at the coordinates of those robots.
]]

-- called periodically on_nth_tick.
function hostile_lightning_handler(tick, nth_tick)
	if prismaris_exists() and storage.hostility_enabled and storage.hostility_level > 0 then -- General hostility check
		-- Seek valid bots in a random subset of active chunks
		local flagged_bots = {}
		for k,chunk in pairs(storage.active_chunks) do
			if math.random() <= storage.hostility_level then
				for i,bot in ipairs(game.surfaces["prismaris"].find_entities_filtered{area = chunk.bounding_box, type = {"logistic-robot","construction-robot"}}) do
					table.insert(flagged_bots,bot)
				end
			end
		end
		-- If there are active bots, pick some at random based on the aggressiveness_scale_factor
		if #flagged_bots >= 1 then
			for i=1,aggressiveness_scale_factor do
				local random_bot = flagged_bots[math.ceil(math.random() * #flagged_bots)]
				local lightning_position = {random_bot.position.x, random_bot.position.y-25}
				-- Scan for nearby lightning collectors; if they are present, execute_lightning (which is blocked by said collector); if not present, summon unblocked lightning instead.
				-- Note: collectors have a natural radius of 25; by searching in a slightly smaller radius it is almost certain that the bot will legitimately be covered by the collector and won't be in the uncovered corner.
				-- Also ensures that the lightning will likely seek a collector and not an incidentally closer rod.
				-- However, this does leave gaps where collectors 45+ tiles away won't fully cover a robot
				local is_collector_nearby = #(game.surfaces["prismaris"].find_entities_filtered{area = {{random_bot.position.x-22,random_bot.position.y-22},{random_bot.position.x+22,random_bot.position.y+22}}, name = "lightning-collector"}) >= 1 
				if is_collector_nearby and lightning_collector_protection then
					game.surfaces["prismaris"].execute_lightning{name = "lightning", position = lightning_position}
				else
					game.surfaces["prismaris"].create_entity{
						name = "lightning",
						position = lightning_position,
						target = random_bot,
					}
				end			
			end
		end
	end
end

script.on_nth_tick(tick_scale,hostile_lightning_handler)