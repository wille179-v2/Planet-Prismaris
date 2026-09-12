local planet_map_gen = {}
-- get nauvis from base.


planet_map_gen.prismaris = function()
	return
	{
		property_expression_names =
		{
			elevation = "vulcanus_elevation",
			temperature = "vulcanus_temperature",
			moisture = "vulcanus_moisture",
			aux = "vulcanus_aux",
			cliffiness = "cliffiness_basic",
			cliff_elevation = "cliff_elevation_from_elevation",
			["entity:prismaris-prismatic-shard:probability"] = "vulcanus_calcite_probability",
			["entity:prismaris-prismatic-shard:richness"] = "prismaris_prismatic_shard_richness",
			["entity:prismaris-void-essence-well:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
			["entity:prismaris-void-essence-well:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
		},
		cliff_settings =
		{
			name = "cliff-vulcanus",
			control = "prismaris_cliff",
			cliff_elevation_interval = 160,
			cliff_elevation_0 = 80,
			richness = 0.6,
		},
		autoplace_controls =
		{
			["prismaris_prismatic_shard"] = {},
			["prismaris_void_essence"] = {},
			["prismaris_plants"] = {},
			["prismaris_entropy"] = {},
			["prismaris_cliff"] = {},
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
					[pre .. "aethric-soil"] = {},
					--nauvis tiles
					--["volcanic-soil-dark"] = {},
					--["volcanic-soil-light"] = {},
					--["volcanic-ash-soil"] = {},
					--end of nauvis tiles
					["volcanic-ash-flats"] = {},
					["volcanic-ash-light"] = {},
					["volcanic-ash-dark"] = {},
					["volcanic-cracks"] = {},
					["volcanic-cracks-warm"] = {},
					["volcanic-folds"] = {},
					["volcanic-folds-flat"] = {},
					["volcanic-folds-warm"] = {},
					["volcanic-pumice-stones"] = {},
					["volcanic-cracks-hot"] = {},
					["volcanic-jagged-ground"] = {},
					["volcanic-smooth-stone"] = {},
					["volcanic-smooth-stone-warm"] = {},
					["volcanic-ash-cracks"] = {},
				}
			},
			["decorative"] =
			{
				settings =
				{
					-- nauvis decoratives
					["v-brown-carpet-grass"] = {},
					["v-green-hairy-grass"] = {},
					["v-brown-hairy-grass"] = {},
					["v-red-pita"] = {},
					-- end of nauvis
					["vulcanus-rock-decal-large"] = {},
					["vulcanus-crack-decal-large"] = {},
					["vulcanus-crack-decal-huge-warm"] = {},
					["vulcanus-dune-decal"] = {},
					["vulcanus-sand-decal"] = {},
					["calcite-stain"] = {},
					["calcite-stain-small"] = {},
					["sulfur-stain"] = {},
					["sulfur-stain-small"] = {},
					["sulfuric-acid-puddle"] = {},
					["sulfuric-acid-puddle-small"] = {},
					["crater-small"] = {},
					["crater-large"] = {},
					["pumice-relief-decal"] = {},
					["small-volcanic-rock"] = {},
					["medium-volcanic-rock"] = {},
					["tiny-volcanic-rock"] = {},
					["tiny-rock-cluster"] = {},
					["small-sulfur-rock"] = {},
					["tiny-sulfur-rock"] = {},
					["sulfur-rock-cluster"] = {},
					["waves-decal"] = {},
				}
			},
			["entity"] =
			{
				settings =
				{
					["prismaris-prismatic-shard"] = {},
					["prismaris-void-essence-well"] = {},
					-- TODO: Replace volcanus rocks with prismaris rocks

					-- Volcanus defaults
					--["big-volcanic-rock-hot"] = {},
					--["huge-volcanic-rock-hot"] = {},
					--["huge-volcanic-rock"] = {},
					--["big-volcanic-rock"] = {},
					--["crater-cliff"] = {},
					--["vulcanus-chimney"] = {},
					--["vulcanus-chimney-faded"] = {},
					--["vulcanus-chimney-cold"] = {},
					--["vulcanus-chimney-short"] = {},
					--["vulcanus-chimney-truncated"] = {},
					--["ashland-lichen-tree"] = {},
					--["ashland-lichen-tree-flaming"] = {},
				}
			}
		}
	}
end

return planet_map_gen
