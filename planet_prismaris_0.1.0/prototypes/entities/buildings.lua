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
	usage_priority = "primary-input", -- for use on Aquillo, so power fluctuations don't also cause freezes
	
}
electricHeater.consumption = "10MW"
electricHeater.scale_energy_usage = true
electricHeater.heat_buffer.max_temperature = 500
electricHeater.heat_buffer.specific_heat = "1MJ"

local crystalSeparationCategory = {
	type = "recipe-category",
	name = pre .. "crystal-separation"
}

local thermalCrackingCategory = {
	type = "recipe-category",
	name = pre .. "thermal-cracking"
}
data:extend({crystalSeparator,thermalSeparator,electricHeater,crystalSeparationCategory,thermalCrackingCategory})


--Reverse Chronocycler, temporarily using a copy of the recycler
local reversalChronocycler = table.deepcopy(data.raw["furnace"]["recycler"])
reversalChronocycler.name = pre .. "reversal-chronocycler"
reversalChronocycler.crafting_categories = {"recycling",pre.."reverse-chronocycling"}
reversalChronocycler.minable.result = pre .. "reversal-chronocycler"
reversalChronocycler.crafting_speed = .25
reversalChronocycler.effect_receiver = {
	base_effect = {
		productivity = 0.25,
		quality = 0.05
	}
}
reversalChronocycler.energy_usage = "1MW"
reversalChronocycler.energy_source = {
	type = "fluid",
	fluid_box = fluidboxes.input,
	output_fluid_box = fluidboxes.output,
	burns_fluid = true,
	scale_fluid_usage = true,
}
if settings.startup["test-reversal-mode"].value == "complex" then
	reversalChronocycler.localised_description = {"entity-description.prismaris-reversal-chronocycler-complex"}
else
	reversalChronocycler.localised_description = {"entity-description.prismaris-reversal-chronocycler-simple"}
end


--Stasis Chronocycler, temporarily using a copy of the recycler
local stasisChronocycler = table.deepcopy(data.raw["furnace"]["recycler"])
stasisChronocycler.name = pre .. "stasis-chronocycler"
stasisChronocycler.crafting_categories = {pre .. "stasis-chronocycling"}
stasisChronocycler.minable.result = pre .. "stasis-chronocycler"
stasisChronocycler.crafting_speed = 1
stasisChronocycler.allowed_effects = {"speed","consumption","pollution"}
stasisChronocycler.module_slots = 2
stasisChronocycler.energy_usage = "4MW"
stasisChronocycler.energy_source = {
	type = "fluid",
	fluid_box = fluidboxes.input,
	output_fluid_box = fluidboxes.output,
	burns_fluid = true,
	scale_fluid_usage = true,
}
if settings.startup["test-stasis-mode"].value == "refresh" then
	stasisChronocycler.localised_description = {"entity-description.prismaris-stasis-chronocycler-refresh"}
else
	stasisChronocycler.localised_description = {"entity-description.prismaris-stasis-chronocycler-freeze"}
end


--Acceleration Chronocycler, temporarily using a copy of the recycler
local accelerationChronocycler = table.deepcopy(data.raw["furnace"]["recycler"])
accelerationChronocycler.name = pre .. "acceleration-chronocycler"
accelerationChronocycler.crafting_categories = {pre.."acceleration-chronocycling"}
accelerationChronocycler.minable.result = pre .. "acceleration-chronocycler"
accelerationChronocycler.crafting_speed = 1
accelerationChronocycler.energy_usage = "4MW"
accelerationChronocycler.energy_source = {
	type = "fluid",
	fluid_box = fluidboxes.input,
	output_fluid_box = fluidboxes.output,
	burns_fluid = true,
	scale_fluid_usage = true,
}

local lunarPanel = table.deepcopy(data.raw["solar-panel"]["solar-panel"])
lunarPanel.name = pre .. "lunar-panel"
lunarPanel.performance_at_day = 0
lunarPanel.performance_at_night = 1
lunarPanel.production = "120kW"
lunarPanel.minable.result = pre .. "lunar-panel"

