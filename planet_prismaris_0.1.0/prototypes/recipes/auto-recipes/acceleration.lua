-- Should take in an item with spoilage and produce its spoiled output. Building has an innate quality bonus. 
-- However, all acceleration recipes should have a 25% chance to lose the item (science packs, flux capacitors, and catalytic crystals are the exception and should not be lost in this way).
-- Crafting category should be pre.."acceleration-chronocycling"

local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"

local hasSpoilage = function(item)
	return (item ~= nil and item.spoil_result ~= nil and item.spoil_ticks > 0)
end

function getIPChance(item)
	-- uses extra data recorded on the prototype in data.raw during item creation
	if item.is_acceleration_loss_exempt then 
		return 1
	else
		return 0.8
	end
end

local chronocyclingList = {"pentapod-egg-acceleration","biter-egg-acceleration","captive-biter-spawner-acceleration"}

for type_name in pairs(defines.prototypes.item) do -- get all subtypes of "item" prototype
	if data.raw[type_name] then
		for k, item in pairs(data.raw[type_name]) do -- get every valid prototype
			if hasSpoilage(item) then -- check if it has something it can spoil into
				accelerationName = item.name .. "-acceleration"
				table.insert(chronocyclingList, accelerationName) -- Keep a record of chronocycling recipes
				data:extend({
					pf.recipeFactory(
						accelerationName,
						recipeTempIcon,
						pf.itemIngredientsFactory({
							{item.name,1,ignored_by_stats = 1}
						}),
						pf.itemResultsFactory({
							{item.spoil_result,1,always_fresh = true,ip = getIPChance(item), ignored_by_stats = 1}
						}),
						.1,
						{pre .. "acceleration-chronocycling"},
						keyMerge(
							item.order,
							{
								keys.standard,
								keys.tint(color.concentratedVoid),
								{
									subgroup = item.subgroup,
									hidden=true,
									unlock_results=false,
									localised_name = {"recipe-name.acceleration",pf.getLocalisedName(item.name)}
								}
							}
						)
					)
				})
			end
		end
	end
end

--Meme recipes: Pentapod and biter egg acceleration
data:extend{
	pf.recipeFactory(
		"pentapod-egg-acceleration",
		recipeTempIcon,
		pf.itemIngredientsFactory({
			{"pentapod-egg",1,ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{"pentapod-egg",1,percent_spoiled=0.985,ignored_by_stats = 1}
		}),
		.1,
		{pre .. "acceleration-chronocycling"},
		keyMerge(
			"c[eggs]-b[pentapod-egg]",
			{
				keys.standard,
				keys.tint(color.concentratedVoid),
				{
					subgroup = "agriculture-products",
					hidden=true,
					unlock_results=false,
					localised_name = {"recipe-name.acceleration",pf.getLocalisedName("pentapod-egg")}
				}
			}
		)
	),
	pf.recipeFactory(
		"biter-egg-acceleration",
		recipeTempIcon,
		pf.itemIngredientsFactory({
			{"biter-egg",1,ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{"biter-egg",1,percent_spoiled=0.985,ignored_by_stats = 1}
		}),
		.1,
		{pre .. "acceleration-chronocycling"},
		keyMerge(
			"c[eggs]-a[biter-egg]",
			{
				keys.standard,
				keys.tint(color.concentratedVoid),
				{
					subgroup = "agriculture-products",
					hidden=true,
					unlock_results=false,
					localised_name = {"recipe-name.acceleration",pf.getLocalisedName("biter-egg")}
				}
			}
		)
	),
	pf.recipeFactory(
		"captive-biter-spawner-acceleration",
		recipeTempIcon,
		pf.itemIngredientsFactory({
			{"captive-biter-spawner",1,ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{"captive-biter-spawner",1,percent_spoiled=0.985,ignored_by_stats = 1}
		}),
		.1,
		{pre .. "acceleration-chronocycling"},
		keyMerge(
			data.raw["item"]["captive-biter-spawner"].order,
			{
				keys.standard,
				keys.tint(color.concentratedVoid),
				{
					subgroup = "agriculture-products",
					hidden=true,
					unlock_results=false,
					localised_name = {"recipe-name.acceleration",pf.getLocalisedName("captive-biter-spawner")}
				}
			}
		)
	),
}

for i,r in ipairs(chronocyclingList) do
	table.insert(data.raw["technology"]["chronocycler-acceleration"].effects, {type = "unlock-recipe", recipe = r})
end