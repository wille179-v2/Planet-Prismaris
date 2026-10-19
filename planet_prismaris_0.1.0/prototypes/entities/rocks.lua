local acGraphicsPath = prismarisConstants.entityGraphicsPath .. "aether-crystal/"
local prisIcons = prismarisConstants.iconsPath

local bigCrystal = table.deepcopy(data.raw["simple-entity"]["lithium-iceberg-big"])
bigCrystal.name = pre .. "crystal-big"
bigCrystal.minable.results = {
	-- platform
	{type = "item", name = pre .. "solidified-entropy", amount_min = 0, amount_max = 4},
	{type = "item", name = pre .. "prismatic-shard", amount_min = 1, amount_max = 4},
	{type = "item", name = pre .. "cracked-ferric-shard", amount_min = 1, amount_max = 7},
	{type = "item", name = pre .. "cracked-cupric-shard", amount_min = 1, amount_max = 6},
	{type = "item", name = pre .. "cracked-lithic-shard", amount_min = 0, amount_max = 5},
	--{type = "item", name = pre .. "aethric-shard", amount = 1, independent_probability = 0.5},
}

local hugeCrystal = table.deepcopy(data.raw["simple-entity"]["lithium-iceberg-huge"])
hugeCrystal.name = pre .. "crystal-huge"
hugeCrystal.minable.results = {
	-- platform
	{type = "item", name = pre .. "solidified-entropy", amount_min = 2, amount_max = 12},
	{type = "item", name = pre .. "prismatic-shard", amount_min = 4, amount_max = 12},
	{type = "item", name = pre .. "cracked-ferric-shard", amount_min = 4, amount_max = 20},
	{type = "item", name = pre .. "cracked-cupric-shard", amount_min = 4, amount_max = 16},
	{type = "item", name = pre .. "cracked-lithic-shard", amount_min = 2, amount_max = 12},
	--{type = "item", name = pre .. "aethric-shard", amount = 2, independent_probability = 0.5},
}

local cultivatedAetherCrystalReference = table.deepcopy(data.raw["plant"][pre .. "cultivated-aether-crystal"])

local aetherCrystalNatural = table.deepcopy(data.raw["simple-entity"]["lithium-iceberg-big"])
aetherCrystalNatural.name = pre .. "aether-crystal-natural"
aetherCrystalNatural.icons = {{icon = prisIcons .. "shattered-aethric-shard-a-e.png", tint = {.8,1,1}}}
aetherCrystalNatural.minable = {
	mining_time = 0.5,
	mining_particle = "glass-particle-small",
	results = {
		{type = "item", name = pre .. "aethric-shard", amount_min = 3, amount_max = 20},
		{type = "item", name = pre .. "destabilized-aethric-shard-a", amount_min = 0, amount_max = 12},
		{type = "item", name = pre .. "destabilized-aethric-shard-b", amount_min = 0, amount_max = 12},
		{type = "item", name = pre .. "destabilized-aethric-shard-c", amount_min = 0, amount_max = 12},
		{type = "item", name = pre .. "destabilized-aethric-shard-d", amount_min = 0, amount_max = 12},
		{type = "item", name = pre .. "destabilized-aethric-shard-e", amount_min = 0, amount_max = 12},
		{type = "item", name = pre .. "destabilized-aethric-shard-f", amount_min = 0, amount_max = 12},
		{type = "item", name = pre .. "shattered-aethric-shard-f", amount_min = 1, amount_max = 3},
	}
}
aetherCrystalNatural.surface_conditions = keys.prismarisOnly.surface_conditions
aetherCrystalNatural.pictures = cultivatedAetherCrystalReference.pictures
aetherCrystalNatural.collision_box = cultivatedAetherCrystalReference.collision_box
aetherCrystalNatural.selection_box = cultivatedAetherCrystalReference.selection_box
aetherCrystalNatural.autoplace = {order = "a[rock]-c[crystal]", probability_expression = "(aquilo_high_frequency_peaks - 0.705) * 0.795"}


data:extend{bigCrystal,hugeCrystal,aetherCrystalNatural}