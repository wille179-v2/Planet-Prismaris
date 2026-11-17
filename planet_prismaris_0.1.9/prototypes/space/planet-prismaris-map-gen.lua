data:extend{
	{
		type = "noise-expression",
		name = "prismaris_prismatic_shard_richness",
		expression = "120000 * max(control:prismaris_prismatic_shard:richness,1)"
	},
	{
		type = "noise-expression",
		name = "prismaris_void_essence_richness",
		expression = "300000 * max(control:prismaris_void_essence:richness,1)"
	},
	{
		type = "noise-expression",
		name = "prismaris_starting_void_essence",
		expression = "starting_spot_at_angle{angle = aquilo_angle + 120, distance = 75, radius = aquilo_spot_size * 0.75, x_distortion = 0, y_distortion = 0}"
	},
	{
		type = "noise-expression",
		name = "prismaris_prismatic_shard_probability", -- numbers slightly tweaked from aquilo baseline
		expression = "(control:prismaris_prismatic_shard:size > 0)\z
						* (max(aquilo_starting_crude_oil * 0.021, \z
							min(aquilo_starting_mask, prismaris_prismatic_shard_spots) * 0.016))"
	},
	{
		type = "noise-expression",
		name = "prismaris_void_essence_probability",
		expression = "(control:prismaris_void_essence:size > 0)\z
						* (max(prismaris_starting_void_essence * 0.025,\z
							min(aquilo_starting_mask, prismaris_void_essence_spots) * 0.013))"

	},
	{
		type = "noise-expression",
		name = "prismaris_prismatic_shard_spots",
		expression = "aquilo_spot_noise{seed = 568,\z
						count = 4,\z
						skip_offset = 0,\z
						region_size = 600 + 400 / control:prismaris_prismatic_shard:frequency,\z
						density = 1,\z
						radius = aquilo_spot_size * sqrt(control:prismaris_prismatic_shard:size),\z
						favorability = 1}"
	},
	{
		type = "noise-expression",
		name = "prismaris_void_essence_spots",
		expression = "aquilo_spot_noise{seed = 568,\z
						count = 3,\z
						skip_offset = 1,\z
						region_size = 600 + 400 / control:prismaris_void_essence:frequency,\z
						density = 1,\z
						radius = aquilo_spot_size * 1.2 * sqrt(control:prismaris_void_essence:size),\z
						favorability = 1}"
	},
	{
		type = "noise-expression",
		name = "prismaris_island_peaks",
		-- before this point all spots should be in the -1 to 1 range
		expression = "max(1.7 * (0.3 + aquilo_starting_island),\z
						1.5 * (0.5 + max(aquilo_starting_crude_oil, prismaris_prismatic_shard_spots,\z
						aquilo_starting_lithium_brine, prismaris_void_essence_spots)))"
	},
}

local prismaris_elevation = table.deepcopy(data.raw["noise-expression"]["aquilo_elevation"])
prismaris_elevation.name = "prismaris_elevation"
prismaris_elevation.local_expressions.formation_clumped = "-25\z
														+ 12 * max(prismaris_island_peaks, random_island_peaks)\z
														+ 15 * tri_crack"
prismaris_elevation.local_expressions.formation_broken = "-20\z
														+ 8 * max(prismaris_island_peaks * 1.1, min(0., random_island_peaks - 0.2))\z
														+13 * (pow(voronoi_large * max(0, voronoi_large_cell * 1.2 - 0.2) + 0.5 * voronoi_small * max(0, aux + 0.1), 0.5))"

data:extend{prismaris_elevation}