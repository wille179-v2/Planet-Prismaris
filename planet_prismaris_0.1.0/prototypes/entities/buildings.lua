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

local electricHeater = table.deepcopy(data.raw['reactor']['heating-tower'])
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
electricHeater.surface_conditions = nil

--[[
local lunarPanel = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
lunarPanel.name = pre .. "lunar-panel"
lunarPanel.performance_at_day = 0
lunarPanel.performance_at_night = 1
lunarPanel.production = "120kW"
lunarPanel.minable.result = pre .. "lunar-panel"
lunarPanel.surface_conditions = { -- Not usable in space where it's always day.
	{
		property = "gravity",
		min = 0.1
	}
}]]

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



