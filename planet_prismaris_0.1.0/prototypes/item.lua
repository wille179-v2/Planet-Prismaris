require("prototypes.subgroup")

local pre = prismarisConstants.prototypePrefix
local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use
local recyclerIcons = "__recycler__/graphics/icons/"
local slow = prismarisConstants.slowSpoilTime
local medium = prismarisConstants.mediumSpoilTime
local fast = prismarisConstants.fastSpoilTime

local hideAethricShardVariants = false -- master control variable.

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
		saIcons .. "calcite.png", -- TODO: Placeholder
		"prismaris-processes-prismatic",
		{},
		{order = "a[prismatic-shard]"}
	),
	-- Activated Prismatic Shard RGBW/CMYK
	pf.itemFactory(
		pre .. "activated-prismatic-shard-r",
		100,
		saIcons .. "big-promethium-asteroid.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-g",
				medium
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-r")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-g",
		100,
		saIcons .. "big-carbonic-asteroid.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-b",
				medium
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-g")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-b",
		100,
		saIcons .. "big-oxide-asteroid.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-w",
				medium
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-b")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-w",
		100,
		saIcons .. "ice.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-r",
				slow
			)
		},
		keyMerge("b[activated-shard]-a[rgbw]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-w")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-c",
		100,
		saIcons .. "cryogenic-science-pack.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-m",
				medium
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-c")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-m",
		100,
		saIcons .. "electromagnetic-science-pack.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-y",
				medium
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-m")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-y",
		100,
		saIcons .. "biosulfur.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-k",
				medium
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-y")})
	),
	pf.itemFactory(
		pre .. "activated-prismatic-shard-k",
		100,
		saIcons .. "carbon.png",-- TODO: Placeholder
		"prismaris-processes-prismatic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "activated-prismatic-shard-c",
				slow
			)
		},
		keyMerge("b[activated-shard]-b[cmyk]",{keys.factoriopediaLocale(pre .. "activated-prismatic-shard-k")})
	),
	pf.itemFactory(
		pre .. "ferric-shard",
		100,
		saIcons .. "iron-bacteria-2.png", --TODO: Placeholder
		"prismaris-processes-prismatic",
		{},
		{order = "c[resource-shard]"}
	),
	pf.itemFactory(
		pre .. "cupric-shard",
		100,
		saIcons .. "copper-bacteria-2.png", --TODO: Placeholder
		"prismaris-processes-prismatic",
		{},
		{order = "c[resource-shard]"}
	),
	pf.itemFactory(
		pre .. "lithic-shard",
		100,
		saIcons .. "biter-egg-2.png", --TODO: Placeholder
		"prismaris-processes-prismatic",
		{},
		{order = "c[resource-shard]"}
	),
})

--Aethric Shard Cycles
data:extend({
	-- Aethric Shards
	pf.itemFactory(
		pre .. "aethric-shard",
		100,
		baseIcons .. "uranium-238.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{},
		{order = "a[raw-resource]"}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-a",
		100,
		baseIcons .. "depleted-uranium-fuel-cell.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-b",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-b",
		100,
		baseIcons .. "depleted-uranium-fuel-cell.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-c",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-c",
		100,
		baseIcons .. "depleted-uranium-fuel-cell.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-d",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-d",
		100,
		baseIcons .. "depleted-uranium-fuel-cell.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-e",
				fast
			)
		},
		{
			order = "b[shattered-shard]",
			hidden = hideAethricShardVariants
		}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-e",
		100,
		baseIcons .. "depleted-uranium-fuel-cell.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				pre .. "shattered-aethric-shard-f",
				fast
			)
		},
		{order = "b[shattered-shard]"}
	),
	pf.itemFactory(
		pre .. "shattered-aethric-shard-f",
		100,
		baseIcons .. "uranium-fuel-cell.png", --TODO: Placeholder
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
		merge{{order = "b[shattered-shard]",localised_name = {"item-name.prismaris-shattered-aethric-shard-f"}},keys.factoriopediaLocale(pre .. "shattered-aethric-shard-f")}
	),

	pf.itemFactory(
		pre .. "destabilized-aethric-shard-a",
		100,
		saIcons .. "coal-synthesis.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"calcite",
				slow
			)
		},
		{order = "c[destabilized-shard]"}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-b",
		100,
		saIcons .. "coal-synthesis.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"coal",
				slow
			)
		},
		{order = "c[destabilized-shard]"}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-c",
		100,
		saIcons .. "coal-synthesis.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"carbon",
				slow
			)
		},
		{order = "c[destabilized-shard]"}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-d",
		100,
		saIcons .. "coal-synthesis.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"solid-fuel",
				slow
			)
		},
		{order = "c[destabilized-shard]"}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-e",
		100,
		saIcons .. "coal-synthesis.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"jelly",
				slow
			)
		},
		{order = "c[destabilized-shard]"}
	),
	pf.itemFactory(
		pre .. "destabilized-aethric-shard-f",
		100,
		saIcons .. "coal-synthesis.png", --TODO: Placeholder
		"prismaris-processes-aethric",
		{
			spoilage = pf.spoilageHelper(
				"yumako-mash",
				slow
			)
		},
		{order = "c[destabilized-shard]"}
	),
})

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

