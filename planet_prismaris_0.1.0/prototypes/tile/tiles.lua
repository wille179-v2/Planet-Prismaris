local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__space-age__/prototypes/tile/tile-trigger-effects")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local terrainPath = prismarisConstants.terrainPath
local transitionsPath = terrainPath .. "entropy-transitions/"


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

local eyestrainMode = settings.startup["prismaris-entropy-eye-strain-accessibility"].value

local entropic_sea = table.deepcopy(data.raw.tile["ammoniacal-ocean"])
entropic_sea.name = pre .. "entropic-sea"
entropic_sea.order = "a[prismaris-water]-a[entropic-sea]"
entropic_sea.subgroup = "prismaris-tiles"
entropic_sea.fluid = pre .. "liquid-entropy"
entropic_sea.collision_mask = tile_collision_masks.water()
entropic_sea.effect_color = {180,180,180}
entropic_sea.effect_color_secondary = {40,40,40}
entropic_sea.particle_tints = {
	primary = {200,200,200},
	secondary = {200,200,200}
}
entropic_sea.destroys_dropped_items = true
entropic_sea.default_destroyed_dropped_item_trigger = destroyed_item_trigger
entropic_sea.map_color = {180,180,180}
entropic_sea.default_cover_tile = pre .. "solidified-entropy"
entropic_sea.autoplace = {probability_expression = "ammoniacal_ocean"}
entropic_sea.variants = tile_variations_template(
	terrainPath .. "entropy.png",
	"__base__/graphics/terrain/masks/transition-1.png",
	{
		max_size = 4,
		[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	}
)
entropic_sea.allowed_neightbors = {pre .. "entropic-sea-deep"}
entropic_sea.effect = eyestrainMode and "water" or "entropy"
entropic_sea.ambient_sounds = tile_sounds.ambient.lava
entropic_sea.transitions = {entropy_to_out_of_map_transitions}




local entropic_sea_deep = table.deepcopy(data.raw.tile["ammoniacal-ocean"])
entropic_sea_deep.name = pre .. "entropic-sea-deep"
entropic_sea_deep.order = "a[prismaris-water]-b[entropic-sea-deep]"
entropic_sea_deep.subgroup = "prismaris-tiles"
entropic_sea_deep.fluid = pre .. "liquid-entropy"
entropic_sea_deep.collision_mask = tile_collision_masks.water()
entropic_sea_deep.effect_color = {130,130,130}
entropic_sea_deep.effect_color_secondary = {30,30,30}
entropic_sea_deep.particle_tints = {
	primary = {200,200,200},
	secondary = {200,200,200}
}
entropic_sea_deep.destroys_dropped_items = true
entropic_sea_deep.default_destroyed_dropped_item_trigger = destroyed_item_trigger
entropic_sea_deep.map_color = {130,130,130}
entropic_sea_deep.default_cover_tile = pre .. "solidified-entropy"
entropic_sea_deep.autoplace = {probability_expression = "ammoniacal_ocean_2"}
entropic_sea_deep.variants = tile_variations_template(
	terrainPath .. "entropy-deep.png",
	"__base__/graphics/terrain/masks/transition-1.png",
	{
		max_size = 4,
		[1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
		[2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
		[4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
	}
)
entropic_sea_deep.factoriopedia_alternative = pre .. "entropic-sea"
entropic_sea_deep.allowed_neightbors = {pre .. "entropic-sea"}
entropic_sea_deep.effect = eyestrainMode and "water" or "entropy-deep"
entropic_sea_deep.ambient_sounds = tile_sounds.ambient.lava
entropic_sea_deep.transitions = {entropy_to_out_of_map_transitions}


local solidified_entropy = table.deepcopy(data.raw.tile['ice-platform'])
solidified_entropy.name = pre .. "solidified-entropy"
solidified_entropy.collision_mask = table.deepcopy(data.raw.tile["landfill"].collision_mask)
solidified_entropy.minable.result = pre .. "solidified-entropy"
solidified_entropy.map_color = {100,100,120}


data:extend{entropic_sea,entropic_sea_deep,solidified_entropy}

data:extend(
{
	{
		type = "tile-effect",
		name = "entropy",
		shader = "water",
		water =
		{
			shader_variation = "oil",
			noise_textures =
			{
				{
					filename = terrainPath .. "/entropy-textures/oilNoise.png",
					size = 512,
					color_channels = 3
				},
				{
					filename = terrainPath .. "/entropy-textures/oilGradient.png",
					width = 512,
					height = 32,
					color_channels = 3
				}
			},
			image_textures = {
				{
					filename = terrainPath .. "entropy-textures/entropy.png" -- I wanted to experiment with fulgora's oil textures but something about them caused a crash on 2.1.22 so IDK I'm leaving this for now.
				},
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
			shader_variation = "oil",
			noise_textures =
			{
				{
					filename = terrainPath .. "/entropy-textures/oilNoise.png",
					size = 512,
					color_channels = 3
				},
				{
					filename = terrainPath .. "/entropy-textures/oilGradient.png",
					width = 512,
					height = 32,
					color_channels = 3
				}
			},
			image_textures = {
				{
					filename = terrainPath .. "entropy-textures/entropy-deep.png"
				},
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

-- Adds entropic sea transitions to all tiles that have ammoniacle-ocean tiles
for _, tile in pairs(data.raw["tile"]) do
  if tile.transitions then
      local new_transitions = {}
      for _, transition in pairs(tile.transitions) do
          table.insert(new_transitions, transition)
          if transition.to_tiles then
              for _, to_tile in pairs(transition.to_tiles) do
                  if to_tile == "ammoniacal-ocean" then
                      local entropic_transition = table.deepcopy(transition)
                      entropic_transition.to_tiles = {pre.."entropic-sea",pre.."entropic-sea-deep"}
                      table.insert(new_transitions, entropic_transition)
                      break
                  end
              end
          end
      end
      tile.transitions = new_transitions
  end
end

-- Temporary code: clone aquilo Tiles and change their collision_mask to make items buildable without concrete.
-- At some point I'll replace these with standalone tile implementations
local aquiloTiles = {"snow-flat","snow-crests","snow-lumpy","snow-patchy","ice-rough","ice-smooth"}
for _,aquiloTile in pairs(aquiloTiles) do
	local prismarisTile = table.deepcopy(data.raw.tile[aquiloTile])
	prismarisTile.collision_mask = table.deepcopy(data.raw.tile["landfill"].collision_mask)
	prismarisTile.name = pre .. aquiloTile
	data:extend{prismarisTile}
end