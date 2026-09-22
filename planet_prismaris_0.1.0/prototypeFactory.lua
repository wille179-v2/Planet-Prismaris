-- Contains many helper functions for creating brand new recipes, items, technologies, and tiles.

local modName = "__planet_prismaris__"
local spaceAge = "__space-age__"
local defaultIconSizeDefine = defines.default_icon_size

local pf = {}
-- hidden wrapper function for getting categories from raw.
function raw(category)
	return data.raw[category]
end

-- wrapper for deepcopy function
function pf.clone(original)
	original = original or {}
	return table.deepcopy(original)
end

-- clones any base thing from any category of data.raw
function pf.cloneRaw(category,original)
	return pf.clone(raw(category)[original])
end

-- gets a clone of the the crafting_machine_tint of a recipe
function pf.getTint(recipe)
	return pf.clone(recipes[recipe].crafting_machine_tint)
end

--[[ Depreciated
function pf.getTimeAndCount(item)
	local count = 1
	local recipe = raw("recipe")[item]
	for _,result in ipairs(recipe.results) do
		if result.name == item then
			count = result.amount
		end
	end
	return recipe.energy_required, count
end
]]

--[[https://lua-api.factorio.com/latest/prototypes/RecipePrototype.html
	Constructs a new recipe prototype.
	string name					name of the recipe
	array icons					icons for the recipe (use pf.iconFactory)
	array ingredients			ingredients for the recipe (use pf.ingredientsFactory)
	array results				results for the recipe (use pf.resultsFactory)
	double energy_required		crafting time for the recipe
	array categories			categories of the recipie, determining main production building
	table otherKeys				optional table of other properties for the recipe 
]]
function pf.recipeFactory(name, icons, ingredients, results, energy_required, categories, otherKeys)
	recipe = {
		type = "recipe",
		["name"] = name,
		["icons"] = pf.iconFactory(icons),
		["ingredients"] = ingredients,
		["results"] = results,
		["energy_required"] = energy_required,
		["categories"] = categories
	}
	otherKeys = otherKeys or {}
	for key,value in pairs(otherKeys) do
		recipe[key] = value
	end
	return recipe
end

function pf.itemIngredientsFactory(itemIngredients)
	return pf. ingredientsFactory(itemIngredients, {})
end

function pf.fluidIngredientsFactory(fluidIngredients)
	return pf.ingredientsFactory({},fluidIngredients)
end

--[[https://lua-api.factorio.com/latest/types/IngredientPrototype.html
	Takes in two ordered arrays. itemIngredients = {itemName, amount}, fluidIngredients = {fluidName, amount}. Arrays can be nil if there are no ingredients of that type.
	Amount must be specified for fluids, but is optional for items (default = 1).
	all properties can also be specified by key name:
		name
		amount
		temperature
		minimum_temperature and maximum_temperature (if temperature not specified)
		ignored_by_stats
		fluidbox_index
		optional_fluidbox_indexes
		fluidbox_multiplier
]]
function pf.ingredientsFactory(itemIngredients, fluidIngredients)
	ingredientsFormatted = {}
	if itemIngredients ~= nil then
		for i,item in ipairs(itemIngredients) do
			table.insert(ingredientsFormatted, {
				type = "item",
				name = item.name or item[1],
				amount = item.amount or item[2] or 1,
				ignored_by_stats = item.ignored_by_stats or 0,
				quality_min = item.quality_min,
				quality_max = item.quality_max,
				quality_change = item.quality_change,
				affected_by_quality = item.affected_by_quality
			})
		end
	end
	if fluidIngredients ~= nil then
		for i,fluid in ipairs(fluidIngredients) do
			table.insert(ingredientsFormatted, {
				type = "fluid",
				name = fluid.name or fluid[1],
				amount = fluid.amount or fluid[2],
				temperature = fluid.temperature,
				minimum_temperature = fluid.minimum_temperature,
				maximum_temperature = fluid.maximum_temperature,
				ignored_by_stats = fluid.ignored_by_stats,
				fluidbox_index = fluid.fluidbox_index,
				optional_fluidbox_indexes = fluid.optional_fluidbox_indexes,
				fluidbox_multiplier = fluid.fluidbox_multiplier
			})
		end
	end
	return ingredientsFormatted
