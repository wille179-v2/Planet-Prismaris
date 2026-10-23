require ("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
require ("util")


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

data:extend({electricHeater,lunarPanel})



