local cultivatedAetherCrystal = table.deepcopy(data.raw["plant"]["tree-plant"])
cultivatedAetherCrystal.name = pre .. "cultivated-aether-crystal"
--cultivatedAetherCrystal.growth_mounds = nil
cultivatedAetherCrystal.growth_ticks = 18000 -- the same as gleba plants
cultivatedAetherCrystal.minable = {
	mining_time = 0.5,
	results = {
		{
			type = "item",
			name = pre .. "aethric-shard",
			amount_min = 25, -- Will go to "amount = 50" if this doesn't work
			amount_max = 75
		}
	}
}
cultivatedAetherCrystal.placable_by = pre .. "shattered-aethric-shard-f"
cultivatedAetherCrystal.surface_conditions = keys.prismarisOnly.surface_conditions
cultivatedAetherCrystal.autoplace = {
	--TODO: Worldgen autoplace control
	order = "a", -- Order influences the sequence of entity placement in worldgen, earlier sort = placed first
	tile_restriction = { -- https://lua-api.factorio.com/latest/types/AutoplaceSpecification.html#tile_restriction
		pre .. "aethric-soil",
	},
	probability_expression = 0 -- Currently disabled https://lua-api.factorio.com/latest/types/NoiseExpression.html
}
cultivatedAetherCrystal.localised_name = {"entity-name." .. pre .. "cultivated-aether-crystal"}

data:extend({cultivatedAetherCrystal})