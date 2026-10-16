-- Referencing base / space age where I can.
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")

local tile_lightening = 28
--vulcanus_tile_offset = 40

local terrainPath = prismarisConstants.terrainPath
local transitionsPath = terrainPath .. "entropy-transitions/"

local entropy_patch = {
	filename = transitionsPath .. "entropy-patch.png",
	scale = 0.5,
	width = 64,
	height = 64
}

local water_transition_group_id = 1
local lava_transition_group_id = 3
local out_of_map_transition_group_id = 2
local default_transition_group_id = 0
local entropy_transition_group_id = 4 -- let's see if this works


local entropy_stone_transitions = { -- Used in non-entropy tiles as transitions
	{
		to_tiles = water_tile_type_names,
		transition_group = water_transition_group_id,
		spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold.png",
		layout = tile_spritesheet_layout.transition_16_16_16_4_4,
		effect_map_layout = {
			spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count = 8,
			u_transition_count = 2,
			o_transition_count = 1
		}
	},
	{
		to_tiles = lava_tile_type_names,
		transition_group = lava_transition_group_id,
		spritesheet = transitionsPath .. "entropy-stone.png",
		layout = tile_spritesheet_layout.transition_16_16_16_4_4,
		lightmap_layout = { spritesheet = transitionsPath .. "entropy-stone-lightmap.png" },
		 -- this added the lightmap spritesheet
		effect_map_layout =
		{
			spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-mask.png",
			inner_corner_count = 8,
			outer_corner_count = 8,
			side_count = 8,
			u_transition_count = 2,
			o_transition_count = 1
		}
	},
	{
		to_tiles = {"out-of-map","empty-space","oil-ocean-shallow"},
		transition_group = out_of_map_transition_group_id,

		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,

		spritesheet = transitionsPath .. "rocky-entropy-out-of-map-transition.png",
		layout = tile_spritesheet_layout.transition_4_4_8_1_1,
		overlay_enabled = false
	}
}

local entropy_stone_transitions_between_transitions = {
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = water_transition_group_id,

		spritesheet = "__space-age__/graphics/terrain/water-transitions/lava-stone-cold-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		effect_map_layout =
		{
			spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = entropy_patch
	},
	{
		transition_group1 = water_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,

		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,

		spritesheet = "__space-age__/graphics/terrain/out-of-map-transition/lava-stone-cold-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		effect_map_layout =
		{
			spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
			o_transition_count = 0
		}
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = lava_transition_group_id,

		spritesheet = transitionsPath .. "entropy-stone-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		effect_map_layout =
		{
			spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-land-mask.png",
			o_transition_count = 0
		},
		water_patch = entropy_patch
	},
	{
		transition_group1 = lava_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,

		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,

		spritesheet = transitionsPath .. "entropy-stone-shore-out-of-map-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		effect_map_layout =
		{
			spritesheet = "__space-age__/graphics/terrain/effect-maps/lava-dirt-to-out-of-map-mask.png",
			o_transition_count = 0
		}
	},
	{
		transition_group1 = default_transition_group_id,
		transition_group2 = out_of_map_transition_group_id,

		background_layer_offset = 1,
		background_layer_group = "zero",
		offset_background_layer_by_tile_layer = true,

		spritesheet = transitionsPath .. "entropy-out-of-map-transition-transition.png",
		layout = tile_spritesheet_layout.transition_3_3_3_1_0,
		overlay_enabled = false
	}
}

local entropy_to_out_of_map_transitions = {
	to_tiles = out_of_map_tile_type_names,
	transition_group = out_of_map_transition_group_id,

	overlay_layer_group = "zero",
	apply_effect_color_to_overlay = false,
	background_layer_offset = 1,
	background_layer_group = "zero",
	offset_background_layer_by_tile_layer = true,
	spritesheet = transitionsPath .. "entropy-out-of-map-transition.png",
	lightmap_layout = { spritesheet = transitionsPath .. "entropy-out-of-map-transition.png" },
	layout = tile_spritesheet_layout.transition_4_4_8_1_1,
	background_enabled = false,
	mask_layout =
	{
		spritesheet = "__space-age__/graphics/terrain/masks/lava-edge-transition.png",
		count = 1,
		double_side_count = 0,
		scale = 0.5,
		outer_corner_x = 64,
		side_x = 128,
		u_transition_x = 192,
		o_transition_x = 256,
		y = 0
	}
}

