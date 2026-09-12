local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"

data:extend({
	pf.recipeFactory(
		pre .. "entropic-filtering",
		recipeTempIcon, --TODO: Placeholder icon
		pf.fluidIngredientsFactory({
			{pre .. "liquid-entropy",30}
		}),
		pf.resultsFactory(
			{
				{pre .. "raw-entropic-dust-positive",1}
			},
			{
				{"water",20}
			}
		),
		2,
		{"chemistry","cryogenics"},
		keyMerge("a[entropic-filtering]",{keys.standard,keys.entropic,keys.prismarisOnly})
	),
	pf.recipeFactory(
		pre .. "entropic-refinement",
		recipeTempIcon,  --TODO: Placeholder icon
		pf.itemIngredientsFactory({
			{pre .. "raw-entropic-dust-positive",1}
		}),
		pf.itemResultsFactory({
			{pre .. "refined-entropic-dust-positive",1,always_fresh = true}
		}),
		0.5,
		{"smelting"},
		keyMerge("b[entropic-refinement]",{keys.standard,keys.entropic})
	),
	pf.recipeFactory(
		pre .. "entropic-nurturing",
		recipeTempIcon,  --TODO: Placeholder icon
		pf.itemIngredientsFactory({
			{pre .. "refined-entropic-dust-positive",5}
		}),
		pf.itemResultsFactory({
			{pre .. "entropic-nutrients",5,always_fresh = true}
		}),
		2,
		{"crafting","organic"},
		keyMerge("c[entropic-nutrients]",{keys.standard,keys.entropic})
	)
})