end

function pf.itemResultsFactory(itemResults)
	return pf.resultsFactory(itemResults,{})
end

function pf.fluidResultsFactory(fluidResults)
	return pf.resultsFactory({},fluidResults)
end

--[[ https://lua-api.factorio.com/latest/types/ProductPrototype.html
	Takes in two ordered arrays. itemResults = {{itemName, amount},...}, fluidResults = {{fluidName, amount},...}. Arrays can be nil if there are no results of that type.
	Also accepts all other keys by name, with some commonly used keys having a alternative shorthand key:
		name
		amount
		amount_min (aka "min")
		amount_max (aka "max")
		independent_probability (aka "ip")
		shared_probability (aka "sp")
		ignored_by_productivity (aka "ignore_prod")
		always_fresh (aka "fresh")
		reset_freshness_on_craft (aka "reset_fresh")
		ignored_by_stats
		temperature
		fluidbox_index
		optional_fluidbox_indexes
		fluidbox_multiplier
		show_details_in_recipe_tooltip
		extra_count_fraction
		percent_spoiled
]]
function pf.resultsFactory(itemResults, fluidResults)
	resultsFormatted = {}
	if itemResults ~= nil then
		for i,item in ipairs(itemResults) do
			table.insert(resultsFormatted, {
				type = "item",
				name = item.name or item[1],
				amount = item.amount or item[2],
				amount_min = item.amount_min or item.min,
				amount_max = item.amount_max or item.max,
				independent_probability = item.independent_probability or item.ip,
				shared_probability = item.shared_probability or item.sp,
				always_fresh = item.always_fresh or item.fresh,
				reset_freshness_on_craft = item.reset_freshness_on_craft or item.reset_fresh,
				ignored_by_stats = item.ignored_by_stats,
				ignored_by_productivity = item.ignored_by_productivity or item.ignore_prod,
				show_details_in_recipe_tooltip = item.show_details_in_recipe_tooltip,
				extra_count_fraction = item.extra_count_fraction,
				percent_spoiled = item.percent_spoiled,
				quality_min = item.quality_min,
				quality_max = item.quality_max,
				quality_change = item.quality_change,
				affected_by_quality = item.affected_by_quality
			})
		end
	end
	if fluidResults ~= nil then
		for i,fluid in ipairs(fluidResults) do
			table.insert(resultsFormatted, {
				type = "fluid",
				name = fluid.name or fluid[1],
				amount = fluid.amount or fluid[2],
				amount_min = fluid.amount_min or fluid.min,
				amount_max = fluid.amount_max or fluid.max,
				independent_probability = fluid.independent_probability or fluid.ip,
				shared_probability = fluid.shared_probability or fluid.sp,
				ignored_by_stats = fluid.ignored_by_stats,
				ignored_by_productivity = fluid.ignored_by_productivity or fluid.ignore_prod,
				temperature = fluid.temperature,
				fluidbox_index = fluid.fluidbox_index,
				optional_fluidbox_indexes = fluid.optional_fluidbox_indexes,
				fluidbox_multiplier = fluid.fluidbox_multiplier,
				show_details_in_recipe_tooltip = fluid.show_details_in_recipe_tooltip,
			})
		end
	end
	return resultsFormatted
end


--[[
	Takes in either a string path to a 64px icon file, or takes in an array of icons layers.
	Each icon layer can be either a standard factorio icon definition or can be an ordered array: {iconPath, shift, scale, tint}
]]
function pf.iconFactory(icons)
	iconList = {}
	if type(icons) == type("string") then -- if given only a string to the icon location
		iconList = {{icon = icons}}
	elseif type(icons) == type({}) then -- if given an array of layers
		for i,layer in ipairs(icons) do
			table.insert(iconList, {
				icon = layer.icon or layer[1],
				shift = layer.shift or layer[2],
				scale = layer.scale or layer[3],
				tint = layer.tint or layer[4],
				icon_size = layer.icon_size,
				draw_background = layer.draw_background,
				floating = layer.floating
			})
		end
	end
	return iconList
