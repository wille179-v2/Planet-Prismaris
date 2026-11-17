require ("circuit-connector-sprites")

local recyclerReference = table.deepcopy(data.raw["furnace"]["recycler"])
local chronoPath = prismarisConstants.entityGraphicsPath .."chronocycler/"

--Reverse Chronocycler, temporarily using a copy of the recycler
--[[
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
]]

function chronocyclerTemplate(template)
	local fluidboxes =	{
		input = { -- North: pre .. "concentrated-void-essence" input
			volume = 200,
			pipe_connections = {
				{	
					flow_direction = "input-output",
					direction = defines.direction.east,
					position = {2,0}, -- center of 1 east, 2 north
				},
				{
					flow_direction = "input-output",
					direction = defines.direction.west,
					position = {-2,0}, -- center of 1 west, 2 north pre .. "distorted-void-essence"
				}
			},
			filter = pre .. "concentrated-void-essence",
			production_type = "input",
			pipe_covers = table.deepcopy(data.raw["assembling-machine"]["electromagnetic-plant"].fluid_boxes[1].pipe_covers),

		},
		output = { -- North: pre .. "concentrated-void-essence" input
			volume = 200,
			pipe_connections = {
				{	
					flow_direction = "input-output",
					direction = defines.direction.south,
					position = {0,2}, -- center of 1 east, 2 south
				},
				{
					flow_direction = "input-output",
					direction = defines.direction.north,
					position = {0,-2}, -- center of 1 west, 2 south 
				}
			},
			filter = pre .. "distorted-void-essence",
			production_type = "output",
			pipe_picture = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_pictures),
			pipe_covers = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"].fluid_boxes[1].pipe_covers),
		},
	}
	local animSpeedMod = template.crafting_speed and (1/template.crafting_speed) or 1
	return {
		name = template.name,
		type = "furnace",
		crafting_categories = template.crafting_categories,
		crafting_speed = template.crafting_speed,
		source_inventory_size = 1,
		result_inventory_size = recyclerReference.result_inventory_size,
		localised_description = template.localised_description,
		effect_receiver = template.effect_receiver,
		allowed_effects = template.allowed_effects,
		circuit_connector = circuit_connector_definitions.create_vector(
			universal_connector_template,
			{
				{ variation = 27, main_offset = util.by_pixel( 36, -16.625), shadow_offset = util.by_pixel( 36, -16.625), show_shadow = true }, 
				{ variation = 27, main_offset = util.by_pixel( 36, -16.625), shadow_offset = util.by_pixel( 36, -16.625), show_shadow = true }, 
				{ variation = 27, main_offset = util.by_pixel( 36, -16.625), shadow_offset = util.by_pixel( 36, -16.625), show_shadow = true }, 
				{ variation = 27, main_offset = util.by_pixel( 36, -16.625), shadow_offset = util.by_pixel( 36, -16.625), show_shadow = true }, 
			}
		),
		circuit_wire_max_distance = recyclerReference.circuit_wire_max_distance,
		minable = {
			mining_time = 0.2,
			result = template.name
		},
		cant_insert_at_source_message_key = "inventory-restriction.cant-be-recycled",
		close_sound = {
			filename = "__base__/sound/open-close/metal-large-close.ogg",
			volume = 0.7
		},
		collision_box = {{-2.4,-2.4},{2.4,2.4}},
		selection_box = {{-2.5,-2.5},{2.5,2.5}},
		dying_explosion = "recycler-explosion",
		energy_source = {
			type = "fluid",
			fluid_box = fluidboxes.input,
			output_fluid_box = fluidboxes.output,
			burns_fluid = true,
			scale_fluid_usage = true,
		},
		energy_usage = template.energy_usage,
		fast_replaceable_group = "chroncycler",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = chronoPath .. "chronocycler-shadow.png",
						priority = "high",
						width = 800,
						height = 500,
						frame_count = 1,
						line_length = 1,
						repeat_count = 80,
						animation_speed = 0.35 * animSpeedMod,
						draw_as_shadow = true,
						shift = util.by_pixel(0,-16),
						scale = 0.5
					},
					{
						priority = "high",
						filename = chronoPath .. "chronocycler-pipes.png",
						scale = 0.5,
						width = 380,
						height = 390,
						shift = util.by_pixel(11,-16),
						frame_count = 1,
						line_length = 1,
						repeat_count = 80,
						animation_speed = 0.35 * animSpeedMod
					},
					{
						priority = "high",
						width = 330,
						height = 390,
						frame_count = 80,
						lines_per_file = 8,
						animation_speed = 0.35 * animSpeedMod,
						scale = 0.5,
						shift = util.by_pixel(0,-16),
						stripes = {
							{
								filename = chronoPath .. "chronocycler-animation-1.png",
								width_in_frames = 8,
								height_in_frames = 8
							},
							{
								filename = chronoPath .. "chronocycler-animation-2.png",
								width_in_frames = 8,
								height_in_frames = 2
							}
						}
					}
				}
			},
			working_visualisations = {
				{
					fadeout = true,
					animation = {
						layers = {
							{
								priority = "high",
								width = 330,
								height = 390,
								frame_count = 80,
								lines_per_file = 8,
								animation_speed = 0.35 * animSpeedMod,
								scale = 0.5,
								shift = util.by_pixel(0,-16),
								stripes = {
									{
										filename = chronoPath .. "chronocycler-animation-1.png",
										width_in_frames = 8,
										height_in_frames = 8
									},
									{
										filename = chronoPath .. "chronocycler-animation-2.png",
										width_in_frames = 8,
										height_in_frames = 2
									}
								}
							},
							{
								priority = "high",
								draw_as_glow = true,
								blend_mode = "additive",
								width = 330,
								height = 390,
								frame_count = 80,
								lines_per_file = 8,
								animation_speed = 0.35 * animSpeedMod,
								scale = 0.5,
								shift = util.by_pixel(0,-16),
								stripes = {
									{
										filename = chronoPath .. "chronocycler-emission1-1-"..template.mode..".png",
										width_in_frames = 8,
										height_in_frames = 8
									},
									{
										filename = chronoPath .. "chronocycler-emission1-2-"..template.mode..".png",
										width_in_frames = 8,
										height_in_frames = 2
									}
								}
							},
							{
								priority = "high",
								draw_as_glow = true,
								blend_mode = "additive",
								width = 330,
								height = 390,
								frame_count = 80,
								lines_per_file = 8,
								animation_speed = 0.35 * animSpeedMod,
								scale = 0.5,
								shift = util.by_pixel(0,-16),
								stripes = {
									{
										filename = chronoPath .. "chronocycler-emission2-1-"..template.mode..".png",
										width_in_frames = 8,
										height_in_frames = 8
									},
									{
										filename = chronoPath .. "chronocycler-emission2-2-"..template.mode..".png",
										width_in_frames = 8,
										height_in_frames = 2
									}
								}
							}
						}
					}
				}
			},
			frozen_patch = {
				priority = "high",
				shift = util.by_pixel(0,-16),
				scale = 0.5,
				filename = chronoPath .. "chronocycler-frozen-1.png",
				width = 330,
				height = 390
			}
		},
		heating_energy = "100kW",
		icon = prismarisConstants.iconsPath .. "chronocycler-" .. template.mode .. "-icon.png",
		icon_size = 64,
		impact_category = "metal",
		max_health = 300,
		module_slots = template.module_slots or recyclerReference.module_slots,
		open_sound = {
			filename = "__base__/sound/open-close/metal-large-open.ogg",
			volume = 0.8
		},
		percieved_performance = {maximum = 4, minimum = 1},
		resistances = recyclerReference.resistances,
		--use_mirroring = true,
		--vector_to_place_result = {-0.35,-3.3},
		working_sound = recyclerReference.working_sound,
		allowed_effects = template.allowed_effects or recyclerReference.allowed_effects,
	}
