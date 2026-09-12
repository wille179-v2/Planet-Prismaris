--pf.recipeFactory(name, icons, ingredients, results, energy_required, categories, otherKeys)

local pre = prismarisConstants.prototypePrefix
local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"

-- A recipe for debugging only
--[[
data:extend({
	pf.recipeFactory(
		"debug-prismatic-shard",
		recipeTempIcon,
		pf.itemIngredientsFactory({}),
		pf.itemResultsFactory({
			{pre .. "prismatic-shard",100}
		}),
		1,
		{"crafting","hand-crafting"},
		{
			subgroup = "other",
			enabled = false,
			order = "zzz",
		}

	)
})
]]

data:extend({
	pf.recipeFactory(
		pre .. "prismatic-shard-separation",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "prismatic-shard",1}
		}),
		pf.itemResultsFactory({
			{pre .. "activated-prismatic-shard-r",1,sp={min=0,max=0.25}},
			{pre .. "activated-prismatic-shard-g",1,sp={min=0.25,max=0.5}},
			{pre .. "activated-prismatic-shard-b",1,sp={min=0.5,max=0.75}},
			{pre .. "activated-prismatic-shard-w",1,sp={min=0.75,max=1}},
			{pre .. "activated-prismatic-shard-c",1,sp={min=0,max=0.25}},
			{pre .. "activated-prismatic-shard-m",1,sp={min=0.25,max=0.5}},
			{pre .. "activated-prismatic-shard-y",1,sp={min=0.5,max=0.75}},
			{pre .. "activated-prismatic-shard-k",1,sp={min=0.75,max=1}},
		}),
		4,
		{pre .. "crystal-separation","hand-crafting"},
		keyMerge("a[prismatic-shard]-b[separation]",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly})
	),
	pf.recipeFactory(
		pre .."shard-illumination",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "activated-prismatic-shard-k",1}
		}),
		pf.itemResultsFactory({
			{pre .. "activated-prismatic-shard-w",1,ip=.90,always_fresh = true}
		}),
		1,
		{"advanced-crafting"},
		keyMerge("c[shard-cycling]",{keys.standard,keys.prismatic,keys.prismarisOnly,{allow_quality = false}})
	),
	pf.recipeFactory(
		pre .."shard-obscuring",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "activated-prismatic-shard-w",1}
		}),
		pf.itemResultsFactory({
			{pre .. "activated-prismatic-shard-k",1,ip=.90,always_fresh = true}
		}),
		1,
		{"advanced-crafting"},
		keyMerge("c[shard-cycling]",{keys.standard,keys.prismatic,keys.prismarisOnly,{allow_quality = false}})
	),
	pf.recipeFactory(
		pre .. "ferric-shard-synthesis",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "activated-prismatic-shard-r",2}, -- Overuse of iron biases the system white
			{pre .. "activated-prismatic-shard-c",1}
		}),
		pf.itemResultsFactory({
			{pre .. "ferric-shard",2}
		}),
		2,
		{"advanced-crafting"},
		keyMerge("d[resource-shard]-a[ferric]",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly})
	),
	pf.recipeFactory(
		pre .. "cupric-shard-synthesis",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "activated-prismatic-shard-g",1},
			{pre .. "activated-prismatic-shard-m",2} -- Overuse of copper biases the system black
		}),
		pf.itemResultsFactory({
			{pre .. "cupric-shard",2}
		}),
		2,
		{"advanced-crafting"},
		keyMerge("d[resource-shard]-b[cupric]",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly})
	),
	pf.recipeFactory(
		pre .. "lithic-shard-synthesis",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "activated-prismatic-shard-b",2}, -- stone is just expensive, but is color neutral
			{pre .. "activated-prismatic-shard-y",2}
		}),
		pf.itemResultsFactory({
			{pre .. "lithic-shard",2}
		}),
		2,
		{"advanced-crafting"},
		keyMerge("d[resource-shard]-c[lithic]",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly})
	),
	pf.recipeFactory(
		pre .. "ferric-shard-cracking",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "ferric-shard",1}
		}),
		pf.itemResultsFactory({
			{"iron-ore",2},
			--{pre .. "activated-prismatic-shard-r",1,ip=.04},
			{pre .. "activated-prismatic-shard-g",1,ip=.04},
			{pre .. "activated-prismatic-shard-b",1,ip=.04},
			--{pre .. "activated-prismatic-shard-c",1,ip=.04},
			{pre .. "activated-prismatic-shard-m",1,ip=.04},
			{pre .. "activated-prismatic-shard-y",1,ip=.04},
		}),
		1,
		{"advanced-crafting","metallurgy"},
		keyMerge("d[resource-shard]-a[ferric]-b",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly,keys.mainProduct("iron-ore")})
	),
	pf.recipeFactory(
		pre .. "cupric-shard-cracking",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "cupric-shard",1}
		}),
		pf.itemResultsFactory({
			{"copper-ore",2},
			{pre .. "activated-prismatic-shard-r",1,ip=.04},
			--{pre .. "activated-prismatic-shard-g",1,ip=.04},
			{pre .. "activated-prismatic-shard-b",1,ip=.04},
			{pre .. "activated-prismatic-shard-c",1,ip=.04},
			--{pre .. "activated-prismatic-shard-m",1,ip=.04},
			{pre .. "activated-prismatic-shard-y",1,ip=.04},
		}),
		1,
		{"advanced-crafting","metallurgy"},
		keyMerge("d[resource-shard]-b[cupric]-b",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly,keys.mainProduct("copper-ore")})
	),
	pf.recipeFactory(
		pre .. "lithic-shard-cracking",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "lithic-shard",1}
		}),
		pf.itemResultsFactory({
			{"stone",2},
			{pre .. "activated-prismatic-shard-r",1,ip=.04},
			{pre .. "activated-prismatic-shard-g",1,ip=.04},
			--{pre .. "activated-prismatic-shard-b",1,ip=.04},
			{pre .. "activated-prismatic-shard-c",1,ip=.04},
			{pre .. "activated-prismatic-shard-m",1,ip=.04},
			--{pre .. "activated-prismatic-shard-y",1,ip=.04},
		}),
		1,
		{"advanced-crafting","metallurgy"},
		keyMerge("d[resource-shard]-c[lithic]-b",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly,keys.mainProduct("stone")})
	),
})