end

--[[
	Constructs a new item prototype https://lua-api.factorio.com/latest/prototypes/ItemPrototype.html
	string name					name of the item
	int stackSize				items per stack
	array/string icons			icons for the item. (Use pf.iconFactory)
	string subgroup				subgroup of the item, for ordering on the GUI.
	table pfs					table with keys "placement", "fuel", or "spoilage". Use appropriate helper to generate
		table placement				placement details, use pf.placementHelper to generate
		table fuel					fuel details, use pf.fuelHelper to generate
		table spoilage				spoilage details, use pf.spoilageHelper to generate
	table otherKeys				optional table of other properties for the item 
]]
function pf.itemFactory(name, stackSize, icons, subgroup, pfs, otherKeys)
	item = {type = "item"}
	item.name = name
	item.stack_size = stackSize
	item.icons = pf.iconFactory(icons)
	item.subgroup = subgroup
	pfs = pfs or {}

	if pfs.placement ~= nil and pfs.placement.type ~= nil then
		item[pfs.placement.type] = pfs.placement.result
		if pfs.placement.type == "plant_result" then
			item["place_result"] = pfs.placement.result -- plants are a special case and need both?
		end
	end

	if pfs.fuel ~= nil then
		for key,value in pairs(pfs.fuel) do
			item[key] = value
		end
	end

	if pfs.spoilage ~= nil then
		for key,value in pairs(pfs.spoilage) do
			item[key] = value
		end
	end

	if otherKeys ~= nil then
		for key,value in pairs(otherKeys) do
			item[key] = value
		end
	end

	return item
end

--[[
	Helper function for pf.itemFactory. Defines placement of entities and tiles from items.
	string type					"building", "equipment", "plant", or "tile"
	string id					id of entity to place
	array placeAsTileStruct		tile placement struct, unused if type ~= "tile".
		array tile_condition		Specific Tiles it CAN be placed on. Can be the only argument at placeAsTileStruct[1]	
		dict layers					Collision layers it CANNOT be placed on (e.g. landfill cannot be placed upon ground_tile). Defaults to {layers = {}}.
										https://lua-api.factorio.com/latest/types/CollisionMaskConnector.html
		bool invert					defaults to false
		int condition_size			defaults to 1
]]
function pf.placementHelper(type, id, placeAsTileStruct)
	placeKey = ""
	result = id
	if type == "building" then placeKey = "place_result"
	elseif type == "equipment" then placeKey = "place_as_equipment_result"
	elseif type == "plant" then placeKey = "plant_result"
	elseif type == "tile" then 
		placeKey = "place_as_tile"
		result = {
			result = id,
			condition = {layers = placeAsTileStruct.layers or {}}, -- Collision layers it CANNOT be placed on (e.g. landfill cannot be placed upon ground_tile)
			invert = placeAsTileStruct.invert or false,
			condition_size = placeAsTileStruct.condition_size or 1,
			tile_condition = placeAsTileStruct.tile_condition or placeAsTileStruct[1] -- Specific Tiles it CAN be placed on
		}
	end
	return {["type"] = placeKey, ["result"] = result}
end

--[[
	Helper function for pf.itemFactory. Defines the fuel value of items.
	str value			value of the fuel, such as "12MJ". https://lua-api.factorio.com/latest/types/Energy.html
	str category		fuel category, defaults to "chemical" if omitted.
	table otherKeys		other optional keys and values to assign for fuels.
		fuel_acceleration_multiplier
		fuel_top_speed_multiplier
		fuel_emissions_multiplier
		fuel_acceleration_multiplier_quality_bonus
		fuel_top_speed_multiplier_quality_bonus
		fuel_glow_color
]]
function pf.fuelHelper(value, categories, otherKeys)
	fuel = {}
	fuel.fuel_value = value
	fuel.fuel_categories = categories or {"chemical"}
	otherKeys = otherKeys or {}
	for key,value in pairs(otherKeys) do
		fuel[key] = value
	end
	return fuel
