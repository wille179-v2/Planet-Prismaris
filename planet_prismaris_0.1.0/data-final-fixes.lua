require("prototypes.recipes.auto-recipes.acceleration")
require("prototypes.recipes.auto-recipes.reversal")
require("prototypes.recipes.auto-recipes.stasis")

-- Searches for burner buildings; adds a trash slot to them if required.
for category,prototypeList in pairs(data.raw) do -- Prototype categories
	for prototypeName,prototypeData in pairs (prototypeList) do -- specific prototypes
		if prototypeData.energy_source ~= nil and prototypeData.energy_source.type == "burner" then -- check if it's a burner item
			local valid = false
			for _,i in ipairs(prototypeData.energy_source.fuel_categories or {}) do 
				if i == "chemical" or i == "nutrients" then -- check if the burner uses nutrients or chemical fuel
					valid = true
				end
			end
			if (prototypeData.energy_source.burnt_inventory_size == nil or prototypeData.energy_source.burnt_inventory_size <= 0) and valid then -- only modify valid buildings that need to be modified
				data.raw[category][prototypeName].energy_source.burnt_inventory_size = 1
			end
		end
	end
end

-- Searches for labs. Insert science packs and adds extra trash slots as needed.
for _,lab in pairs(data.raw["lab"]) do -- examine labs
	i = -1
	for index,pack in ipairs(lab.inputs) do
		if pack == "agricultural-science-pack" then -- check if the lab contains the agricultural science pack and (and thus probably isn't some modded lab with narrow functions); if so, get the pack index
			i = index
		end
	end
	if i > -1 then -- Insert the packs at the next three available indexes.
		table.insert(lab.inputs,i+1,pre .. "red-polyphasic-science-pack")
		table.insert(lab.inputs,i+2,pre .. "blue-polyphasic-science-pack")
		table.insert(lab.inputs,i+3,pre .. "green-polyphasic-science-pack")
	end

	-- Add 3 extra trash inventory slots to labs (to a minimum of 4 if it doesn't have them already for some reason). Don't touch labs skipped earlier.
	if i > -1 then
		lab.trash_inventory_size = (lab.trash_inventory_size or 1) + 3
	end
end

-- TODO: Add polyscience to endgame
	-- Note: If settings.startup["prismaris-add-polysci-to-endgame"].value == false, do nothing in this section and ignore the value of "prismaris-randomized-science-phase"
	-- If "prismaris-randomized-science-phase" == true (default value), every science should get one randomly chosen polyphase science pack instead of all three, but require three of them.
	-- Else if "prismaris-randomized-science-phase" == false, every science should require aone of all three polyphase science packs
		-- If "prismaris-easy-endgame-science-rescaling" == true (default is false), rebalance the technology costs and research times: