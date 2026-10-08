local planet_map_gen = {}
-- get nauvis from base.

--[[	
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
]]

planet_map_gen.prismaris = function()
	return
	{
		property_expression_names =
		{
			elevation = "fulgora_elevation",
			temperature = "temperature_basic",
			moisture = "moisture_basic",
			aux = "aux_basic",
			cliffiness = "fulgora_cliffiness",
			cliff_elevation = "cliff_elevation_from_elevation",
		},
		cliff_settings =
		{
			name = "cliff-fulgora",
			control = "fulgora_cliff",
			cliff_elevation_0 = 80,
			-- Ideally the first cliff would be at elevation 0 on the coastline, but that doesn't work,
			-- so instead the coastline is moved to elevation 80.
			-- Also there needs to be a large cliff drop at the coast to avoid the janky cliff smoothing
			-- but it also fails if a corner goes below zero, so we need an extra buffer of 40.
			-- So the first cliff is at 80, and terrain near the cliff shouln't go close to 0 (usually above 40).
			cliff_elevation_interval = 40,
			cliff_smoothing = 0, -- This is critical for correct cliff placement on the coast.
			richness = 0.95
		},
		autoplace_controls =
		{
			["scrap"] = {},
			["fulgora_islands"] = {},
			["fulgora_cliff"] = {},
		},
		autoplace_settings =
		{
			["tile"] =
			{
				settings =
				{
					--["oil-ocean-shallow-2"] = {},
					--["oil-ocean-shallow"] = {},
					--["oil-ocean-deep"] = {},
					--["oil-ocean-deep-2"] = {},
					[pre .. "entropic-sea"] = {},
					[pre .. "entropic-sea-deep"] = {},
					
					["fulgoran-rock"] = {},
					["fulgoran-dust"] = {},

					--["fulgoran-sand"] = {},
					--["fulgoran-dunes"] = {},
					[pre .. "aethric-soil"] = {},

					["fulgoran-walls"] = {},
					["fulgoran-paving"] = {},
					["fulgoran-conduit"] = {},
					["fulgoran-machinery"] = {},
				}
			},
			["decorative"] =
			{
				settings =
				{
					["fulgora-sunk-ruin-big-decal"] = {},
					["fulgora-sunk-ruin-medium"] = {},
					["fulgora-sunk-ruin-small"] = {},
					["fulgoran-ruin-tiny"] = {},
					["small-fulgoran-gravewort"] = {},
					["medium-fulgoran-gravewort"] = {},
					["urchin-cactus"] = {},
					["medium-fulgora-rock"] = {},
					["small-fulgora-rock"] = {},
					["tiny-fulgora-rock"] = {},
				}
			},
			["entity"] =
			{
				settings =
				{
					["scrap"] = {},
					--["fulgora-sunk-ruin-big"] = {},
					--["fulgora-sunk-ruin-medium-tall"] = {},
					--["fulgoran-ruin-vault"] = {},
					--["fulgoran-ruin-attractor"] = {},
					--["fulgoran-ruin-colossal"] = {},
					--["fulgoran-ruin-huge"] = {},
					--["fulgoran-ruin-big"] = {},
					--["fulgoran-ruin-stonehenge"] = {},
					--["fulgoran-ruin-medium"] = {},
					--["fulgoran-ruin-small"] = {},
					--["fulgurite"] = {},
					--["big-fulgora-rock"] = {}
				}
			}
		}
	}
end

return planet_map_gen
