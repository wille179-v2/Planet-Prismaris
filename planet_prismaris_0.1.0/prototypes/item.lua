require("prototypes.subgroup")

local pre = prismarisConstants.prototypePrefix
local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recyclerIcons = "__recycler__/graphics/icons/"
local prisIcons = prismarisConstants.iconsPath -- The REAL icons. Anything using this is semi-final art.
local slow = prismarisConstants.slowSpoilTime
local medium = prismarisConstants.mediumSpoilTime
local fast = prismarisConstants.fastSpoilTime

local hideAethricShardVariants = true -- master dev control variable.

--[[
	For reference:
	pf.itemFactory(name, stackSize, icons, subgroup, pfs, otherKeys)
]]

-- Items currently have placeholder graphics

-- Prismatic Shard Cycles
data:extend({
	-- Prismatic Shard
	pf.itemFactory(
		pre .. "prismatic-shard",
		100,
		prisIcons .. "prismatic-shard.png",
		"prismaris-processes-prismatic",
		{},
		{order = "a[prismatic-shard]", weight = 1000}
	),
	-- Activated Prismatic Shard RGBW/CMYK
	pf.itemFactory(
		pre .. "activated-prismatic-shard-r",
		100,
		prisIcons .. "activated-shard-r-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-g",
				medium
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-r"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-r-1.png",
				prisIcons .. "activated-shard-r-2.png",
				prisIcons .. "activated-shard-r-3.png",
				prisIcons .. "activated-shard-r-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-g",
		100,
		prisIcons .. "activated-shard-g-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-b",
				medium
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-g"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-g-1.png",
				prisIcons .. "activated-shard-g-2.png",
				prisIcons .. "activated-shard-g-3.png",
				prisIcons .. "activated-shard-g-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-b",
		100,
		prisIcons .. "activated-shard-b-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-w",
				medium
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-b"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-b-1.png",
				prisIcons .. "activated-shard-b-2.png",
				prisIcons .. "activated-shard-b-3.png",
				prisIcons .. "activated-shard-b-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-w",
		100,
		prisIcons .. "activated-shard-w-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-r",
				slow
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-w"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-w-1.png",
				prisIcons .. "activated-shard-w-2.png",
				prisIcons .. "activated-shard-w-3.png",
				prisIcons .. "activated-shard-w-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-c",
		100,
		prisIcons .. "activated-shard-c-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-m",
				medium
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-c"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-c-1.png",
				prisIcons .. "activated-shard-c-2.png",
				prisIcons .. "activated-shard-c-3.png",
				prisIcons .. "activated-shard-c-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-m",
		100,
		prisIcons .. "activated-shard-m-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-y",
				medium
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-m"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-m-1.png",
				prisIcons .. "activated-shard-m-2.png",
				prisIcons .. "activated-shard-m-3.png",
				prisIcons .. "activated-shard-m-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-y",
		100,
		prisIcons .. "activated-shard-y-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-k",
				medium
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-y"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-y-1.png",
				prisIcons .. "activated-shard-y-2.png",
				prisIcons .. "activated-shard-y-3.png",
				prisIcons .. "activated-shard-y-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-k",
		100,
		prisIcons .. "activated-shard-k-1.png",
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-c",
				slow
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{
			keys.factoriopediaLocale(pre .. "activated-prismatic-shard-k"),
			keys.altItemGraphics({
				prisIcons .. "activated-shard-k-1.png",
				prisIcons .. "activated-shard-k-2.png",
				prisIcons .. "activated-shard-k-3.png",
				prisIcons .. "activated-shard-k-4.png",
			}),
			{weight = 1000}
		})
	),
	pf.itemFactory(
		pre .. "ferric-shard",
		100,
		prisIcons .. "ferric-shard.png",
		"prismaris-processes-prismatic",
		{},
		{order = "c[resource-shard]", weight = 2000}
	),
	pf.itemFactory(
		pre .. "cupric-shard",
		100,
		prisIcons .. "cupric-shard.png",
		"prismaris-processes-prismatic",
		{},
		{order = "c[resource-shard]", weight = 2000}
	),
	pf.itemFactory(
		pre .. "lithic-shard",
		100,
		prisIcons .. "lithic-shard.png",
		"prismaris-processes-prismatic",
		{},
		{order = "c[resource-shard]", weight = 2000}
	),
})

