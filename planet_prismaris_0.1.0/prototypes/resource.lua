--[[
local prismaticShardPatch = table.deepcopy(data.raw["resource"]["iron-ore"])
prismaticShardPatch.name = pre .. "prismatic-shard"
prismaticShardPatch.infinite = true
prismaticShardPatch.minimum = 60000
prismaticShardPatch.normal = 60000
prismaticShardPatch.infinite_depletion_amount = 0
prismaticShardPatch.minable.result = pre .. "prismatic-shard"
prismaticShardPatch.stages.sheet.filename = prismarisConstants.entityGraphicsPath .. "prismatic-shard/prismatic-shard.png"

local voidEssenceWell = table.deepcopy(data.raw["resource"]["sulfuric-acid-geyser"])
voidEssenceWell.name = pre .. "void-essence-well"
voidEssenceWell.minable.results = {
	{
		type = "fluid",
		name = pre .. "raw-void-essence",
		amount = 20
	}
}
voidEssenceWell.normal = 300000
voidEssenceWell.minimum = 300000
voidEssenceWell.order = "e"

]]

local resource_autoplace = require("resource-autoplace")
local base_tile_sounds = require("__base__.prototypes.tile.tile-sounds")

resource_autoplace.initialize_patch_set(pre.."prismatic-shard", false, "prismaris")
resource_autoplace.initialize_patch_set(pre.."void-essence-well", false, "prismaris")

local voidGraphics = prismarisConstants.entityGraphicsPath .. "void-essence-well/"
local prismaticGraphics = prismarisConstants.entityGraphicsPath .. "prismatic-shard/"

local function create_tiles()
	return {
		type = "direct",
		action_delivery =
		{
			type = "instant",
			source_effects =
			{
				{
					type = "create-entity",
					entity_name = "aquilo-tiles-inner-explosion",
					offsets = {{0.5, 0.5}}
				},
				{
					type = "create-entity",
					entity_name = "aquilo-tiles-outer-explosion",
					offsets = {{0.5, 0.5}}
				}
			}
		}
	}
end

