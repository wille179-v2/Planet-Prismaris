utils = require("utils")
merge = utils.merge
pf = require("prototypeFactory")
local modName = "__planet_prismaris__"

----------------------------------------------------
-- Bookkeeping & Utilities --
----------------------------------------------------

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
	-- Control & cosmetic variables for mod balance; used in many places across the mod
	slowSpoilTime = 90,
	mediumSpoilTime = 60,
	fastSpoilTime = 30,
	voidFluidRatio = 0.8,
	shardCrackingSpeed = 3.2,
	shardCrackingYield = 4,
	laserTintsAndTypes = {
		-- First value is tint
		-- Second value is damage type
		-- Third value is an order string for sorting
		-- Fourth value is the cmy or rgb letter for the crafting recipe
		{{0.8,0.05,0.05},"fire","b","r"}, --R
		{{0.75,0.75,0.05},"explosion","c","y"}, --Y
		{{0.05,0.8,0.05},"acid","d","g"}, --G
		{{0.05,0.75,0.75},"poison","e","c"}, --C
		{{0.05,0.05,0.8},"electric","f","b"}, --B
		{{0.75,0.05,0.75},"physical","g","m"}, --M
	},
	teslaTintsAndTypes = {
		-- First value is tint
		-- Second value is damage type
		-- Third value is an order string for sorting
		-- Fourth value is the cmy or rgb letter for the crafting recipe
		{{0.8,0.05,0.05},"fire","b","r"}, --R
		{{0.75,0.75,0.05},"explosion","c","y"}, --Y
		{{0.05,0.8,0.05},"acid","d","g"}, --G
		{{0.05,0.75,0.75},"poison","e","c"}, --C
		{{0.05,0.05,0.8},"laser","f","b"}, --B
		{{0.75,0.05,0.75},"physical","g","m"}, --M
	}
}

color = {
	entropy = {
		{.95,.95,.95},
		{.05,.05,.05},
		{.95,.95,.95},
		{.05,.05,.05},
	},
	rawVoid = {
		{255,235,109},
		{217,109,203},
		{255,235,109},
		{217,109,203},
	},
	concentratedVoid = {
		{234,184,32},
		{206,164,255},
		{234,184,32},
		{206,164,255},
	},
	distortedVoid = {
		{191,119,0},
		{236,69,237},
		{191,119,0},
		{236,69,237},
	},
	stabilizedVoid = {
		{255,244,165},
		{255,167,255},
		{255,244,165},
		{255,167,255},
	},
	polyRed = {
		{255,10,10},
		{128,10,10},
		{10,255,10},
		{10,10,255},
	},
	polyGreen = {
		{10,255,10},
		{10,128,10},
		{10,10,255},
		{255,10,10},
	},
	polyBlue = {
		{10,10,255},
		{10,10,128},
		{255,10,10},
		{10,255,10},
	}
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
	catalyst = {
		subgroup = "prismaris-cogitor-catalyst"
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
	science = {
		subgroup = "prismaris-science-pack",
		lab_ignores_spoil_percent = settings.startup["prismaris-easy-labs-ignore-spoil-percent"].value
		--allow_productivity = true
	},
	accelerationLossExempt = {
		is_acceleration_loss_exempt = true --Custom flag for use later in auto-generated acceleration recipes
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
	---- Parameterized Keys ----
	subgroup = function(sub)
		return {subgroup = sub}
	end,
	factoriopediaLocale = function(name)
		return {factoriopedia_description = {"factoriopedia-description."..name}}
	end,
	mainProduct = function(name)
		return {main_product = name}
	end,
	rocketCapacity = function(stackSize, numStacks)
		return {
			weight = math.floor(1000000 / (stackSize * numStacks))
		}
	end,
	-- Alternate graphics for items on belts
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
	-- Crafting machine tints
	tint = function(colors) -- call as either tint{r,g,b} or tint({{r1,g1,b1}, {r2,g2,b2}, ...})
		if type(colors[1]) == type(1) then -- if given one set of rgb or rgba values
			return {
				crafting_machine_tint = {
					primary = colors
				}
			}
		else -- if given an ordered table of multiple colors
			colors = colors or {}
			return {
				crafting_machine_tint = {
					primary = colors[1],
					secondary = colors[2],
					tertiary = colors[3],
					quaternary = colors[4]
				}
			}
		end
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

----------------------------------------------------
-- Project Imports --
----------------------------------------------------

--World generation
require("prototypes.autoplace-controls")
require("prototypes.space.planet")
require("prototypes.space.planet-prismaris-map-gen")
require("prototypes.resource")
require("prototypes.tile.tiles")

--Basic items
require("prototypes.item")
require("prototypes.fluid")
require("prototypes.technology")

--Recipes
require("prototypes.recipes.prismatic-shard-chain")
require("prototypes.recipes.aethric-shard-chain")
require("prototypes.recipes.entropic-sea-chain")
require("prototypes.recipes.void-essence-chain")
require("prototypes.recipes.advanced-recipes")

--Buildings
require("prototypes.entities.buildings")
require("prototypes.entities.laser-turrets")
require("prototypes.entities.tesla-turrets")
require("prototypes.entities.plants")
require("prototypes.entities.explosions")


----------------------------------------------------
-- General data-stage game tweaks --
----------------------------------------------------

--Uses planetsLib to enable crafting the lightning rod on prismaris. May be removed if a custom variant is added later.
PlanetsLib.relax_surface_conditions(data.raw.recipe["lightning-collector"], {property = "magnetic-field", min = 93})
PlanetsLib.relax_surface_conditions(data.raw.recipe["lightning-rod"], {property = "magnetic-field", min = 93})


-- Inserts "Acceleration/Reverse/Stasis Chronocycling" categories into factoriopedia as recycling alternatives
table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, pre .. "acceleration-chronocycling")
table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, pre .. "reverse-chronocycling")
table.insert(data.raw["utility-constants"].default.factoriopedia_recycling_recipe_categories, pre .. "stasis-chronocycling")