--Aethric Shard Cycles
data:extend({
	-- Aethric Shards
	pf.itemFactory(
		pre .. "aethric-shard",
		100,
		prisIcons .. "aethric-shard.png",
		"prismaris-processes-aethric",
		{},
		{order = "a[raw-resource]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-a",
		100,
		prisIcons .. "shattered-aethric-shard-a-e.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-b",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants,
			weight = 1000
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-b",
		100,
		prisIcons .. "shattered-aethric-shard-a-e.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-c",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants,
			weight = 1000
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-c",
		100,
		prisIcons .. "shattered-aethric-shard-a-e.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-d",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants,
			weight = 1000
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-d",
		100,
		prisIcons .. "shattered-aethric-shard-a-e.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-e",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants,
			weight = 1000
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-e",
		100,
		prisIcons .. "shattered-aethric-shard-a-e.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-f",
				fast
			)
		},
		{order = "b[shattered-shard]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-f",
		100,
		{{icon = prisIcons .. "shattered-aethric-shard-a-e.png", tint = {.8,1,1}}},
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-a",
				medium
			),
			placement = pf.placementHelper(
				"plant",
				pre .. "cultivated-aether-crystal"
			)
		},
		merge{{order = "b[shattered-shard]",localised_name = {"item-name.prismaris-shattered-aethric-shard-f"}, weight = 1000},keys.factoriopediaLocale(pre .. "shattered-aethric-shard-f")}
	),

	pf.itemFactory(
		pre .. "destabilized-aethric-shard-a",
		50,
		prisIcons .. "destabilized-aethric-shard.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"calcite",
				slow
			)
		},
		{order = "c[destabilized-shard]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-b",
		50,
		prisIcons .. "destabilized-aethric-shard.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"coal",
				slow
			)
		},
		{order = "c[destabilized-shard]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-c",
		50,
		prisIcons .. "destabilized-aethric-shard.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"carbon",
				slow
			)
		},
		{order = "c[destabilized-shard]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-d",
		50,
		prisIcons .. "destabilized-aethric-shard.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"solid-fuel",
				slow
			)
		},
		{order = "c[destabilized-shard]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-e",
		50,
		prisIcons .. "destabilized-aethric-shard.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"jelly",
				medium
			)
		},
		{order = "c[destabilized-shard]", weight = 1000}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-f",
		50,
		prisIcons .. "destabilized-aethric-shard.png",
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"yumako-mash",
				medium
			)
		},
		{order = "c[destabilized-shard]", weight = 1000}
	),
})

--[[
-- Aethric Soil
local aethricSoil = table.deepcopy(data.raw["item"]["overgrowth-jellynut-soil"])
aethricSoil.name = pre .. "aethric-soil"
aethricSoil.subgroup = "terrain"
aethricSoil.order = "d[aethric-soil]"
-- TODO: CORRECT Placement result

local tileList = {}
for key,tile in pairs(data.raw["tile"]) do
	if string.find(key, "grass") or string.find(key,"dirt") or string.find(key,"desert") or string.find(key,"sand") then
		table.insert(tileList, key)
	end
end


aethricSoil.place_as_tile = {
	result = pre .. "aethric-soil",
	condition = {
		layers = {} -- Collision layers that are excluded
	},
	condition_size = 1,
	invert = false, -- Inverts collision layers into "required" layers instead of excluded... probably don't bother with this
	tile_condition = tileList -- list of tiles that are allowed to place on
}

data:extend({aethricSoil})

]]