data:extend{
	{
		type = "resource",
		name = pre .. "prismatic-shard",
		icon = "__space-age__/graphics/icons/lithium-brine.png", --Todo: Temporary
		flags = {"placeable-neutral"},
		category = "basic-solid",
		order = "c",
		highlight = true,
		normal = 120000,
		minimum = 60000,
		infinite = true,
		resource_patch_search_radius = 16,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		minable = {
			mining_time = 1,
			results = {
				{
					type = "item",
					name = pre .. "prismatic-shard",
					amount = 1
				}
			}
		},
		working_sound = table.deepcopy(data.raw["resource"]["lithium-brine"].working_sound),
		walking_sound = base_tile_sounds.walking.oil({}),
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
			order = "a[resources]-b[prismatic-shard]",
			probability_expression = "aquilo_crude_oil_probability",
			richness_expression = "prismaris_prismatic_shard_richness"
		},
		stage_counts = {0},
		stages = {
			layers = {
				util.sprite_load(prismaticGraphics .. "prismatic-shard",
				{
					priority = "extra-high",
					frame_count = 4,
					scale = 0.5
				})
			}
		},
		draw_stateless_visualisation_under_building = false,
		stateless_visualisation = {
			{
				count = 1,
				render_layer = "smoke",
				animation = util.sprite_load(prismaticGraphics .. "smoke-1", {
					priority = "extra-high",
					frame_count = 64,
					animation_speed = 0.35,
					tint = util.multiply_color({r=1, g=1, b=1}, 1),
					scale = 0.5,
					--shift = util.by_pixel( 0.5, -54.0)
				})
			},
			{
				count = 1,
				render_layer = "smoke",
				animation = util.sprite_load(prismaticGraphics .. "smoke-2", {
					priority = "extra-high",
					frame_count = 64,
					animation_speed = 0.35,
					tint = util.multiply_color({r=1, g=1, b=1}, 0.5),
					scale = 0.5,
					--shift = util.by_pixel( 0.5, -54.0)
				})
			},
			{
				count = 1,
				render_layer = "smoke",
				animation = {
					filename = prismaticGraphics .. "prismatic-vent-gas-outer.png",
					frame_count = 47,
					line_length = 16,
					width = 90,
					height = 188,
					animation_speed = 0.5,
					shift = util.by_pixel(-2, -40),
					scale = 0.5,
					tint = util.multiply_color({r=1, g=1, b=1}, 0.1),
				}
			},
			{
				count = 1,
				render_layer = "smoke",
				animation = {
					filename = prismaticGraphics .. "prismatic-vent-gas-inner.png",
					frame_count = 47,
					line_length = 16,
					width = 40,
					height = 84,
					animation_speed = 0.5,
					shift = util.by_pixel(0, -14),
					scale = 0.5,
					tint = util.multiply_color({r=1, g=1, b=1}, 0.1),
				}
			}
		},
		map_color = {100, 230, 105},
		map_grid = false,
		created_effect = create_tiles("snow-lumpy")
	},
	{
		type = "resource",
		name = pre .. "void-essence-well",
		icon = "__space-age__/graphics/icons/fluorine-vent.png",
		flags = {"placeable-neutral"},
		category = "basic-fluid",
		subgroup = "mineable-fluids",
		order="d",
		infinite = true,
		highlight = true,
		minimum = 300000,
		normal = 300000,
		--infinite_depletion_amount = 10,
		resource_patch_search_radius = 16,
		tree_removal_probability = 0.7,
		tree_removal_max_distance = 32 * 32,
		minable =
		{
			mining_time = 1,
			results =
			{
				{
					type = "fluid",
					name = pre .. "raw-void-essence",
					amount = 5
				}
			}
		},
		working_sound =
		{
			sound =
			{
				category = "world-ambient",
				filename = "__space-age__/sound/world/resources/fluorine-vent-1.ogg",
				volume = 0.2,
				advanced_volume_control =
				{
					fades = {fade_in = {curve_type = "S-curve", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
				}
			},
			max_sounds_per_prototype = 2,
		},
		walking_sound = base_tile_sounds.walking.oil({}),
		collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		autoplace = {
			--control = "fluorine-vent",
			order="a[resources]-a[void-essence]",
			--default_enabled = false,
			probability_expression = "aquilo_lithium_brine_probability",
			richness_expression = "prismaris_void_essence_richness"
		},
		stage_counts = {0},
		stages =
		{
			layers =
			{
				util.sprite_load(voidGraphics .. "void-essence-well",
				{
					priority = "extra-high",
					frame_count = 4,
					scale = 0.5
				})
			}
		},
		draw_stateless_visualisation_under_building = false,
		stateless_visualisation =
		{
			{
				count = 1,
				render_layer = "smoke",
				animation = util.sprite_load(voidGraphics .. "smoke-1",
				{
					priority = "extra-high",
					frame_count = 64,
					animation_speed = 0.35,
					--tint = {r=0.25, g=0.5, b=0.5,a= 1},
					scale = 0.75,
					shift = {0,-0.23}
				})
			},
			{
				count = 1,
				render_layer = "smoke",
				animation = util.sprite_load(voidGraphics .. "smoke-2",
				{
					priority = "extra-high",
					frame_count = 64,
					animation_speed = 0.35,
					tint = {r=1, g=1, b=1,a= 0.35},
					scale = 0.75,
					shift = {0,-0.23}
				})
			},
			{
				count = 1,
				render_layer = "smoke",
				animation = {
					filename = voidGraphics .. "void-essence-well-gas-outer.png",
					frame_count = 47,
					line_length = 16,
					width = 90,
					height = 188,
					animation_speed = 0.5,
					shift = util.by_pixel(-2, 24 -152),
					scale = 1.5,
					tint = util.multiply_color({r=1, g=1, b=1}, 0.1)
				}
			},
			{
				count = 1,
				render_layer = "smoke",
				animation = {
					filename = voidGraphics .. "void-essence-well-gas-inner.png",
					frame_count = 47,
					line_length = 16,
					width = 40,
					height = 84,
					animation_speed = 0.5,
					shift = util.by_pixel(0, 24 -78),
					scale = 1.5,
					tint = util.multiply_color({r=1, g=1, b=1}, 0.1)
				}
			}
		},
		map_color = color.rawVoid[1],
		map_grid = false,
		created_effect = create_tiles("snow-patchy")
	}
}
