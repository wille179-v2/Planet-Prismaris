local saIcons = "__space-age__/graphics/icons/"
local baseIcons = "__base__/graphics/icons/"
local recipeTempIcon = prismarisConstants.iconsPath .. "recipe-temp.png"
local prisIcons = prismarisConstants.iconsPath -- The REAL icons. Anything using this is semi-final art.

local distort = function(fluidAmount)
	return fluidAmount * prismarisConstants.voidFluidRatio
end


-- Flux Capacitor Chain
data:extend({
	pf.recipeFactory(
		pre .. "flux-capacitor",
		prisIcons .. "active-flux-capacitor.png",
		pf.ingredientsFactory(
			{
				{pre .. "shattered-aethric-shard-f",1},
				{pre .. "activated-prismatic-shard-w",1},
				{pre .. "activated-prismatic-shard-k",1},
				{"advanced-circuit",5}

			},
			{
				{pre .. "concentrated-void-essence",100}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "charging-flux-capacitor",1, always_fresh = true}
			},
			{
				{pre .. "distorted-void-essence",distort(100)}
			}
		),
		10,
		{"crafting-with-fluid","electromagnetics"},
		keyMerge(nil,{keys.standard,keys.prismarisOnly,keys.technical,keys.productivity})
	),
	pf.recipeFactory(
		pre .. "reset-flux-capacitor",
		{
			{icon = prisIcons .. "discharged-flux-capacitor.png"},
			{icon = baseIcons .. "arrows/signal-clockwise-circle-arrow.png",shift = {8,8}, scale = 0.25}
		},
		pf.ingredientsFactory(
			{
				{pre .. "discharged-flux-capacitor",1},
				{pre .. "refined-entropic-dust-positive",1},
			},
			{
				{pre .. "concentrated-void-essence",100}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "charging-flux-capacitor",1, always_fresh = true,ip = .95,ignored_by_productivity = 1},
				{pre .. "raw-entropic-dust-negative",1,ip=.1,ignored_by_productivity =1 }
			},
			{
				{pre .. "distorted-void-essence",distort(100),ignored_by_productivity = distort(100)}
			}
		),
		10,
		{"crafting-with-fluid","electromagnetics"},
		keyMerge(nil,{keys.standard,keys.prismarisOnly,keys.technical})
	)
})

-- Science Pack Chain
data:extend({
	-- Red variant is most expensive in terms of fluid usage but has chance of bonus product.
	pf.recipeFactory(
		pre .. "red-polyphasic-science-pack",
		prisIcons .. "polyphasic-science-pack-r.png",
		pf.ingredientsFactory(
			{
				{pre .. "activated-prismatic-shard-r",1},
				{pre .. "activated-prismatic-shard-y",1},
				{pre .. "active-flux-capacitor",1},
			},
			{
				{pre .. "liquid-entropy",200},
				{pre .. "concentrated-void-essence",200}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "red-polyphasic-science-pack",amount_min = 1, amount_max = 2,always_fresh = true}
			},
			{
				{pre .. "distorted-void-essence",distort(200)}
			}
		),
		10,
		{"chemistry","metallurgy"},
		keyMerge("i-a",{keys.standard,keys.science,keys.prismarisOnly,keys.productivity,keys.mainProduct(pre.."red-polyphasic-science-pack")})
	),
	-- Blue Variant is cheapest in terms of fluid usage.
	pf.recipeFactory(
		pre .. "blue-polyphasic-science-pack",
		prisIcons .. "polyphasic-science-pack-b.png",
		pf.ingredientsFactory(
			{
				{pre .. "activated-prismatic-shard-b",1},
				{pre .. "activated-prismatic-shard-m",1},
				{pre .. "active-flux-capacitor",1},
			},
			{
				{pre .. "liquid-entropy",50},
				{pre .. "concentrated-void-essence",50}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "blue-polyphasic-science-pack",1,always_fresh = true}
			},
			{
				{pre .. "distorted-void-essence",distort(50)}
			}
		),
		8,
		{"chemistry","electromagnetics"},
		keyMerge("i-b",{keys.standard,keys.science,keys.prismarisOnly,keys.productivity,keys.mainProduct(pre .. "blue-polyphasic-science-pack")})
	),
	-- Green Variant has average baseline cost but is significantly faster time-wise.
	pf.recipeFactory(
		pre .. "green-polyphasic-science-pack",
		prisIcons .. "polyphasic-science-pack-g.png",
		pf.ingredientsFactory(
			{
				{pre .. "activated-prismatic-shard-g",1},
				{pre .. "activated-prismatic-shard-c",1},
				{pre .. "active-flux-capacitor",1},
			},
			{
				{pre .. "liquid-entropy",100},
				{pre .. "concentrated-void-essence",100}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "green-polyphasic-science-pack",1,always_fresh = true}
			},
			{
				{pre .. "distorted-void-essence",distort(100)}
			}
		),
		2,
		{"chemistry","organic"},
		keyMerge("i-c",{keys.standard,keys.science,keys.prismarisOnly,keys.productivity,keys.mainProduct(pre .. "green-polyphasic-science-pack")})
	),
})

