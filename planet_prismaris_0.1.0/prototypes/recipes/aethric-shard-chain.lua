--pf.recipeFactory(name, icons, ingredients, results, energy_required, categories, otherKeys)

local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"
local prisIcons = prismarisConstants.iconsPath

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
		prisIcons .. "aethric-shard-separation.png",
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
		keyMerge("b[aethric-shard]-b[separation]",{keys.standard,keys.productivity,keys.aethric,keys.prismarisOnly})
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

function destabilizedIcon(littleIcon)
	return {{icon = prisIcons .. "destabilized-aethric-shard.png", shift = {-1,-1}, scale = 0.45},{icon = littleIcon, shift = {8,8}, scale = 0.25}}
end

local destabilizedVariantPairs = {
	{"a","d",destabilizedIcon(saIcons .. "calcite.png")},
	{"b","a",destabilizedIcon(baseIcons .. "coal.png")},
	{"c","e",destabilizedIcon(saIcons .. "carbon.png")},
	{"d","c",destabilizedIcon(baseIcons .. "solid-fuel.png")},
	{"e","f",destabilizedIcon(saIcons .. "jelly.png")},
	{"f","b",destabilizedIcon(saIcons .. "yumako-mash.png")}
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
			keyMerge("d[destabilized]-" .. pair[1],{keys.standard,keys.productivity,keys.aethric,keys.prismarisOnly,{localised_name = {"recipe-name.prismaris-destabilized-aethric-shard"}}})
		)
	})
end