local voidBeacon = table.deepcopy(data.raw["beacon"]["beacon"])
voidBeacon.name = pre .. "void-beacon"
voidBeacon.energy_usage = "1.44MW"
voidBeacon.module_slots = 3
voidBeacon.allowed_effects = {"consumption","speed","pollution","productivity","quality"}
voidBeacon.supply_area_distance = 4
voidBeacon.distribution_effectivity = 1.75
voidBeacon.distribution_effectivity_bonus_per_quality_level = 0.25
-- TODO: When Nonstandard Beacons mod gets updated to 2.1, convert to fluid burning beacon
voidBeacon.minable.result = pre .. "void-beacon"

data:extend({
	reversalChronocycler,
	stasisChronocycler,
	accelerationChronocycler,
	lunarPanel,
	voidBeacon,
	{
		type = "recipe-category",
		name = pre .. "reverse-chronocycling"
	},
	{
		type = "recipe-category",
		name = pre .. "stasis-chronocycling"
	},
	{
		type = "recipe-category",
		name = pre .. "acceleration-chronocycling"
	},
})

data:extend({
	{
		type = "recipe-category",
		name = pre .. "cognition"
	},
	{
		type="assembling-machine",
		name=pre.."cogitor",
		icon = prismarisConstants.iconsPath .. "cogitor.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {mining_time = 0.1, result = pre.."cogitor"},
		max_health = 400,
		dying_explosion = "electromagnetic-plant-explosion",
		--icon_draw_specification = {shift = {0, -0.25}}, -- Move the alt-mode icon if needed
		circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
		energy_usage="2.7MW",
		crafting_speed=5,
		crafting_categories = {pre .. "cognition"},
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
		},
		effect_receiver = {
			base_effect = {
				quality = .5
			},
			productivity_limits = {low = 0, high = 0}
		},
		module_slots = 6,
		quality_affects_module_slots = true,
		allowed_effects = {"quality"},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-shadow.png",
						priority = "high",
						width = 900,
						height = 420,
						frame_count = 1,
						line_length = 1,
						repeat_count = 100,
						animation_speed = 0.3,
						draw_as_shadow = true,
						scale = 0.5
					},
					{
						priority = "high",
						width = 410,
						height = 410,
						frame_count = 100,
						shift = util.by_pixel_hr(0,-16), -- Note this is from factorio's core util script
						animation_speed = 0.3,
						scale = 0.5,
						stripes = {
							{
								filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-animation-1.png",
								width_in_frames = 8,
								height_in_frames = 8,
							},
							{
								filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-animation-2.png",
								width_in_frames = 8,
								height_in_frames = 8,
							},
						}
					},
					{
						priority = "high",
						width = 410,
						height = 410,
						frame_count = 100,
						shift = util.by_pixel_hr(0, -16),
						draw_as_glow = true,
						scale = 0.5,
						animation_speed = 0.3,
						blend_mode = "additive",
						stripes = {
							{
								filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-emission-1.png",
								width_in_frames = 8,
								height_in_frames = 8,
							},
							{
								filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-emission-2.png",
								width_in_frames = 8,
								height_in_frames = 8,
							},
						}
					}
				}
			},
			idle_animation = {
				layers = {
					{
						filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-shadow.png",
						priority = "high",
						width = 900,
						height = 420,
						frame_count = 1,
						line_length = 1,
						repeat_count = 100,
						animation_speed = 0.3,
						draw_as_shadow = true,
						scale = 0.5
					},
					{
						priority = "high",
						width = 410,
						height = 410,
						frame_count = 100,
						shift = util.by_pixel_hr(0,-16), -- Note this is from factorio's core util script
						animation_speed = 0.3,
						scale = 0.5,
						stripes = {
							{
								filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-animation-1.png",
								width_in_frames = 8,
								height_in_frames = 8,
							},
							{
								filename = prismarisConstants.entityGraphicsPath .. "cogitor/cogitor-animation-2.png",
								width_in_frames = 8,
								height_in_frames = 8,
							},
						}
					},
				}
			}
		},
		collision_box = {{-2.9,-2.9},{2.9,2.9}},
		selection_box = {{-3,-3},{3,3}},
		--working_sound = ???, -- TODO
		--mined_sound = ???,
		impact_category = "metal",
		--open_sound = ???,
		--close_sound = ???,
		heating_energy = "300kW",
		placeable_by = {item = pre.."cogitor", count = 1},
		--map_color = ???,
		order = "y[cogitor]",
		subgroup = "production-machine",
	}
})