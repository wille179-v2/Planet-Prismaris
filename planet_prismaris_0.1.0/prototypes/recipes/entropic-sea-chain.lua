local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"
local icons = prismarisConstants.iconsPath
local fluidIcons = prismarisConstants.iconsPath .. "fluid/"

data:extend({
	pf.recipeFactory(
		pre .. "entropic-filtering",
		{
			{icon = fluidIcons .. "liquid-entropy.png", scale = .33, shift = {0,-2}},
			{icon = baseIcons .. "fluid/water.png", scale = 0.2, shift = {8,8}},
			{icon = icons .. "raw-entropic-dust-pos-1.png", scale = 0.2, shift = {-8,8}}
		},
		pf.fluidIngredientsFactory({
			{pre .. "liquid-entropy",40}
		}),
		pf.resultsFactory(
			{
				{pre .. "raw-entropic-dust-positive",2,sp={min = 0, max = 0.5}},
				{pre .. "raw-entropic-dust-negative",2, sp = {min = 0.5, max = 1}}
			},
			{
				{"water",40}
			}
		),
		0.5,
		{"chemistry","cryogenics"},
		keyMerge("a[entropic-filtering]",{keys.standard,keys.entropic,keys.prismarisOnly,keys.tint(color.entropy)})
	),
	pf.recipeFactory(
		pre .. "entropic-refinement",
		icons .. "entropic-refinement.png",
		pf.itemIngredientsFactory({
			{pre .. "raw-entropic-dust-positive",1}
		}),
		pf.itemResultsFactory({
			{pre .. "refined-entropic-dust-positive",1,always_fresh = true}
		}),
		0.5,
		{"smelting"},
		keyMerge("b[entropic-refinement]",{keys.standard,keys.entropic,keys.tint(color.entropy)})
	),
	pf.recipeFactory(
		pre .. "entropic-nutrients",
		icons .. "entropic-nutrients.png",
		pf.itemIngredientsFactory({
			{pre .. "refined-entropic-dust-positive",5}
		}),
		pf.itemResultsFactory({
			{pre .. "entropic-nutrients",5,always_fresh = true}
		}),
		2,
		{"crafting","organic"},
		keyMerge("c[entropic-nutrients]",{keys.standard,keys.entropic,keys.tint(color.entropy)})
	)
})