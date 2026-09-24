local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"
local color = color

local stabilizeConcentrateRatio = 5/4
local bulkVolume = 200
local recipeTime = 10

data:extend({
	pf.recipeFactory(
		pre .. "void-essence-refinement",
		recipeTempIcon, -- TODO: Placeholder icons
		pf.ingredientsFactory(
			{
				{pre .. "refined-entropic-dust-positive",1}
			},
			{
				{pre .. "raw-void-essence",100}
			}
		),
		pf.fluidResultsFactory({
			{pre .. "concentrated-void-essence",100}
		}),
		4,
		{"oil-processing"},
		keyMerge("a[void]-a[refine]",{
			keys.standard,
			keys.void,
			keys.prismarisOnly,
			keys.productivity,
			keys.tint(color.rawVoid)})
	),
	pf.recipeFactory(
		pre .. "void-essence-stabilization",
		recipeTempIcon, -- TODO: Placeholder icons
		pf.ingredientsFactory(
			{
				{pre .. "refined-entropic-dust-positive",1}
			},
			{
				{pre .. "distorted-void-essence",stabilizeConcentrateRatio * bulkVolume},
				{"water",50}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "raw-entropic-dust-negative",1,ip=.1,ignored_by_productivity=1}
			},
			{
				{pre .. "stabilized-void-essence", stabilizeConcentrateRatio * bulkVolume * prismarisConstants.voidFluidRatio}
			}
		),
		recipeTime,
		{"chemistry","cryogenics"},
		keyMerge("a[void]-b[stabilize]",{
				keys.standard,
				keys.void,
				keys.productivity,
				keys.mainProduct(pre .. "stabilized-void-essence"),
				keys.tint(color.distortedVoid)
		})
	),
	pf.recipeFactory(
		pre .. "void-essence-concentration",
		recipeTempIcon,
		pf.ingredientsFactory(
			{
				{pre .. "refined-entropic-dust-positive",1}
			},
			{
				{pre .. "stabilized-void-essence",(1/stabilizeConcentrateRatio) * bulkVolume},
			}
		),
		pf.resultsFactory(
			{
				{pre .. "raw-entropic-dust-negative",1,ip=.25,ignored_by_productivity=1}
			},
			{
				{pre .. "concentrated-void-essence", (1/stabilizeConcentrateRatio) * bulkVolume * prismarisConstants.voidFluidRatio},
				{"water",10,ignored_by_productivity=10}
			}
		),
		recipeTime,
		{"chemistry","cryogenics"},
		keyMerge("a[void]-c[concentrate]",{
			keys.standard,
			keys.void,
			keys.productivity,
			keys.mainProduct(pre .. "concentrated-void-essence"),
			keys.tint(color.stabilizedVoid)
		})
	)
})