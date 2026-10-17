require ("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
require ("util")



local thermalSeparator = table.deepcopy(data.raw['furnace']['electric-furnace'])
thermalSeparator.name = pre .. "thermal-flux-furnace"
thermalSeparator.result_inventory_size = prismarisConstants.separatorInventorySize
thermalSeparator.crafting_categories = {pre .. "crystal-separation", pre .. "thermal-cracking","smelting"}
thermalSeparator.effect_receiver = {
	base_effect = {
		productivity = 0.25
	}
}
thermalSeparator.energy_usage = "220kW"
thermalSeparator.energy_source = {
	type = "heat",
	emissions_per_minute = { pollution = 1 },
	max_temperature = 1000,
	max_transfer = "2GW",
	min_working_temperature = 350,
	minimum_glow_temperature = 350,
	specific_heat = "500kJ",
	connections = {
		{
			position = {0,-1},
			direction = defines.direction.north
		},
		{
			position = {1,0},
			direction = defines.direction.east
		},
		{
			position = {0,1},
			direction = defines.direction.south
		},
		{
			position = {-1,0},
			direction = defines.direction.west
		},
	},
	heat_pipe_covers = table.deepcopy(data.raw["heat-pipe"]["heat-pipe"].heat_buffer.heat_pipe_covers),
	heat_picture = table.deepcopy(data.raw["heat-pipe"]["heat-pipe"].heat_buffer.heat_picture)
}
thermalSeparator.minable.results = nil
thermalSeparator.minable.result = pre .. "thermal-flux-furnace"
thermalSeparator.minable.mining_time = 1
thermalSeparator.crafting_speed = 3
thermalSeparator.module_slots = 6
thermalSeparator.allowed_module_categories = nil
thermalSeparator.allowed_effects = {"speed","productivity","consumption","pollution","quality"}
thermalSeparator.heating_energy = nil


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

local thermalCrackingCategory = {
	type = "recipe-category",
	name = pre .. "thermal-cracking"
}

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
}

data:extend({thermalSeparator,electricHeater,thermalCrackingCategory,lunarPanel})



