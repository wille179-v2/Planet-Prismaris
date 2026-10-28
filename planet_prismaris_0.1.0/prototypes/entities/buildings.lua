require ("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
require ("util")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local remnants = require("__base__.prototypes.entity.remnants")

local entityGraphics = prismarisConstants.entityGraphicsPath
local iconGraphics = prismarisConstants.iconsPath

--[[local electricHeater = table.deepcopy(data.raw['reactor']['heating-tower'])
electricHeater.name = pre .. "electric-heater"
electricHeater.heating_radius = 5
electricHeater.energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
	drain = "50kW"
}
electricHeater.consumption = "10MW"
electricHeater.scale_energy_usage = true
electricHeater.heat_buffer.max_temperature = 1000
electricHeater.heat_buffer.specific_heat = "1MJ"
electricHeater.minable.results = nil
electricHeater.minable.result = pre .. "electric-heater"
electricHeater.surface_conditions = nil]]

local electricHeater = {
	type = "reactor",
	name = pre .. "electric-heater",
	circuit_connector = circuit_connector_definitions.create_single(universal_connector_template, {
		variation = 30,
		main_offset = util.by_pixel(-1, 33.5),
		shadow_offset = util.by_pixel(-1, 33.5),
		show_shadow = true
	}),
	circuit_wire_max_distance = 9,
	collision_box = {{-2.25, -2.1}, {2.25, 2.1}},
	selection_box = {{-2.5, -2.3}, {2.5, 2.3}},
	max_health = 500,
	damaged_trigger_effect = hit_effects.entity(),
	energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
		drain = "100kW"
	},
	consumption = "10MW",
	scale_energy_usage = true,
	heat_buffer = {
		max_temperature = 800,
		specific_heat = "1MJ",
		max_transfer = "10GW",
		minimum_glow_temperature = 30,
		connections = {
			{
				position = {0,-2},
				direction = defines.direction.north
			},
			{
				position = {2,0},
				direction = defines.direction.east
			},
			{
				position = {0,2},
				direction = defines.direction.south
			},
			{
				position = {-2,0},
				direction = defines.direction.west
			},
		},
		heat_picture = {
			layers = {
				util.sprite_load(entityGraphics .. "electric-heater/glow", {
					scale = 0.42,
					blend_mode = "additive",
					tint = {0.55, 0.55, 0.55, 1},
					draw_as_glow = true
				}),
				util.sprite_load(entityGraphics .. "electric-heater/flare",{
					scale = 0.42,
					blend_mode = "additive",
					tint = {0.13,0.13,0.13,1},
					draw_as_glow = true
				})
			}
		}
	},
	connection_patches_connected = {
		sheet = util.sprite_load(entityGraphics .. "electric-heater/heating-tower-pipes", {
			scale = 0.5,
			variation_count = 4
		})
	},
	connection_patches_disconnected = {
		sheet = util.sprite_load(entityGraphics .. "electric-heater/heating-tower-pipes-disconnected", {
			scale = 0.5,
			variation_count = 4
		})
	},
	heat_connection_patches_connected = {
		sheet = apply_heat_pipe_glow(
			util.sprite_load(entityGraphics .. "electric-heater/heating-tower-pipes-heat", {
				scale = 0.5,
				variation_count = 4
			})
		)
	},
	heat_connection_patches_disconnected = {
		sheet = apply_heat_pipe_glow(
			util.sprite_load(entityGraphics .. "electric-heater/heating-tower-pipes-heat-disconnected", {
				scale = 0.5,
				variation_count = 4
			})
		)
	},
	heating_radius = 5,
	neighbor_bonus = 0,
	picture = {
		layers = {
			util.sprite_load(entityGraphics .. "electric-heater/tower",{
				scale = 0.42,
			}),
			util.sprite_load(entityGraphics .. "electric-heater/shadow", {
				scale = 0.42,
				draw_as_shadow = true
			})
		}
	},
	icon = iconGraphics .. "electric-heater.png",
	icon_size = 64,
	open_sound = {filename = "__base__/sound/open-close/metal-large-open.ogg", volume = 0.8},
	close_sound = {filename = "__base__/sound/open-close/metal-large-close.ogg", volume = 0.8},
	working_sound = {
		sound = {audible_distance_modifier = 0.9, filename = "__base__/sound/heat-pipe.ogg", volume = 0.85},
		max_sounds_per_prototype = 3,
		fade_in_ticks = 4,
		fade_out_ticks = 20
	},
	default_temperature_signal = {type = "virtual", name = "signal-T"},
	minable = {mining_time = 0.2, result = pre .. "electric-heater"},
	fast_replaceable_group = "radiative-tower", -- for Cerys compatibility
}