end

--[[
	Helper function for pf.itemFactory. Defines spoilage properties.
	str result			item resulting from the spoilage
	int seconds			seconds for item to spoil. Is multiplied by 60 when saved as game ticks.
	int level			Optional spoil level of items. Inserters consider higher spoil_level items to be more spoiled regardless of actual percentage spoiled.
	table quality		Optional defines changing quality when something spoils. Requires spoil_quality_change if used.
	table trigger		Optional. https://lua-api.factorio.com/latest/types/SpoilToTriggerResult.html
	
]]
function pf.spoilageHelper(result, seconds, level, quality, trigger)
	quality = quality or {}
	spoilage = {
		spoil_result = result,
		spoil_ticks = seconds * 60,
		spoil_level = level or 0,
		spoil_quality_change = quality.spoil_quality_change,
		spoil_quality_min = quality.spoil_quality_min,
		spoil_quality_max = quality.spoil_quality_max,
		spoil_to_trigger_result = trigger
	}
	return spoilage
end


--[[
	Constructs a new fluid prototype https://lua-api.factorio.com/latest/prototypes/FluidPrototype.htm
	string name					name of the fluid
	array/string icons			icons for the fluid; can accept the string address of a single 64px icon or an array of simple icon layers. Calls pf.iconFactory for formatting.
	float default_temperature	temperature of the fluid. defaults to 15.
	color base_color			an array of {r,g,b} or {r,g,b,a}. Defaults to {1,1,1}.
	color flow_color
	table otherKeys				Optional. Any other keys and values to use.
]]
function pf.fluidFactory(name, icons, default_temperature, base_color, flow_color, otherKeys)
	fluid = {type = "fluid"}
	fluid.name = name
	fluid.icons = pf.iconFactory(icons)
	fluid.icon_size = 64
	fluid.default_temperature = default_temperature or 15
	fluid.base_color = base_color or {1,1,1}
	fluid.flow_color = flow_color or {1,1,1}
	otherKeys = otherKeys or {}
	fluid.subgroup = otherKeys.subgroup or "fluid"
	for key,value in pairs(otherKeys) do
		fluid[key] = value
	end
	return fluid
end


--[[
	Constructs a new technology prototype
	string name					name of the technology
	string icons				256 px icon file string
	bool essential				sets whether the technology is marked as essential.
	table unlockCondition		the unlock condition of the technology. Use pf.unlockHelper, pf.unlockUnitHelper, or pf.unlockTriggerHelper.
	array prerequisites			a list of prerequisite technologies.
	array effectsList			a list of the technology's effects; strings are treated as recipies for unlock recipe effects, tables are treated as other effects
	array otherKeys				an optional list of other key=value pairs.
]]
function pf.technologyFactory(name, icon, essential, unlockCondition, prerequisites, effectsList, otherKeys)
	tech = {type = "technology"}
	tech.name = name
	tech.icon = icon
	tech.icon_size = 256
	tech.essential = essential
	tech.research_trigger = unlockCondition.research_trigger
	tech.unit = unlockCondition.unit
	tech.prerequisites = prerequisites

	tech.effects = {}
	for i,effect in ipairs(effectsList) do 
		if type(effect) == type("string") then
			newEffect = {
				type = "unlock-recipe",
				recipe = effect
			}
			table.insert(tech.effects, newEffect)
		else
			table.insert(tech.effects, effect)
		end
	end
	
	otherKeys = otherKeys or {}
	for key,value in pairs(otherKeys) do
		tech[key] = value
	end
	return tech
end

--[[
	Wrapper methods for pf.unlockHelper, for clarity and brevity. formula is optional.
]]
function pf.unlockUnitHelper(count,packs,seconds,formula)
	if formula ~= nil then
		return pf.unlockHelper("unit", nil, count, packs, seconds, {count_formula = formula})
	else
		return pf.unlockHelper("unit", nil, count, packs, seconds, {})
	end
