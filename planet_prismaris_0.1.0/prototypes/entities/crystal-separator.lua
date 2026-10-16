local graphicsPath = prismarisConstants.entityGraphicsPath .. "crystal-separator/"
local iconPath = prismarisConstants.iconsPath
require ("circuit-connector-sprites")
require ("__space-age__.prototypes.entity.circuit-network")


circuit_connector_definitions[pre .. "crystal-separator"] = circuit_connector_definitions.create_vector(
	universal_connector_template,
	{
		{variation = 25, main_offset = util.by_pixel(-36,44), shadow_offset=util.by_pixel(0,0), show_shadow = false},
		{variation = 25, main_offset = util.by_pixel(-36,44), shadow_offset=util.by_pixel(0,0), show_shadow = false},
		{variation = 25, main_offset = util.by_pixel(-36,44), shadow_offset=util.by_pixel(0,0), show_shadow = false},
		{variation = 25, main_offset = util.by_pixel(-36,44), shadow_offset=util.by_pixel(0,0), show_shadow = false}
	}
)

local crystalSeparator = {
	name = pre.."crystal-separator",
	type = "furnace",
	icon = iconPath .. "crystal-separator.png",
	icon_size = 64,
	flags = {"placeable-neutral", "placeable-player", "player-creation"},
	source_inventory_size = 1,
	result_inventory_size = prismarisConstants.separatorInventorySize,
	crafting_categories = {pre .. "crystal-separation"},
	energy_usage = "180kW",
	energy_source = {
		type = "electric",
		usage_priority = "secondary-input",
		emissions_per_minute = {["pollution"] = 1}
	},
	crafting_speed = 2,
	module_slots = 3,
	allowed_effects = {"speed","productivity","consumption","pollution","quality"},
	surface_conditions = keys.prismarisOnly.surface_conditions,
	cant_insert_at_source_message_key = "inventory-restriction.cant-be-separated",
	circuit_connector = circuit_connector_definitions[pre .. "crystal-separator"],
	circuit_wire_max_distance = 9,
	working_sound = { -- Copied from electric furnace
		fade_in_ticks = 4,
		fade_out_ticks = 20,
		max_sounds_per_prototype = 4,
		sound = {
			advanced_volume_control = {
				attenuation = "exponential"
			},
			audible_distance_modifier = 0.7,
			filename = "__base__/sound/electric-furnace.ogg",
			modifiers = {
				type = "main-menu",
				volume_multiplier = 4.2
			},
			volume = 0.85
		}
	},
	--build_sound
	--mined_sound
	--mining_sound
	open_sound = {
		filename = "__base__/sound/open-close/electric-large-open.ogg",
		volume = 0.6
	},
	closed_sound = {
		filename = "__base__/sound/open-close/electric-large-close.ogg",
		volume = 0.6
	},
	impact_category = "glass",
	placeable_by = {item = pre.."crystal-separator", count = 1},
	tile_width = 4,
	tile_height = 4,
	--map_color
	--friendly_map_color
	--enemy_map_color
	--order
	minable = {
		mining_time = 1,
		result = pre.."crystal-separator",
		count = 1
	},
	collision_box = {{-1.9,-1.9},{1.9,1.9}},
	selection_box = {{-2,-2},{2,2}},
	max_health = 350,
	resistances = {
		{
			type = "fire",
			percent = 75
		}
	},
	--damaged_trigger_effect
	--dying_explosion
	graphics_set = {
		animation = { -- idle animation
			layers = {
				{
					filename = graphicsPath .."crystal-separator-animation.png",
					scale = 0.5,
					line_length = 10,
					lines_per_file = 10,
					frame_count = 1,
					draw_as_glow = false,
					blend_mode = "normal",
					width = 200,
					height = 290,
					priority = "high",
					--shift
				},
				{
					filename = graphicsPath .."crystal-separator-color1.png",
					scale = 0.5,
					line_length = 10,
					lines_per_file = 10,
					frame_count = 1,
					draw_as_glow = false,
					blend_mode = "normal",
					width = 200,
					height = 290,
					apply_runtime_tint = true
				},
				{
					filename = graphicsPath .. "crystal-separator-hr-shadow.png",
					scale = 0.5,
					draw_as_shadow = true,
					height = 400,
					width = 600,
					priority = "high",
					--shift
				}
			}
		},
		working_visualisations = { --working animation
			{
				animation = { -- Base layer
					filename = graphicsPath .."crystal-separator-animation.png",
					scale = 0.5,
					line_length = 10,
					lines_per_file = 10,
					frame_count = 60,
					draw_as_glow = false,
					blend_mode = "normal",
					width = 200,
					height = 290,
				},
				constant_speed = true,
			},
			{
				animation = { -- Dynamic user colors on frame
					filename = graphicsPath .."crystal-separator-color1.png",
					scale = 0.5,
					line_length = 10,
					lines_per_file = 10,
					frame_count = 60,
					draw_as_glow = false,
					blend_mode = "normal",
					width = 200,
					height = 290,
					--apply_runtime_tint = true
				},
				constant_speed = true,
			},
			{
				--apply_recipe_tint = "primary",
				animation = {
					filename = graphicsPath .."crystal-separator-color2.png",
					scale = 0.5,
					line_length = 10,
					lines_per_file = 10,
					frame_count = 60,
					draw_as_glow = false,
					blend_mode = "normal",
					width = 200,
					height = 290,
				},
				constant_speed = true,
			},
			{ -- Crystal glow
				-- apply_recipe_tint = "primary",
				animation = {
					filename = graphicsPath .."crystal-separator-emission.png",
					scale = 0.5,
					line_length = 10,
					lines_per_file = 10,
					frame_count = 60,
					draw_as_glow = true,
					blend_mode = "additive",
					width = 200,
					height = 290,
				},
				constant_speed = true,
			}
		}
	},
}


local crystalSeparationCategory = {
	type = "recipe-category",
	name = pre .. "crystal-separation"
}

data:extend{crystalSeparator,crystalSeparationCategory}