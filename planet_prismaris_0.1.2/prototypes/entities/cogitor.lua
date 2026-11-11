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