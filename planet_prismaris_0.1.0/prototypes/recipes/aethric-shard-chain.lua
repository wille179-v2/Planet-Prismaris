--pf.recipeFactory(name, icons, ingredients, results, energy_required, categories, otherKeys)

local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"

-- A recipe for debugging only
--[[
data:extend({
	pf.recipeFactory(
		"debug-aethric-shard",
		recipeTempIcon,
		pf.itemIngredientsFactory({}),
		pf.itemResultsFactory({
			{pre .. "aethric-shard",100}
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
		pre .. "aethric-shard-separation",
		recipeTempIcon, --TODO: Placeholder icons
		pf.itemIngredientsFactory({
			{pre .. "aethric-shard",1}
		}),
		pf.itemResultsFactory({
			{pre .. "shattered-aethric-shard-a",1,ip=.1667},
			{pre .. "shattered-aethric-shard-b",1,ip=.1667},
			{pre .. "shattered-aethric-shard-c",1,ip=.1667},
			{pre .. "shattered-aethric-shard-d",1,ip=.1667},
			{pre .. "shattered-aethric-shard-e",1,ip=.1667},
			{pre .. "shattered-aethric-shard-f",1,ip=.1667},
		}),
		4,
		{pre .. "crystal-separation","hand-crafting"},
		keyMerge("a[aethric-shard]-b[separation]",{keys.standard,keys.productivity,keys.aethric,keys.prismarisOnly})
	),
	--[[
	pf.recipeFactory(
		pre .. "aethric-soil",
		recipeTempIcon, --TODO: Placeholder icons
		pf.ingredientsFactory(
			{
				{pre .. "shattered-aethric-shard-f", 1},
				{"landfill", 10}
			},
			{
				{pre .. "liquid-entropy",50},
			}
		),
		pf.itemResultsFactory({
			{pre .. "aethric-soil",10}
		}),
		15,
		{"crafting-with-fluid"},
		keyMerge("d[aethric-soil]",{{subgroup = "terrain"},keys.prismarisOnly,keys.standard})
	)
	]]
})

local destabilizedVariantPairs = {
	{"a","d",recipeTempIcon},
	{"b","a",recipeTempIcon},
	{"c","e",recipeTempIcon},
	{"d","c",recipeTempIcon},
	{"e","f",recipeTempIcon},
	{"f","b",recipeTempIcon}
}

for _,pair in ipairs(destabilizedVariantPairs) do 
	data:extend({
		-- currently set to a 2-to-3 ratio instead of 1-to-1
		pf.recipeFactory(
			pre .. "destabilized-aethric-shard-" .. pair[1],
			pair[3],
			pf.itemIngredientsFactory({
				{pre .. "shattered-aethric-shard-" .. pair[1],2}
			}),
			pf.itemResultsFactory({
				{pre .. "destabilized-aethric-shard-" .. pair[1],3,always_fresh = true},
				{pre .. "shattered-aethric-shard-" .. pair[2],1,ip=.04},
			}),
			2,
			{"crafting","organic"},
			keyMerge("b[destabilized]-" .. pair[1],{keys.standard,keys.productivity,keys.aethric,keys.prismarisOnly,{localised_name = {"recipe-name.prismaris-destabilized-aethric-shard"}}})
		)
	})
end