-- Catalytic Crystal Set
data:extend({
	pf.recipeFactory(
		pre .. "basic-catalytic-crystal",
		recipeTempIcon, --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"automation-science-pack",100},
			{"logistic-science-pack",100},
			{"military-science-pack",100},
			{"chemical-science-pack",100},
			{pre .. "active-flux-capacitor",1, ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{pre .. "basic-catalytic-crystal-dormant",1,always_fresh = true},
			{pre .. "discharged-flux-capacitor",1, ip = 0.95, ignored_by_stats = 1}
		}),
		30,
		{"advanced-crafting"},
		keyMerge("b[catalytic-crystal]-a[basic]-b[dormant]",{keys.standard,keys.prismarisOnly,keys.technical})
	),
	pf.recipeFactory(
		pre .. "advanced-catalytic-crystal",
		recipeTempIcon, --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"production-science-pack",100},
			{"utility-science-pack",100},
			{"space-science-pack",100},
			{pre .. "active-flux-capacitor",1, ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{pre .. "advanced-catalytic-crystal-dormant",1,always_fresh = true},
			{pre .. "discharged-flux-capacitor",1, ip = 0.90, ignored_by_stats = 1}
		}),
		30,
		{"advanced-crafting"},
		keyMerge("b[catalytic-crystal]-b[advanced]-b[dormant]",{keys.standard,keys.prismarisOnly,keys.technical})
	),
	pf.recipeFactory(
		pre .. "alien-catalytic-crystal",
		recipeTempIcon, --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"metallurgic-science-pack",100},
			{"electromagnetic-science-pack",100},
			{"agricultural-science-pack",100},
			{pre .. "active-flux-capacitor",1, ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{pre .. "alien-catalytic-crystal-dormant",1,always_fresh = true},
			{pre .. "discharged-flux-capacitor",1, ip = 0.85, ignored_by_stats = 1}
		}),
		30,
		{"advanced-crafting"},
		keyMerge("b[catalytic-crystal]-c[alien]-b[dormant]",{keys.standard,keys.prismarisOnly,keys.technical})
	),
	pf.recipeFactory(
		pre .. "promethium-catalytic-crystal",
		recipeTempIcon, --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"cryogenic-science-pack",100},
			{"promethium-science-pack",100},
			{pre .. "active-flux-capacitor",1, ignored_by_stats = 1}
		}),
		pf.itemResultsFactory({
			{pre .. "promethium-catalytic-crystal-dormant",1,always_fresh = true},
			{pre .. "discharged-flux-capacitor",1, ip = 0.80, ignored_by_stats = 1}
		}),
		30,
		{"advanced-crafting"},
		keyMerge("b[catalytic-crystal]-d[promethium]-b[dormant]",{keys.standard,keys.prismarisOnly,keys.technical})
	),
})

-- Cogitor & Cogitor processing recipes

local cogitorScienceCost = 20
local stepDelta = 5
local cogitorScienceReturn = cogitorScienceCost - stepDelta