-- Entropic Dust Cycles
data:extend({
	pf.itemFactory(
		pre .. "raw-entropic-dust-positive",
		200,
		prisIcons .. "raw-entropic-dust-pos-1.png",
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "raw-entropic-dust-negative",
				fast
			),
		},
		keyMerge("a[raw]-a[positive]",{
			keys.altItemGraphics({
				prisIcons .. "raw-entropic-dust-pos-1.png",
				prisIcons .. "raw-entropic-dust-pos-2.png",
				prisIcons .. "raw-entropic-dust-pos-3.png"
			}),
			{weight = 500}
		})
	),
	pf.itemFactory(
		pre .. "raw-entropic-dust-negative",
		200,
		prisIcons .. "raw-entropic-dust-neg-1.png",
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "raw-entropic-dust-positive",
				fast
			)
		},
		keyMerge("a[raw]-b[negative]",{
			keys.altItemGraphics({
				prisIcons .. "raw-entropic-dust-neg-1.png",
				prisIcons .. "raw-entropic-dust-neg-2.png",
				prisIcons .. "raw-entropic-dust-neg-3.png"
			}),
			{weight = 500}
		})
	),
	pf.itemFactory(
		pre .. "refined-entropic-dust-positive",
		200,
		prisIcons .. "refined-entropic-dust-pos-1.png",
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "refined-entropic-dust-negative",
				180
			),
			fuel = pf.fuelHelper(
				"2MJ",
				{"chemical"},
				{
					burnt_result = pre .. "raw-entropic-dust-negative",
					fuel_emissions_multiplier = 2
				}
			)
		},
		keyMerge("b[refined]-a[positive]",{
			keys.altItemGraphics({
				prisIcons .. "refined-entropic-dust-pos-1.png",
				prisIcons .. "refined-entropic-dust-pos-2.png",
				prisIcons .. "refined-entropic-dust-pos-3.png"
			}),
			{weight = 500}
		})
	),
	pf.itemFactory(
		pre .. "refined-entropic-dust-negative",
		200,
		prisIcons .. "refined-entropic-dust-neg-1.png",
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "refined-entropic-dust-positive",
				slow
			)
		},
		keyMerge("b[refined]-b[negative]",{
			keys.altItemGraphics({
				prisIcons .. "refined-entropic-dust-neg-1.png",
				prisIcons .. "refined-entropic-dust-neg-2.png",
				prisIcons .. "refined-entropic-dust-neg-3.png"
			}),
			{weight = 500}
		})
	),
	pf.itemFactory(
		pre .. "entropic-nutrients",
		100,
		prisIcons .. "entropic-nutrients.png",
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "refined-entropic-dust-negative",
				600
			),
			fuel = pf.fuelHelper(
				"4MJ",
				{"nutrients"},
				{
					burnt_result = pre .. "raw-entropic-dust-negative",
					fuel_emissions_multiplier = 2
				}
			)
		},
		{order = "c[entropic-nutrients]", weight = 500}
	)
})

-- Flux Capacitor Variants
data:extend({
	pf.itemFactory(
		pre .. "charging-flux-capacitor",
		50,
		prisIcons .. "charging-flux-capacitor.png",
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "active-flux-capacitor",
				300
			)
		},
		keyMerge("a[flux-capacitor]-a[charging]",{keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "active-flux-capacitor",
		50,
		prisIcons .. "active-flux-capacitor.png",
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "discharged-flux-capacitor",
				60
			)
		},
		keyMerge("a[flux-capacitor]-b[active]",{keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "discharged-flux-capacitor",
		50,
		prisIcons .. "discharged-flux-capacitor.png",
		"prismaris-processes-technical",
		{},
		keyMerge("a[flux-capacitor]-c[discharged]",{keys.accelerationLossExempt})
	),
})

-- Cogitor and Catalytic Crystal Variants
data:extend({
	pf.itemFactory(
		pre .. "cogitor",
		10,
		prismarisConstants.iconsPath .. "cogitor.png",
		"prismaris-cogitor",
		{
			placement = pf.placementHelper(
				"building",
				pre .. "cogitor"
			)
		},
		keyMerge("y[cogitor]")
	),
	pf.itemFactory(
		pre .. "basic-catalytic-crystal-active",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "basic-catalytic-crystal-dormant",
				slow
			)
		},
		keyMerge("b[catalytic-crystal]-a[basic]-a[active]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "basic-catalytic-crystal-dormant",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "basic-catalytic-crystal-active",
				1200
			)
		},
		keyMerge("b[catalytic-crystal]-a[basic]-b[dormant]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "advanced-catalytic-crystal-active",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "advanced-catalytic-crystal-dormant",
				slow
			)
		},
		keyMerge("b[catalytic-crystal]-b[advanced]-a[active]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "advanced-catalytic-crystal-dormant",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "advanced-catalytic-crystal-active",
				1200
			)
		},
		keyMerge("b[catalytic-crystal]-b[advanced]-b[dormant]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "alien-catalytic-crystal-active",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "alien-catalytic-crystal-dormant",
				slow
			)
		},
		keyMerge("b[catalytic-crystal]-c[alien]-a[active]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "alien-catalytic-crystal-dormant",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "alien-catalytic-crystal-active",
				1200
			)
		},
		keyMerge("b[catalytic-crystal]-c[alien]-b[dormant]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "promethium-catalytic-crystal-active",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "promethium-catalytic-crystal-dormant",
				slow
			)
		},
		keyMerge("b[catalytic-crystal]-d[promethium]-a[active]",{{weight=200000},keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "promethium-catalytic-crystal-dormant",
		5,
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-technical",
		{
			spoilage = pf.spoilageHelper(
				pre .. "promethium-catalytic-crystal-active",
				1200
			)
		},
		keyMerge("b[catalytic-crystal]-d[promethium]-b[dormant]",{{weight=200000},keys.accelerationLossExempt})
	),
})