end

function pf.unlockTriggerHelper(type, triggerItemID, count)
	return pf.unlockHelper(type, triggerItemID, count, nil, nil, {})
end

--[[
	Helper method for constructing a technology trigger.
	string type						"unit" or type of technology trigger.
	string/table triggerItemID		string of trigger item name, or ItemIDFilter. Only required for type ~= "unit". https://lua-api.factorio.com/latest/types/ItemIDFilter.html
	int count						number of research cycles (if unit) or items (if trigger)
	array packs						list of science packs name strings (such as "automation-science-pack") or name & count pairs (such as {"automation-science-pack",2}). Only required for type == "unit".
	int seconds						duration in seconds a unit of technology research takes. Only required for type == "unit".
	table otherKeys					Optional other keys. Only required for type == "scripted".
]]
function pf.unlockHelper(techType, triggerItemID, count, packs, seconds, otherKeys)
	if techType == "unit" then
		unit = {
			["time"] = seconds, 
			["count"] = count
		}
		ingredients = {}
		for i,pack in ipairs(packs) do
			if type(pack) == type("string") then
				table.insert(ingredients, {pack, 1})
			else
				table.insert(ingredients,pack)
			end
		end
		unit.ingredients = ingredients
		unit.count_formula = otherKeys.count_formula
		return {["unit"] = unit}
	else
		trigger = {["type"] = techType}
		if techType == "mine-entity" or techType == "capture-spawner" or techType == "build-entity" then
			trigger.entities = triggerItemID
		elseif techType == "craft-item" then
			trigger.item = triggerItemID
			trigger.count = count or 1
		elseif techType == "craft-fluid" then
			trigger.fluid = triggerItemID
			trigger.amount = count
		elseif techType == "send-item-to-orbit" then
			trigger.item = triggerItemID
		else
			otherKeys = otherKeys or {}
			for key,value in pairs(otherKeys) do
				trigger[key] = value
			end
		end
		return {["research_trigger"] = trigger}
	end
end

--[[
	Helper function. wrapper for unlock-recipe type technology effects
]]
function pf.recipeEffect(recipeID)
	return {type = "unlock-recipe", recipe = recipeID}
end

--[[
	comlpetely hides a recipe in game without deleting its prototype
]]
function pf.hideMe(recipeOrItem)
	recipeOrItem.hidden = true
	recipeOrItem.hidden_in_factoriopedia = true
	if recipeOrItem.type == "recipe" then
		recipeOrItem.hide_from_signal_gui = true
		recipeOrItem.hide_from_player_crafting = true
	end
end

--stolen from more-casting mod
--retrieves the specific prototype of a thing without needing to know its specific subtype
--for example, it can get a science pack (a "tool") when given the base type ("item")
function pf.getPrototype(base_type, name)
    for type_name in pairs(defines.prototypes[base_type]) do
        local prototypes = data.raw[type_name]

        if prototypes and prototypes[name] then
            return prototypes[name]
        end
    end
end

function pf.getLocalisedName(name)
	local item = pf.getPrototype("item",name)

	if not item then 
		log("aborted getLocalisedName")
		return end -- skip non-items.
	if item.localised_name then -- if it has a localised_name defined, return that.
        return item.localised_name
    end

	local prototype
    local type_name = "item"

    if item.place_result then
        prototype =  pf.getPrototype("entity", item.place_result)
        type_name = "entity"
    elseif item.place_as_equipment_result then
        prototype =  pf.getPrototype("equipment", item.place_as_equipment_result)
        type_name = "equipment"
    elseif item.place_as_tile then
        -- Tiles with variations don't have a localised name
        local tile_prototype = data.raw.tile[item.place_as_tile.result]
        if tile_prototype and tile_prototype.localised_name then
            prototype = tile_prototype
            type_name = "tile"
        end
    end

    return prototype and prototype.localised_name or { type_name .. "-name." .. name }

end

return pf