local cogitorScienceCycleBonus = {
	basic = 3 * stepDelta,
	advanced = 2 * stepDelta,
	alien = 2 * stepDelta,
	promethium = 0
}

data:extend({
	pf.recipeFactory(
		pre .. "cogitor",
		prismarisConstants.iconsPath .. "cogitor.png",
		pf.ingredientsFactory(
			{
				{"advanced-circuit",20},
				{"processing-unit",20},
				{"refined-concrete",50},
				{"carbon-fiber",10},
				{pre .. "active-flux-capacitor",5}
			},
			{
				{pre .. "concentrated-void-essence",200}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "cogitor",1}
			},
			{
				{pre .. "distorted-void-essence", distort(200)}
			}
		),
		30,
		{"crafting-with-fluid","electromagnetics"},
		keyMerge("y[cogitor]",{{enabled=false},keys.prismarisOnly,keys.subgroup("prismaris-cogitor"),{main_product = pre .. "cogitor"}})
	),
	pf.recipeFactory(
		pre .. "automation-to-logistic-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"automation-science-pack",cogitorScienceCost},
			{pre .. "basic-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"logistic-science-pack",cogitorScienceReturn},
			{pre .. "basic-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('a[basic]-a[automation]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "logistic-to-military-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"logistic-science-pack",cogitorScienceCost},
			{pre .. "basic-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"military-science-pack",cogitorScienceReturn},
			{pre .. "basic-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('a[basic]-b[logistic]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "military-to-chemical-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"military-science-pack",cogitorScienceCost},
			{pre .. "basic-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"chemical-science-pack",cogitorScienceReturn},
			{pre .. "basic-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('a[basic]-c[military]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "chemical-to-automation-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"chemical-science-pack",cogitorScienceCost},
			{pre .. "basic-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"automation-science-pack",cogitorScienceReturn},
			{pre .. "basic-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('a[basic]-d[chemical]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "utility-to-production-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"utility-science-pack",cogitorScienceCost},
			{pre .. "advanced-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"production-science-pack",cogitorScienceReturn},
			{pre .. "advanced-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('b[advanced]-a[utility]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "production-to-space-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"production-science-pack",cogitorScienceCost},
			{pre .. "advanced-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"space-science-pack",cogitorScienceReturn},
			{pre .. "advanced-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('b[advanced]-b[production]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "space-to-utility-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"space-science-pack",cogitorScienceCost},
			{pre .. "advanced-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"utility-science-pack",cogitorScienceReturn},
			{pre .. "advanced-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('b[advanced]-c[space]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "electromagnetic-to-agricultural-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"electromagnetic-science-pack",cogitorScienceCost},
			{pre .. "alien-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"agricultural-science-pack",cogitorScienceReturn},
			{pre .. "alien-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('c[alien]-a[electromagnetic]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "agricultural-to-metallurgic-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"agricultural-science-pack",cogitorScienceCost},
			{pre .. "alien-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"metallurgic-science-pack",cogitorScienceReturn},
			{pre .. "alien-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('c[alien]-b[agricultural]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "metallurgic-to-electromagnetic-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"metallurgic-science-pack",cogitorScienceCost},
			{pre .. "alien-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"electromagnetic-science-pack",cogitorScienceReturn},
			{pre .. "alien-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('c[alien]-c[metallurgic]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "cryogenic-to-promethium-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"cryogenic-science-pack",cogitorScienceCost},
			{pre .. "alien-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"promethium-science-pack",math.ceil(cogitorScienceReturn/2)},
			{pre .. "alien-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('d[promethium]-a[cryogenic]',{keys.cogitorProcessing})
	),
	pf.recipeFactory(
		pre .. "promethium-to-cryogenic-transmutation",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{"promethium-science-pack",cogitorScienceCost},
			{pre .. "alien-catalytic-crystal-active",1,quality_max="normal",quality_change=-4}
		}),
		pf.itemResultsFactory({
			{"cryogenic-science-pack",cogitorScienceReturn},
			{pre .. "alien-catalytic-crystal-dormant",1,quality_max="normal",affected_by_quality=false}
		}),
		10,
		{pre .. "cognition"},
		keyMerge('d[promethium]-b[promethium]',{keys.cogitorProcessing})
	),
})

-- Crystal Processing Building Recipes
data:extend({
	pf.recipeFactory(
		pre .. "crystal-separator",
		recipeTempIcon, --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"electronic-circuit",2},
			{"iron-gear-wheel",5},
			{"iron-plate",5},
			{"stone-brick",4}
		}),
		pf.itemResultsFactory({
			{pre .. "crystal-separator",1}
		}),
		0.5,
		{"crafting"},
		keyMerge("e[crystal-separator]-a[basic]",{keys.standard,keys.smelting})
	),
	pf.recipeFactory(
		pre .. "thermal-flux-furnace",
		recipeTempIcon,  --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"electric-furnace",1},
			{pre .. "active-flux-capacitor",1},
			{"heat-pipe",4}
		}),
		pf.itemResultsFactory({
			{pre .. "thermal-flux-furnace",1},
			{"advanced-circuit",1,ip = 0.5}
		}),
		8,
		{"advanced-crafting"},
		keyMerge("e[crystal-separator]-b[flux]",{keys.standard,keys.smelting, {main_product = pre .. "thermal-flux-furnace"}})
	),
	pf.recipeFactory(
		pre .. "electric-heater",
		recipeTempIcon,  --TODO: placeholder icon
		pf.itemIngredientsFactory({
			{"heating-tower"},
			{pre .. "active-flux-capacitor",1},
			{"advanced-circuit",1}
		}),
		pf.itemResultsFactory({
			{pre .. "electric-heater",1},
			{"heat-pipe",1,ip = 0.5}
		}),
		8,
		{"advanced-crafting"},
		keyMerge("f[nuclear-energy]-e[electric-heater]",{keys.standard,keys.subgroup("energy"), {main_product = pre .. "electric-heater"}})
	)
})

-- Chronocycler Core and Variants
data:extend({
	pf.recipeFactory(
		pre .. "unconfigured-chronocycler",
		recipeTempIcon, --TODO
		pf.ingredientsFactory(
			{
				{"processing-unit",6},
				{"steel-plate",20},
				{"concrete",20},
				{"pipe",4},
				{pre .. "active-flux-capacitor",1}
			},
			{
				{pre .. "concentrated-void-essence",50}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "unconfigured-chronocycler",1}
			},
			{
				{pre .. "distorted-void-essence",distort(50)}
			}
		),
		4,
		{"crafting-with-fluid","electromagnetics"},
		keyMerge("f[chronocycler]-a[unconfigured]",{{enabled=false},keys.subgroup("prismaris-chronocycler"),keys.prismarisOnly})
	),
	pf.recipeFactory(
		pre .. "reversal-chronocycler",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{pre .. "unconfigured-chronocycler",1},
			{pre .. "activated-prismatic-shard-b",1}
		}),
		pf.itemResultsFactory({
			{pre .. "reversal-chronocycler",1,always_fresh=true}
		}),
		1,
		{"crafting"},
		keyMerge("f[chronocycler]-b[reversal]",{{enabled=false},keys.subgroup("prismaris-chronocycler"),{preserve_products_in_machine_output = true,localised_name = {"recipe-name.prismaris-reversal-chronocycler"}}})
	),
	pf.recipeFactory(
		pre .. "stasis-chronocycler",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{pre .. "unconfigured-chronocycler",1},
			{pre .. "activated-prismatic-shard-r",1}
		}),
		pf.itemResultsFactory({
			{pre .. "stasis-chronocycler",1,always_fresh=true}
		}),
		1,
		{"crafting"},
		keyMerge("f[chronocycler]-c[stasis]",{{enabled=false},keys.subgroup("prismaris-chronocycler"),{preserve_products_in_machine_output = true,localised_name = {"recipe-name.prismaris-stasis-chronocycler"}}})
	),
	pf.recipeFactory(
		pre .. "acceleration-chronocycler",
		recipeTempIcon, -- TODO
		pf.itemIngredientsFactory({
			{pre .. "unconfigured-chronocycler",1},
			{pre .. "activated-prismatic-shard-g",1}
		}),
		pf.itemResultsFactory({
			{pre .. "acceleration-chronocycler",1,always_fresh=true}
		}),
		1,
		{"crafting"},
		keyMerge("f[chronocycler]-d[acceleration]",{{enabled=false},keys.subgroup("prismaris-chronocycler"),{preserve_products_in_machine_output = true,localised_name = {"recipe-name.prismaris-acceleration-chronocycler"}}})
	),
})