local destroyed_item_trigger =
{
	type = "direct",
	action_delivery =
	{
		type = "instant",
		source_effects =
		{
			type = "create-trivial-smoke",
			smoke_name = "smoke",
			offset_deviation = {{-0.1, -0.1}, {0.1, 0.1}},
			starting_frame_deviation = 5
		}
	}
}

tiles = {
	{ -- Entropic Sea
		type = "tile",
		name = pre .. "entropic-sea",
		subgroup = "prismaris-tiles",
		order = "a-b",
		collision_mask = tile_collision_masks.water(),
		autoplace = { probability_expression = "max(lava_basalts_range, lava_mountains_range)" },
		effect = "entropy",
		fluid = pre .. "liquid-entropy",
		effect_color = {200,200,200}, -- TODO Experiment with these colors a bit
		effect_color_secondary = {40,40,40},
		particle_tints = {
			primary = {200,200,200},
			secondary = {200,200,200}
		},
		destroys_dropped_items = true,
		default_destroyed_dropped_item_trigger = destroyed_item_trigger,
		layer = 6,
		layer_group = "water-overlay",
		--sprite_usage_surface = "vulcanus", --If I use this, all should be from the same planet sprite atlas, probably vulcanus.
		variants = tile_variations_template(
			terrainPath .. "entropy.png",
			"__base__/graphics/terrain/masks/transition-1.png",
			{
				max_size = 4,
				[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
				[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
				[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			}
		),
		allowed_neightbors = {pre .. "entropic-sea-deep"},
		transitions = {entropy_to_out_of_map_transitions},
		map_color = {128,128,128},
		walking_speed_modifier = 1,
		vehicle_friction_modifier = 1,
		absorptions_per_second = tile_pollution.lava,
		trigger_effect = tile_trigger_effects.hot_lava_trigger_effect(),
		default_cover_tile = "landfill",
		ambient_sounds = tile_sounds.ambient.lava,
	},
	{ -- Entropic Sea Deep
		type = "tile",
		name = pre .. "entropic-sea-deep",
		subgroup = "prismaris-tiles",
		factoriopedia_alternative = pre .. "entropic-sea",
		order = "a-a",
		collision_mask = tile_collision_masks.water(),
		autoplace = { probability_expression = "max(lava_hot_basalts_range, lava_hot_mountains_range)" },
		effect = "entropy-deep",
		fluid = pre .. "liquid-entropy",
		effect_color = {200,200,200}, -- TODO Experiment with these colors a bit
		effect_color_secondary = {40,40,40},
		particle_tints = {
			primary = {200,200,200},
			secondary = {200,200,200}
		},
		destroys_dropped_items = true,
		default_destroyed_dropped_item_trigger = destroyed_item_trigger,
		layer = 5,
		layer_group = "water",
		--sprite_usage_surface = "vulcanus", --If I use this, all should be from the same planet sprite atlas, probably vulcanus.
		variants = {
				main =
				{
					{
						picture = terrainPath .. "entropy-deep.png",
						count = 1,
						scale = 0.5,
						size = 1
					}
				},
			empty_transitions=true,
		},
		allowed_neightbors = {pre .. "entropic-sea"},
		transitions = {entropy_to_out_of_map_transitions},
		map_color = {128,128,128},
		walking_speed_modifier = 1,
		vehicle_friction_modifier = 1,
		absorptions_per_second = tile_pollution.lava,
		trigger_effect = tile_trigger_effects.hot_lava_trigger_effect(),
		default_cover_tile = "landfill",
		ambient_sounds = tile_sounds.ambient.lava,
	},
	{ -- Aethric Soil
		type = "tile",
		name = pre .. "aethric-soil",
		-- order = ???,
		subgroup = "prismaris-tiles",
		collision_mask = tile_collision_masks.ground(),
		autoplace = { probability_expression = "max(volcanic_soil_light_range,volcanic_soil_dark_range,volcanic_ash_soil_range)" },
		layer_group = "ground-natural",
		layer = 21,
		searchable = true,
		trigger_effect = tile_trigger_effects.landfill_trigger_effect(),
		--sprite_usage_surface = "vulcanus",
		transitions = entropy_stone_transitions,
		transitions_between_transitions = entropy_stone_transitions_between_transitions,
		variants = tile_variations_template_with_transitions_and_effect_map(
			"__space-age__/graphics/terrain/natural-jellynut-soil.png",
			"__space-age__/graphics/terrain/effect-maps/water-gleba-mask.png",
			{
				max_size = 4,
				[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
				[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
				[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
			}
		),
		walking_sound = tile_sounds.walking.semi_wet,
		landing_steps_sound = tile_sounds.landing.semi_wet,
		build_sound = base_tile_sounds.building.landfill,
		map_color={185, 5, 166},
		scorch_mark_color = {rq = 0.329, g = 0.242*2, b = 0.177, a = 1.000},
		-- minable = {
			-- mining_time = 0.5,
			-- result = pre .. "aethric-soil"
		-- },
		-- placeable_by = {
			-- item = pre .. "aethric-soil",
			-- count = 1
		-- }

	}
}

data:extend(tiles)

data:extend(
{
	{
		type = "tile-effect",
		name = "entropy",
		shader = "water",
		water =
		{
			shader_variation = "lava",
			noise_textures =
			{
				{
					filename = terrainPath .. "/entropy-textures/entropy-noise-texture-1.png",
					size = 512,
					color_channels = 2
				},
				{
					filename = terrainPath .. "/entropy-textures/entropy-noise-texture-2.png",
					size = 512,
					color_channels = 1
				}
			},
			image_textures = {
				{
					filename = terrainPath .. "entropy-textures/entropy.png"
				}
			},
			texture_variations_columns = 1,
			texture_variations_rows = 1,
			secondary_texture_variations_columns = 4,
			secondary_texture_variations_rows = 2,

			animation_speed = 1.5,
			animation_scale = { 0.7, 0.7 },
			tick_scale = 1,

			specular_lightness = { 25, 25, 25},
			foam_color = { 40, 40, 40},
			foam_color_multiplier = 1.3,

			dark_threshold = { 0.755, 0.755 },
			reflection_threshold = { 1, 1 },
			specular_threshold = { 0.889, 0.291 },

			near_zoom = 1 / 16,
			far_zoom = 1 / 16
		}
	},
	{
		type = "tile-effect",
		name = "entropy-deep",
		shader = "water",
		water =
		{
			shader_variation = "lava",
			noise_textures =
			{
				{
					filename = terrainPath .. "/entropy-textures/entropy-noise-texture-1.png",
					size = 512,
					color_channels = 2
				},
				{
					filename = terrainPath .. "/entropy-textures/entropy-noise-texture-2.png",
					size = 512,
					color_channels = 1
				}
			},
			image_textures = {
				{
					filename = terrainPath .. "entropy-textures/entropy-deep.png"
				}
			},
			texture_variations_columns = 1,
			texture_variations_rows = 1,
			secondary_texture_variations_columns = 4,
			secondary_texture_variations_rows = 2,

			animation_speed = 1.5,
			animation_scale = { 0.7, 0.7 },
			tick_scale = 1,

			specular_lightness = { 25, 25, 25},
			foam_color = { 40, 40, 40},
			foam_color_multiplier = 1.3,

			dark_threshold = { 0.755, 0.755 },
			reflection_threshold = { 1, 1 },
			specular_threshold = { 0.889, 0.291 },

			near_zoom = 1 / 16,
			far_zoom = 1 / 16
		}
	}
})

--table.insert(lava_tile_type_names, pre .. "entropic-sea")
--table.insert(lava_tile_type_names, pre .. "entropic-sea-deep")

-- add lava tiles to water tiles (for tiles that doesn't have defined transitions to lava)
table.insert(water_tile_type_names, pre .. "entropic-sea")
table.insert(water_tile_type_names, pre .. "entropic-sea-deep")


local translationMap = {
	{"concrete-lava","concrete-entropy","concrete-entropy-lightmap"},
	{"concrete-transitions-lava","concrete-transitions-entropy.png","concrete-transitions-lightmap"},
	{"lava-stone","entropy-stone.png","entropy-stone-lightmap"},
	{"foundation-lava","foundation-entropy","foundation-entropy-lightmap"},
	{"foundation-transitions-lava","foundation-transitions-entropy","foundation-transitions-lightmap"},
	{"lava-patch","entropy-patch",nil},
	{"lava-stone","entropy-stone","entropy-stone-lightmap"},
	{"lava-stone-transition","entropy-stone-transition",nil},
	{"refined-concrete-lava","refined-concrete-entropy","refined-concrete-entropy-lightmap"},
	{"refined-concrete-transitions-lava","refined-concrete-transitions-entropy","refined-concrete-transitions-lightmap"},
	{"stone-path-lava","stone-path-entropy","stone-path-entropy-lightmap"},
	{"stone-path-lava-transitions","stone-path-entropy-transitions","stone-path-entropy-transitions-lightmap"},
	{"concrete-lava-shore-out-of-map","concrete-entropy-shore-out-of-map","concrete-entropy-shore-out-of-map-lightmap"},
	{"foundation-lava-shore-out-of-map","foundation-entropy-shore-out-of-map","foundation-entropy-shore-out-of-map-lightmap"},
	{"refined-concrete-lava-shore-out-of-map","refined-concrete-entropy-shore-out-of-map","refined-concrete-entropy-shore-out-of-map-lightmap"},
	{"stone-path-lava-shore-out-of-map","stone-path-entropy-shore-out-of-map","stone-path-entropy-shore-out-of-map-lightmap"},
}

function getNewSpritesheet(oldSpritesheet, isLightmap)
	--log("get new spritesheet for " .. oldSpritesheet)
	for _,mapping in pairs(translationMap) do
		--log("searching translation map: " .. serpent.block(mapping))
		if string.find(oldSpritesheet,mapping[1],1,true) then
			--log("found mapping: " .. mapping[1])
			if isLightmap then
				--log(mapping[3])
				if mapping[3] then
					return transitionsPath .. mapping[3] .. ".png"
				else return end
			else
				--log(mapping[2])
				return transitionsPath .. mapping[2] .. ".png"
			end
		end
	end
end

-- inserts the transition for entropy and entropy deep into any tile that has a lava transition definition
-- thanks to powerscooter on discord
--[[
for _, tile in pairs(data.raw["tile"]) do
	log(tile.name)
	if tile.transitions then
		local new_transitions = {}
		for _, transition in pairs(tile.transitions) do
			table.insert(new_transitions, transition)
			if transition.to_tiles then
				for _, to_tile in pairs(transition.to_tiles) do
					if to_tile == "lava" then
						--log("found lava transition for " .. tile.name)
						local entropy_transition = table.deepcopy(transition)
						entropy_transition.to_tiles = {pre .. "entropic-sea",pre.."entropic-sea-deep"}
						if entropy_transition.lightmap_layout then
							entropy_transition.lightmap_layout.spritesheet = getNewSpritesheet(entropy_transition.lightmap_layout.spritesheet, true)
						end
						entropy_transition.spritesheet = getNewSpritesheet(entropy_transition.spritesheet)
						table.insert(new_transitions, entropy_transition)
					end
				end
			end
		end
		log("old transitions for " .. tile.name .. ": " .. serpent.block(tile.transitions))
		log("new transitions for " .. tile.name .. ": " .. serpent.block(new_transitions))
		tile.transitions = new_transitions
	end
	if tile.transitions_between_transitions then
		--transition between transitions
		local new_transitionsBetweenTransitions = {}
		for _,transition in pairs(tile.transitions_between_transitions) do
			table.insert(new_transitionsBetweenTransitions, transition)
			if transition.transition_group1 == lava_transition_group_id or transition.transition_group2 == lava_transition_group_id then
				local entropy_transition = table.deepcopy(transition)
				entropy_transition.spritesheet = getNewSpritesheet(entropy_transition.spritesheet)
				if transition.transition_group1 == 3 then
					entropy_transition.transition_group1 = 4
				end
				if transition.transition_group2 == 3 then
					entropy_transition.transition_group1 = 4
				end
				table.insert(new_transitionsBetweenTransitions,entropy_transition)
			end
		end
		tile.transitions_between_transitions = new_transitionsBetweenTransitions
	end
end
]]