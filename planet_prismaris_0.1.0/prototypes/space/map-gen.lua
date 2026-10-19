local planet_map_gen = {}
-- get nauvis from base.


planet_map_gen.prismaris = function()
	return
	{
		property_expression_names =
		{
			elevation = "aquilo_elevation",
			temperature = "aquilo_temperature",
			moisture = "moisture_basic",
			aux = "aquilo_aux",
			cliffiness = "cliffiness_basic",
			cliff_elevation = "cliff_elevation_from_elevation",
			["entity:prismaris-prismatic-shard:probability"] = "aquilo_crude_oil_probabilityy",
			["entity:prismaris-prismatic-shard:richness"] = "prismaris_prismatic_shard_richness",
			--["entity:prismaris-void-essence-well:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
			--["entity:prismaris-void-essence-well:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
		},
		autoplace_controls =
		{
			["prismaris_prismatic_shard"] = {},
			["prismaris_void_essence"] = {},
			--["prismaris_plants"] = {},
			--["prismaris_entropy"] = {},
			--["prismaris_cliff"] = {},
			--["vulcanus_volcanism"] = {},
			--["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn
		},
		autoplace_settings =
		{
			["tile"] =
			{
				settings =
				{
					[pre .. "entropic-sea-deep"] = {},
					[pre .. "entropic-sea"] = {},
					-- TODO: These are temporary clones of aquilo tiles; replace these with proper tiles.
					[pre .. "snow-flat"] = {},
					[pre .. "snow-crests"] = {},
					[pre .. "snow-lumpy"] = {},
					[pre .. "snow-patchy"] = {},
					[pre .. "ice-rough"] = {},
					[pre .. "ice-smooth"] = {},
					
				}
			},
			["decorative"] =
			{
				settings =
				{
					-- TODO: make a prismaris variant of each of these decoratives
					["lithium-iceberg-medium"] = {},
					["lithium-iceberg-small"] = {},
					["lithium-iceberg-tiny"] = {},
					["floating-iceberg-large"] = {},
					["floating-iceberg-small"] = {},
					["aqulio-ice-decal-blue"] = {},
					["aqulio-snowy-decal"] = {},
					["snow-drift-decal"] = {}
				}
			},
			["entity"] =
			{
				settings =
				{
					["prismaris-prismatic-shard"] = {},
					["prismaris-void-essence-well"] = {},
					-- TODO: Replace volcanus rocks with prismaris rocks
					--["crude-oil"] = {},
					--["lithium-brine"] = {}, -- To be replaced with prismatic shard
					--["fluorine-vent"] = {}, -- To be replaced with void essence well
					[pre .. "crystal-huge"] = {}, -- To be replaced with better variant
					[pre .. "crystal-big"] = {}, -- To be replaced with better variant
					[pre .. "aether-crystal-natural"] = {},
				}
			}
		}
	}
end

return planet_map_gen