-- Lunar Panel
data:extend({
	pf.recipeFactory(
		pre .. "lunar-panel",
		recipeTempIcon, -- TODO
		pf.ingredientsFactory(
			{
				{"solar-panel",1},
				{pre .. "active-flux-capacitor",1}
			},
			{
				{pre .. "concentrated-void-essence",50}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "lunar-panel",1}
			},
			{
				{pre .. "distorted-void-essence",distort(50)}
			}
		),
		5,
		{"crafting-with-fluid","electromagnetics"},
		keyMerge("d[solar-panel]-b[lunar-panel]",{keys.standard,keys.prismarisOnly,keys.subgroup("energy")})
	)
})

-- Void beacon
data:extend({
	pf.recipeFactory(
		pre.."void-beacon",
		recipeTempIcon, -- TODO
		pf.ingredientsFactory(
			{
				{"steel-plate",15},
				{"copper-cable",15},
				{"advanced-circuit",20},
				{"processing-unit",20},
				{pre .. "active-flux-capacitor",2}
			},
			{
				{pre .. "concentrated-void-essence",100}
			}
		),
		pf.resultsFactory(
			{
				{pre.."void-beacon",1}
			},
			{
				{pre .. "distorted-void-essence",distort(100)}
			}
		),
		15,
		{"crafting-with-fluid","electromagnetics"},
		keyMerge("a[beacon]-v[void-beacon]",{keys.standard,keys.prismarisOnly,keys.subgroup("module")})
	)
})



