-- Find all items with spoilage. Output a fresh version of the same item at the same quality level. Disallow quality changes.
-- Crafting time should be 0.333 seconds or sqrt(spoil time) / 4 (rounded down to nearest whole tick), whichever is greater
-- Crafting category should be pre .. "stasis-chronocycling"

local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"
local chronocyclingList = {}

local hasSpoilage = function(item)
	return (item ~= nil and item.spoil_ticks ~= nil and item.spoil_ticks > 0)
end

local getCraftingTime = function(item)
	craftTicks = math.max(math.floor(math.sqrt(item.spoil_ticks)/4),20)
	return craftTicks / 60
end


local refresh = (settings.startup["test-stasis-mode"].value == "refresh")

if refresh then
	for type_name in pairs(defines.prototypes.item) do -- get all subtypes of "item" prototype
		if data.raw[type_name] then
			for k, item in pairs(data.raw[type_name]) do -- get every valid prototype
				if hasSpoilage(item) then -- check if it has something it can spoil into
					locale = pf.getLocalisedName(item.name)
					stasisName = item.name .. "-stasis"
					table.insert(chronocyclingList, stasisName)
					data:extend({
						pf.recipeFactory(
							stasisName,
							recipeTempIcon, -- TODO: placeholder icon
							pf.itemIngredientsFactory({
								{item.name,1,ignored_by_stats = 1}
							}),
							pf.itemResultsFactory({
								{item.name,1,always_fresh = true, ignored_by_stats = 1}
							}),
							getCraftingTime(item),
							{pre .. "stasis-chronocycling"},
							keyMerge(
								item.order,
								{
									keys.standard,
									keys.tint(color.concentratedVoid),
									{
										subgroup = item.subgroup,
										hidden=true,
										unlock_results=false,
										preserve_products_in_machine_output=true,
										localised_name = {"recipe-name.stasis",locale}
									}
								}
							)
						)
					})
				end
			end
		end
	end
else
	itemList = {}
	for type_name in pairs(defines.prototypes.item) do -- get all subtypes of "item" prototype
		if data.raw[type_name] then
			for k, item in pairs(data.raw[type_name]) do -- get every valid prototype
				if hasSpoilage(item) then -- check if it has something it can spoil into
					frozenItem = table.deepcopy(item)
					frozenItem.spoil_ticks = 100 * item.spoil_ticks
					frozenItem.icons = frozenItem.icons or {{icon = frozenItem.icon}}
					frozenItem.icons[1].tint = {0.5,.5,.5}
					frozenItem.icon = nil
					frozenItem.name = frozenItem.name .. "-frozen"
					frozenItem.hidden = true
					frozenItem.localised_name = {"item-name.frozen",pf.getLocalisedName(item.name)}
					table.insert(itemList,{frozenItem,item})
				end
			end
		end
	end
	for i,item in pairs(itemList) do
		freezingName = item[2].name .. "-freezing"
		thawingName = item[2].name .. "-thawing"
		locale = pf.getLocalisedName(item[2].name)
		table.insert(chronocyclingList, freezingName)
		table.insert(chronocyclingList, thawingName)
		data:extend({
			item[1],
			pf.recipeFactory(
				freezingName,
				item[1].icons,
				pf.itemIngredientsFactory({
					{item[2].name,1,ignored_by_stats = 1}
				}),
				pf.itemResultsFactory({
					{item[1].name,1,ignored_by_stats = 1}
				}),
				getCraftingTime(item[2]),
				{pre .. "stasis-chronocycling"},
				keyMerge(
					(item[2].order or "").."-f",
					{
						keys.standard,
						keys.tint(color.concentratedVoid),
						{
							subgroup = item.subgroup,
							hidden=true,
							unlock_results=false,
							localised_name = {"recipe-name.freezing",locale}
						}
					}
				)
			),
			pf.recipeFactory(
				thawingName,
				item[2].icons or recipeTempIcon,
				pf.itemIngredientsFactory({
					{item[1].name,1,ignored_by_stats = 1}
				}),
				pf.itemResultsFactory({
					{item[2].name,1,ignored_by_stats = 1}
				}),
				getCraftingTime(item[2]),
				{pre .. "stasis-chronocycling"},
				keyMerge(
					(item[2].order or "").."-f",
					{
						keys.standard,
						keys.tint(color.concentratedVoid),
						{
							subgroup = item.subgroup,
							hidden=true,
							unlock_results=false,
							localised_name = {"recipe-name.thawing",locale}
						}
					}
				)
			)
		})
	end
end				

-- log(serpent.block(chronocyclingList))

for i,r in ipairs(chronocyclingList) do
	table.insert(data.raw["technology"]["chronocycler-stasis"].effects, {type = "unlock-recipe", recipe = r})
end


-- TODO: Implement alternate freeze version, gated behind settings.startup["test-stasis-mode"].value == "freeze"