end

local reversalChronocycler = chronocyclerTemplate{
	name = pre .. "reversal-chronocycler",
	crafting_categories = {"recycling",pre.."reverse-chronocycling"},
	crafting_speed = 0.25,
	effect_receiver = {
		base_effect = {
			productivity = 0.25,
			quality = 0.05
		}
	},
	localised_description = (settings.startup["test-reversal-mode"].value == "complex") and {"entity-description.prismaris-reversal-chronocycler-complex"} or {"entity-description.prismaris-reversal-chronocycler-simple"},
	mode = "rev",
	energy_usage = "1MW",
}

--Stasis Chronocycler, temporarily using a copy of the recycler
--[[
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
end]]

local stasisChronocycler = chronocyclerTemplate{
	name = pre .. "stasis-chronocycler",
	crafting_categories = {pre .. "stasis-chronocycling"},
	crafting_speed = 1,
	energy_usage = "4MW",
	allowed_effects = {"speed","consumption","pollution"},
	module_slots = 2,
	localised_description = (settings.startup["test-stasis-mode"].value == "refresh") and {"entity-description.prismaris-stasis-chronocycler-refresh"} or {"entity-description.prismaris-stasis-chronocycler-freeze"},
	mode = "stasis",
}

--Acceleration Chronocycler, temporarily using a copy of the recycler
--[[
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
}]]

local accelerationChronocycler = chronocyclerTemplate{
	name = pre .. "acceleration-chronocycler",
	crafting_categories = {pre.."acceleration-chronocycling"},
	crafting_speed = 1,
	energy_usage = "4MW",
	mode = "accel",
}



data:extend({
	reversalChronocycler,
	stasisChronocycler,
	accelerationChronocycler,
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