-- Tesla Variants



-- Laser Variants

data:extend{
	pf.recipeFactory(
		pre .. "unconfigured-laser-turret",
		{{icon = baseIcons .. "laser-turret.png", tint = {.6,.6,.6}}}, -- TODO: proper icons
		pf.ingredientsFactory(
			{
				{"laser-turret",1},
				{"advanced-circuit",5},
				{pre .. "active-flux-capacitor",1}
			},
			{
				{pre .. "concentrated-void-essence",20}
			}
		),
		pf.resultsFactory(
			{
				{pre .. "unconfigured-laser-turret",1},
				{"electronic-circuit",amount_min = 4, amount_max = 6}
			},
			{
				{pre .. "distorted-void-essence", distort(20)}
			}
		),
		10,
		{"advanced-crafting","electromagnetics"},
		keyMerge("b[turret]-b[laser]-a[unconfigured]",{
			keys.standard,
			keys.prismarisOnly,
			keys.subgroup("prismaris-laser-turrets"),
			keys.mainProduct(pre .. "unconfigured-laser-turret")
		})
	)
}

for i,pair in ipairs(prismarisConstants.laserTintsAndTypes) do
	local turretName = pre .. pair[2] .. "-laser-turret"
	data:extend{
		pf.recipeFactory(
			turretName,
			{{icon = baseIcons .. "laser-turret.png", tint = pair[1]}}, -- TODO: proper icons
			pf.itemIngredientsFactory(
				{
					{pre.."unconfigured-laser-turret"},
					{pre .. "activated-prismatic-shard-" .. pair[4],1} --Lookup correct shard color
				}
			),
			pf.itemResultsFactory(
				{
					{turretName,1}
				}
			),
			1,
			{"crafting"},
			keyMerge("b[turret]-b[laser]-" .. pair[3] .. "[" .. pair[2] .. "]",{
				keys.standard,
				keys.subgroup("prismaris-laser-turrets"),
				keys.mainProduct(turretName)
			})
		)
	}
end