local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_effects = require("__space-age__.prototypes.item-effects")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")


local fluxGraphics = prismarisConstants.entityGraphicsPath .. "thermal-flux-furnace/"
local iconGraphics = prismarisConstants.iconsPath
local furnaceName = pre .. "thermal-flux-furnace"


local heated_pipes_tint = {0.5, 0.4, 0.3, 0.5}
local heat_glow_tint = {1, 1, 1, 1}
apply_heat_pipe_glow = function(layer)
  layer.tint = heated_pipes_tint
  local light_layer = util.copy(layer)
  light_layer.draw_as_light = true
  light_layer.tint = heat_glow_tint
  return
  {
    layers =
    {
      layer,
      light_layer
    }
  }
end

local animSpeed = 0.5

circuit_connector_definitions[furnaceName] = circuit_connector_definitions.create_vector
(
  universal_connector_template,
  {
    { variation = 25, main_offset = util.by_pixel(-37.75,  28.25), shadow_offset = util.by_pixel(-37.75,  28.25), show_shadow = true },
    { variation = 25, main_offset = util.by_pixel(-37.75,  28.25), shadow_offset = util.by_pixel(-37.75,  28.25), show_shadow = true },
    { variation = 25, main_offset = util.by_pixel(-37.75,  28.25), shadow_offset = util.by_pixel(-37.75,  28.25), show_shadow = true },
    { variation = 25, main_offset = util.by_pixel(-37.75,  28.25), shadow_offset = util.by_pixel(-37.75,  28.25), show_shadow = true },
  }
)

data:extend{
	{
		type = "recipe-category",
		name = pre .. "thermal-cracking"
	},
	{
		name = furnaceName,
		type = "furnace",
		icon = iconGraphics .. "thermal-flux-furnace.png",
		icon_size = 64,
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {
			mining_time = 0.5,
			results = {{type = "item", name = furnaceName, amount = 1}}
		},
		max_health = 500,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		circuit_wire_max_distance = furnace_circuit_wire_max_distance,
		circuit_connector = circuit_connector_definitions[furnaceName],
		collision_box = {{-2.1, -2.1}, {2.1, 2.1}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		crafting_speed = 4,
		source_inventory_size = 1,
		result_inventory_size = 5,
		trash_inventory_size = 1,
		crafting_categories = {pre .. "thermal-cracking","smelting"}, -- Removed pre .. "crystal-separation"
		effect_receiver = {
			base_effect = {
				productivity = 0.25
			}
		},
		energy_usage = "300kW",
		energy_source = {
			type = "heat",
			emissions_per_minute = { pollution = 1 },
			max_temperature = 1000,
			max_transfer = "10GW",
			min_working_temperature = 500,
			minimum_glow_temperature = 500,
			specific_heat = "1MJ",
			connections = table.deepcopy(data.raw["reactor"]["nuclear-reactor"].heat_buffer.connections),
			pipe_covers = {
				north = {
					filename = fluxGraphics .. "cover-north.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(0,24)
				},
				east = {
					filename = fluxGraphics .. "cover-east.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(-24,0)
				},
				south = {
					filename = fluxGraphics .. "cover-south.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(0,-21)
				},
				west = {
					filename = fluxGraphics .. "cover-west.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(24,0)
				}
			},
			heat_pipe_covers = {
				north = apply_heat_pipe_glow{
					filename = fluxGraphics .. "cover-north.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(0,24)
				},
				east = apply_heat_pipe_glow{
					filename = fluxGraphics .. "cover-east.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(-24,0)
				},
				south = apply_heat_pipe_glow{
					filename = fluxGraphics .. "cover-south.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(0,-21)
				},
				west = apply_heat_pipe_glow{
					filename = fluxGraphics .. "cover-west.png",
					size = 64,
					scale = 0.5,
					shift = util.by_pixel(24,0)
				}
			},
			heat_picture = apply_heat_pipe_glow{
				filename = fluxGraphics .. "thermal-flux-heat-picture.png",
				size = 320,
				scale = 0.5
			},
		},
		impact_category = "metal",
		open_sound = sounds.metal_large_open,
		close_sound = sounds.metal_large_close,
		module_slots = 6,
		allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
		graphics_set = {
			always_draw_idle_animation = true,
			idle_animation = {
				layers = {
					{
						filename = fluxGraphics .. "thermal-flux-furnace-hr-shadow.png",
						size = {600, 400},
						shift = {0, 0},
						scale = 0.5,
						line_length = 1,
						frame_count = 1,
						repeat_count = 50,
						draw_as_shadow = true,
						animation_speed = animSpeed,
					},
					{
						filename = fluxGraphics .. "thermal-flux-furnace-heat-pipes.png",
						width = 320,
						height = 320,
						scale = 0.5,
						line_length = 1,
						frame_count = 1,
						repeat_count = 50
					},
					{
						filename = fluxGraphics .. "thermal-flux-furnace-hr-animation-1.png",
						size = {320, 320},
						shift = {0, 0},
						scale = 0.5,
						line_length = 8,
						lines_per_file = 7,
						frame_count = 50,
						animation_speed = animSpeed,
					},
				}
			},
			working_visualisations = {{
				fadeout = true,
				secondary_draw_order = 1,
				animation = {
					layers = {
						{
							filename = fluxGraphics .. "thermal-flux-furnace-hr-emission-1.png",
							size = {320,320},
							scale = 0.5,
							line_length = 8,
							lines_per_file = 7,
							frame_count = 50,
							draw_as_glow = true,
							blend_mode = "additive",
							animation_speed = animSpeed,
						}
					}
				}
			}},
		},
		working_sound = {
			sound = {filename = "__base__/sound/electric-furnace.ogg", volume = 0.9}
		}
	}
}