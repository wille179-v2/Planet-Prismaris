utils = require("utils")
merge = utils.merge
pf = require("prototypeFactory")

local modName = "__planet_prismaris__"

-- constants for use anywhere in the mod. Editing here should update everything everywhere.
prismarisConstants = {
	["modName"] = modName,
	prototypePrefix = "prismaris-",
	graphicsPath = modName .. "/graphics/",
	entityGraphicsPath = modName .. "/graphics/entity/",
	iconsPath = modName .. "/graphics/icons/",
	terrainPath = modName .. "/graphics/terrain/",
	technologyIconsPath = modName .. "/graphics/technology/",
	soundPath = modName .. "/sound",
	-- Control variables for mod balance; used in many places across the mod
	slowSpoilTime = 60,
	mediumSpoilTime = 30,
	fastSpoilTime = 15,
	voidFluidRatio = 0.8
}

-- Keys for use in various recipes and items; use keyMerge and a list of keys in the otherKeys variable of recipeFactory and itemFactory.
keys = {
	standard = {
		enabled = false,
		auto_recycle = false
	},
	prismarisOnly = {
		surface_conditions = {
			{property = "magnetic-field",min = 93,max = 93},
			{property = "pressure",min=1100,max=1100}
		}
	},
	productivity = {
		allow_productivity = true
	},
	prismatic = {
		subgroup = "prismaris-processes-prismatic"
	},
	aethric = {
		subgroup = "prismaris-processes-aethric"
	},
	entropic = {
		subgroup = "prismaris-processes-entropic"
	},
	void = {
		subgroup = "prismaris-processes-void"
	},
	technical = {
		subgroup = "prismaris-processes-technical"
	},
	production = {
		subgroup = "production-machine"
	},
	smelting = {
		subgroup = "smelting-machine"
	},
	subgroup = function(sub)
		return {subgroup = sub}
	end,
	science = {
		subgroup = "science-pack",
		lab_ignores_spoil_percent = settings.startup["prismaris-easy-labs-ignore-spoil-percent"].value
		--allow_productivity = true
	},
	cogitorProcessing = {
		enabled = false,
		auto_recycle = false,
		subgroup = "prismaris-cogitor-transmute",
		hide_from_player_crafting = true,
		hide_from_stats = true,
		allow_decomposition = false,
		unlock_results = false,
		preserve_products_in_machine_output = true,
	},
	accelerationLossExempt = {
		is_acceleration_loss_exempt = true
	},
	factoriopediaLocale = function(name)
		return {factoriopedia_description = {"factoriopedia-description."..name}}
	end,
	mainProduct = function(name)
		return {main_product = name}
	end,
	altItemGraphics = function(filenameList, mips)
		local pics = {}
		for _,path in ipairs(filenameList or {}) do
			table.insert(pics, {
				size = 64,
				filename = path,
				scale = 0.5,
				mipmap_count = mips or 0
			})
		end
		return {
			pictures = pics
		}
	end,
}

pre = prismarisConstants.prototypePrefix

function keyMerge(orderString,tables)
	--log(serpent.block(tables))
	tables = tables or {}
	result = {order=orderString}
	for _,keyTable in ipairs(tables) do
		result = merge{result,keyTable}
	end
	return result
end

require("prototypes.autoplace-controls")

require("prototypes.space.planet")
require("prototypes.space.planet-prismaris-map-gen")
require("prototypes.item")
require("prototypes.fluid")
require("prototypes.technology")

require("prototypes.recipes.prismatic-shard-chain")
require("prototypes.recipes.aethric-shard-chain")
require("prototypes.recipes.entropic-sea-chain")
require("prototypes.recipes.void-essence-chain")
require("prototypes.recipes.advanced-recipes")

require("prototypes.entities.buildings")
require("prototypes.entities.plants")
require("prototypes.entities.explosions")
require("prototypes.resource")
require("prototypes.tile.tiles")

--Uses planetsLib to enable crafting the lightning rod on prismaris. May be removed if a custom variant is added later.
PlanetsLib.relax_surface_conditions(data.raw.recipe["lightning-collector"], {property = "magnetic-field", min = 93})
PlanetsLib.relax_surface_conditions(data.raw.recipe["lightning-rod"], {property = "magnetic-field", min = 93})


-- Inserts "Acceleration/Reverse/Stasis Chronocycling" categories into factoriopedia as recycling alternatives
table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, pre .. "acceleration-chronocycling")
table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, pre .. "reverse-chronocycling")
table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, pre .. "stasis-chronocycling")