local lunarPanel = {
	type = "solar-panel",
	name = pre .. "lunar-panel",
	icon = iconGraphics .. "lunar-panel.png",
	flags = {"placeable-neutral", "player-creation"},
	minable = {mining_time = 0.1, result = pre .. "lunar-panel"},
	fast_replaceable_group = "solar-panel",
	max_health = 200,
	corpse = pre .. "lunar-panel-remnants",
	dying_explosion = "solar-panel-explosion",
	collision_box = {{-1.35, -1.35}, {1.35, 1.35}},
	selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	damaged_trigger_effect = hit_effects.entity(),
	energy_source = {
		type = "electric",
		usage_priority = "solar"
	},
	picture = {
		layers = {
			{
				filename = entityGraphics .. "lunar-panel/lunar-panel.png",
				priority = "high",
				width = 230,
				height = 224,
				shift = util.by_pixel(3,3.5), -- the vanilla panel has a -3 x shift, but this art is mirrored on x.
				scale = 0.5
			},
			{
				filename = entityGraphics .. "lunar-panel/lunar-panel-shadow.png",
				priority = "high",
				width = 220,
				height = 180,
				shift = util.by_pixel(3.5,6),
				draw_as_shadow = true,
				scale = 0.5
			}
		}
	},
	overlay = {
		layers = {
			{
				filename = entityGraphics .. "lunar-panel/lunar-panel-shadow-overlay.png",
				priority = "high",
				width = 214,
				height = 180,
				shift = util.by_pixel(3.5,6),
				scale = 0.5,
				--draw_as_shadow = true
			}
		}
	},
	impact_category = "glass",
	production = "120kW",
	performance_at_day = 0,
	performance_at_night = 1,
	water_reflection = {
		pictures = {
			filename = entityGraphics .. "lunar-panel/lunar-panel-reflection.png",
			priority = "extra-high",
			width = 24,
			height = 24,
			shift = util.by_pixel(-5,40),
			variation_count = 1,
			scale = 5
		},
		rotate = false,
		orientation_to_variation = false,
	},
	surface_conditions = {
		{
			property = "gravity",
			min = 0.01
		}
	}
}
local lunarPanelCorpse = {
	type = "corpse",
	name = pre .. "lunar-panel-remnants",
	icon = iconGraphics .. "lunar-panel.png",
	flags = {"placeable-neutral","not-on-map"},
	hidden_in_factoriopedia = true,
	subgroup = "energy-remnants",
	order = "a-c-a-b",
	selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	tile_width = 3,
	tile_height = 3,
	selectable_in_game = false,
	time_before_removed = 60 * 60 * 15, -- 15 minutes
	expires = false,
	final_render_layer = "remnants",
	remove_on_tile_placement = false,
	animation = make_rotated_animation_variations_from_sheet(2, {
		filename = entityGraphics .. "lunar-panel/remnants/lunar-panel-remnants.png",
		line_length = 1,
		width = 290,
		height = 282,
		direction_count = 1,
		shift = util.by_pixel(3.5,0),
		scale = 0.5
	})
}

data:extend{electricHeater,lunarPanel,lunarPanelCorpse}



