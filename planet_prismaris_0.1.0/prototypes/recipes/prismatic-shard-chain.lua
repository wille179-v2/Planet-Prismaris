--pf.recipeFactory(name, icons, ingredients, results, energy_required, categories, otherKeys)

local pre = prismarisConstants.prototypePrefix
local saIcons = "__space-age__/graphics/icons/"
local baseIcons = "__base__/graphics/icons/"
local prisIcons = prismarisConstants.iconsPath
local recipeTempIcon = prisIcons .. "recipe-temp.png"

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
		prisIcons .. "prismatic-shard-separation.png",
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
		prisIcons .. "shard-illumination.png",
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
		prisIcons .. "shard-obscuring.png",
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
		pre .. "ferric-shard",
		prisIcons .. "ferric-shard.png",
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
		pre .. "cupric-shard",
		prisIcons .. "cupric-shard.png",
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
		pre .. "lithic-shard",
		prisIcons .. "lithic-shard.png",
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
		pre .. "cracked-ferric-shard",
		prisIcons .. "ferric-shard-cracked.png",
		pf.itemIngredientsFactory({
			{pre .. "ferric-shard",1}
		}),
		pf.itemResultsFactory({
			{pre .. "cracked-ferric-shard",prismarisConstants.shardCrackingYield},
			--{pre .. "activated-prismatic-shard-r",1,ip=.04},
			{pre .. "activated-prismatic-shard-g",1,ip=.04},
			{pre .. "activated-prismatic-shard-b",1,ip=.04},
			--{pre .. "activated-prismatic-shard-c",1,ip=.04},
			{pre .. "activated-prismatic-shard-m",1,ip=.04},
			{pre .. "activated-prismatic-shard-y",1,ip=.04},
		}),
		prismarisConstants.shardCrackingSpeed,
		{"advanced-crafting",pre .. "thermal-cracking"},
		keyMerge("d[resource-shard]-a[ferric]-b",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly,keys.preserveInMachine})
	),
	pf.recipeFactory(
		pre .. "cracked-cupric-shard",
		prisIcons .. "cupric-shard-cracked.png",
		pf.itemIngredientsFactory({
			{pre .. "cupric-shard",1}
		}),
		pf.itemResultsFactory({
			{pre .. "cracked-cupric-shard",prismarisConstants.shardCrackingYield},
			{pre .. "activated-prismatic-shard-r",1,ip=.04},
			--{pre .. "activated-prismatic-shard-g",1,ip=.04},
			{pre .. "activated-prismatic-shard-b",1,ip=.04},
			{pre .. "activated-prismatic-shard-c",1,ip=.04},
			--{pre .. "activated-prismatic-shard-m",1,ip=.04},
			{pre .. "activated-prismatic-shard-y",1,ip=.04},
		}),
		prismarisConstants.shardCrackingSpeed,
		{"advanced-crafting",pre .. "thermal-cracking"},
		keyMerge("d[resource-shard]-b[cupric]-b",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly,keys.preserveInMachine})
	),
	pf.recipeFactory(
		pre .. "cracked-lithic-shard",
		prisIcons .. "lithic-shard-cracked.png",
		pf.itemIngredientsFactory({
			{pre .. "lithic-shard",1}
		}),
		pf.itemResultsFactory({
			{pre .. "cracked-lithic-shard",prismarisConstants.shardCrackingYield},
			{pre .. "activated-prismatic-shard-r",1,ip=.04},
			{pre .. "activated-prismatic-shard-g",1,ip=.04},
			--{pre .. "activated-prismatic-shard-b",1,ip=.04},
			{pre .. "activated-prismatic-shard-c",1,ip=.04},
			{pre .. "activated-prismatic-shard-m",1,ip=.04},
			--{pre .. "activated-prismatic-shard-y",1,ip=.04},
		}),
		prismarisConstants.shardCrackingSpeed,
		{"advanced-crafting",pre .. "thermal-cracking"},
		keyMerge("d[resource-shard]-c[lithic]-b",{keys.standard,keys.productivity,keys.prismatic,keys.prismarisOnly,keys.preserveInMachine})
	),
})