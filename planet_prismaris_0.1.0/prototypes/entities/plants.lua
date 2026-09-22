local acGraphicsPath = prismarisConstants.entityGraphicsPath .. "aether-crystal/"
local prisIcons = prismarisConstants.iconsPath
local cultivatedAetherCrystal = table.deepcopy(data.raw["plant"]["tree-plant"])
cultivatedAetherCrystal.name = pre .. "cultivated-aether-crystal"
cultivatedAetherCrystal.growth_ticks = 18000 -- the same as gleba plants
cultivatedAetherCrystal.icons = {{icon = prisIcons .. "shattered-aethric-shard-a-e.png", tint = {.8,1,1}}}
cultivatedAetherCrystal.minable = {
	mining_time = 0.5,
	mining_particle = "glass-particle-small",
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

cultivatedAetherCrystal.pictures = {
	{
		filename = acGraphicsPath .. "aether-crystal-1.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-2.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-3.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-4.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-5.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-6.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-7.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-8.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
			{
		filename = acGraphicsPath .. "aether-crystal-9.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
	  {
		filename = acGraphicsPath .. "aether-crystal-10.png",
		width = 256,
		height = 256,
		shift = {0 , -0.5},
		scale = 0.8,
	  },
}
cultivatedAetherCrystal.variations = nil
cultivatedAetherCrystal.growth_variations = nil
cultivatedAetherCrystal.growth_mounds = nil
cultivatedAetherCrystal.collision_box = {{-1, -1}, {1, 1}}
cultivatedAetherCrystal.selection_box = {{-1, -1}, {1, 1}}

data:extend({cultivatedAetherCrystal})