-- Polyphasic Science Packs
data:extend({
	pf.itemFactory(
		pre .. "red-polyphasic-science-pack",
		200,
		prisIcons .. "polyphasic-science-pack-r.png",
		"science-pack",
		{
			spoilage = pf.spoilageHelper(
				pre .. "blue-polyphasic-science-pack",
				60 * 60
			)
		},
		keyMerge("i-a",{keys.accelerationLossExempt,keys.science})
	),
	pf.itemFactory(
		pre .. "blue-polyphasic-science-pack",
		200,
		prisIcons .. "polyphasic-science-pack-b.png",
		"science-pack",
		{
			spoilage = pf.spoilageHelper(
				pre .. "green-polyphasic-science-pack",
				60 * 60
			)
		},
		keyMerge("i-b",{keys.accelerationLossExempt,keys.science})
	),
	pf.itemFactory(
		pre .. "green-polyphasic-science-pack",
		200,
		prisIcons .. "polyphasic-science-pack-g.png",
		"science-pack",
		{
			spoilage = pf.spoilageHelper(
				pre .. "red-polyphasic-science-pack",
				60 * 60
			)
		},
		keyMerge("i-c",{keys.accelerationLossExempt,keys.science})
	),
})

-- Crystal Separator
data:extend({
	pf.itemFactory(
		pre .. "crystal-separator",
		50,
		baseIcons .. "stone-furnace.png", -- TODO: Placeholder
		"smelting-machine",
		{
			placement = pf.placementHelper(
				"building",
				pre .. "crystal-separator"
			)
		},
		{order = "e[crystal-separator]-a[basic]"}
	),
	pf.itemFactory(
		pre .. "thermal-flux-furnace",
		50,
		baseIcons .. "electric-furnace.png", -- TODO: placeholder
		"smelting-machine",
		{
			placement = pf.placementHelper(
				"building",
				pre .. "thermal-flux-furnace"
			)
		},
		{order = "e[crystal-separator]-b[flux]"}
	),
	pf.itemFactory(
		pre .. "electric-heater",
		20,
		saIcons .. "heating-tower.png", -- TODO: placeholder
		"energy",
		{
			placement = pf.placementHelper(
				"building",
				pre .. "electric-heater"
			)
		},
		{order = "f[nuclear-energy]-e[electric-heater]"}
	)

})

-- Chronocycler Variants
data:extend({
	pf.itemFactory(
		pre .. "unconfigured-chronocycler",
		50,
		recyclerIcons .. "recycler.png", -- TODO: placeholder
		"smelting-machine",
		{},
		{order = "f[chronocycler]-a[unconfigured]"}
	),
	pf.itemFactory(
		pre .. "reversal-chronocycler",
		50,
		recyclerIcons .. "recycler.png", -- TODO: placeholder
		"smelting-machine",
		{
			spoilage = pf.spoilageHelper(
				pre .. "unconfigured-chronocycler",
				60*60
			),
			placement = pf.placementHelper(
				"building",
				pre .. "reversal-chronocycler"
			)
		},
		{order = "f[chronocycler]-b[reversal]"}
	),
	pf.itemFactory(
		pre .. "stasis-chronocycler",
		50,
		recyclerIcons .. "recycler.png", -- TODO: placeholder
		"smelting-machine",
		{
			spoilage = pf.spoilageHelper(
				pre .. "unconfigured-chronocycler",
				60*60
			),
			placement = pf.placementHelper(
				"building",
				pre .. "stasis-chronocycler"
			)
		},
		{order = "f[chronocycler]-c[stasis]"}
	),
	pf.itemFactory(
		pre .. "acceleration-chronocycler",
		50,
		recyclerIcons .. "recycler.png", -- TODO: placeholder
		"smelting-machine",
		{
			spoilage = pf.spoilageHelper(
				pre .. "unconfigured-chronocycler",
				60*60
			),
			placement = pf.placementHelper(
				"building",
				pre .. "acceleration-chronocycler"
			)
		},
		{order = "f[chronocycler]-d[acceleration]"}
	),
})

-- Lunar Panel & Void Beacon items
data:extend({
	pf.itemFactory(
		pre .. "lunar-panel",
		50,
		baseIcons .. "solar-panel.png", -- TODO: Placeholder
		"energy",
		{
			placement = pf.placementHelper(
				"building",
				pre .. "lunar-panel"
			)
		},
		{order = "d[solar-panel]-b[lunar-panel]"}
	),
	pf.itemFactory(
		pre .. "void-beacon",
		20,
		baseIcons .. "beacon.png", -- TODO: Placeholder
		"module",
		{
			placement = pf.placementHelper(
				"building",
				pre .. "void-beacon"
			)
		},
		{order = "a[beacon]-v[void-beacon]"}
	)
})