-- Entropic Dust Cycles
data:extend({
	pf.itemFactory(
		pre .. "raw-entropic-dust-positive",
		200,
		saIcons .. "iron-stromatolite.png", -- TODO: Placeholder
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "raw-entropic-dust-negative",
				fast
			),
		},
		{order = "a[raw]-a[positive]"}
	),
	pf.itemFactory(
		pre .. "raw-entropic-dust-negative",
		200,
		saIcons .. "medium-demolisher-remains.png", -- TODO: Placeholder
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "raw-entropic-dust-positive",
				fast
			)
		},
		{order = "a[raw]-b[negative]"}
	),
	pf.itemFactory(
		pre .. "refined-entropic-dust-positive",
		200,
		saIcons .. "iron-stromatolite.png", -- TODO: Placeholder
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "refined-entropic-dust-negative",
				180
			),
			fuel = pf.fuelHelper(
				"2MJ",
				"chemical",
				{
					burnt_result = pre .. "raw-entropic-dust-negative",
					fuel_emissions_multiplier = 2
				}
			)
		},
		{order = "b[refined]-a[positive]"}
	),
	pf.itemFactory(
		pre .. "refined-entropic-dust-negative",
		200,
		saIcons .. "medium-demolisher-remains.png", -- TODO: Placeholder
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "refined-entropic-dust-positive",
				slow
			)
		},
		{order = "b[refined]-b[negative]"}
	),
	pf.itemFactory(
		pre .. "entropic-nutrients",
		100,
		saIcons .. "nutrients.png", -- TODO: Placeholder
		"prismaris-processes-entropic",
		{
			spoilage = pf.spoilageHelper(
				pre .. "refined-entropic-dust-negative",
				360
			),
			fuel = pf.fuelHelper(
				"3MJ",
				"nutrients",
				{
					burnt_result = pre .. "raw-entropic-dust-negative",
					fuel_emissions_multiplier = 2
				}
			)
		},
		{order = "c[entropic-nutrients]"}
	)
})

-- Flux Capacitor Variants
data:extend({
	pf.itemFactory(
		pre .. "charging-flux-capacitor",
		50,
		saIcons .. "supercapacitor.png", -- TODO: Placeholder
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
		saIcons .. "supercapacitor.png", -- TODO: Placeholder
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
		saIcons .. "supercapacitor.png", -- TODO: Placeholder
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
		baseIcons .. "automation-science-pack.png", -- TODO: placeholder
		"science-pack",
		{
			spoilage = pf.spoilageHelper(
				pre .. "blue-polyphasic-science-pack",
				60 * 60
			)
		},
		keyMerge("i-a",{keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "blue-polyphasic-science-pack",
		200,
		baseIcons .. "chemical-science-pack.png", -- TODO: placeholder
		"science-pack",
		{
			spoilage = pf.spoilageHelper(
				pre .. "green-polyphasic-science-pack",
				60 * 60
			)
		},
		keyMerge("i-b",{keys.accelerationLossExempt})
	),
	pf.itemFactory(
		pre .. "green-polyphasic-science-pack",
		200,
		baseIcons .. "logistic-science-pack.png", -- TODO: placeholder
		"science-pack",
		{
			spoilage = pf.spoilageHelper(
				pre .. "red-polyphasic-science-pack",
				60 * 60
			)
		},
		keyMerge("i-c",{keys.accelerationLossExempt})
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
		{order = "e[crystal-separator]"}
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
