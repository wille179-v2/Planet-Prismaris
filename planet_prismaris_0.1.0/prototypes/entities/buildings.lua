require ("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
require ("util")

fluidboxes =  {
	input = { -- North: pre .. "concentrated-void-essence" input
		volume = 200,
		pipe_connections = {
			{	
				flow_direction = "input-output",
				direction = defines.direction.east,
				position = {0.5,-1.5}, -- center of 1 east, 2 north
			},
			{
				flow_direction = "input-output",
				direction = defines.direction.west,
				position = {-0.5,-1.5}, -- center of 1 west, 2 north pre .. "distorted-void-essence"
			}
		},
		filter = pre .. "concentrated-void-essence",
		production_type = "input",
		pipe_picture = table.deepcopy(data.raw["assembling-machine"]["electromagnetic-plant"].fluid_boxes[1].pipe_pictures),
		pipe_covers = table.deepcopy(data.raw["assembling-machine"]["electromagnetic-plant"].fluid_boxes[1].pipe_covers),

	},
	output = { -- North: pre .. "concentrated-void-essence" input
		volume = 200,
		pipe_connections = {
			{	
				flow_direction = "input-output",
				direction = defines.direction.east,
				position = {0.5,1.5}, -- center of 1 east, 2 south
			},
			{
				flow_direction = "input-output",
				direction = defines.direction.west,
				position = {-0.5,1.5}, -- center of 1 west, 2 south 
			}
		},
		filter = pre .. "distorted-void-essence",
		production_type = "output",
		pipe_picture = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_pictures),
		pipe_covers = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_covers),
	},
}



local separatorInventorySize = 8

--Crystal Separator
-- Temporarily using a copy of the stone furnace
local crystalSeparator = table.deepcopy(data.raw['furnace']['stone-furnace'])
crystalSeparator.name = pre .. "crystal-separator"
crystalSeparator.result_inventory_size = separatorInventorySize
crystalSeparator.crafting_categories = {pre .. "crystal-separation"}
crystalSeparator.energy_usage = "180kW"
crystalSeparator.energy_source = {
	type = "electric",
	usage_priority = "secondary-input",
	emissions_per_minute = {["pollution"] = 1}
}
crystalSeparator.minable.results = nil
crystalSeparator.minable.result = pre .. "crystal-separator"
crystalSeparator.minable.mining_time = 1
crystalSeparator.crafting_speed = 2
crystalSeparator.module_slots = 3
crystalSeparator.allowed_module_categories = nil
crystalSeparator.allowed_effects = {"speed","productivity","consumption","pollution","quality"}
crystalSeparator.effect_receiver.uses_module_effects = true
crystalSeparator.effect_receiver.uses_beacon_effects = true
crystalSeparator.heating_energy = "100kW"

local thermalSeparator = table.deepcopy(data.raw['furnace']['electric-furnace'])
thermalSeparator.name = pre .. "thermal-flux-furnace"
thermalSeparator.result_inventory_size = separatorInventorySize
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

local crystalSeparationCategory = {
	type = "recipe-category",
	name = pre .. "crystal-separation"
}

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

data:extend({crystalSeparator,thermalSeparator,electricHeater,crystalSeparationCategory,thermalCrackingCategory,lunarPanel})



