local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_fulgora = require("__space-age__.prototypes.planet.procession-catalogue-fulgora")
local mapGen = require("prototypes.space.map-gen")

local iconsPath = prismarisConstants.iconsPath
local spaceGraphics = prismarisConstants.graphicsPath .. "/space/"

local botPriority = 100

if settings.startup["prismaris-lightning-targets-robots"].value == true then
	botPriority = 1000
end

local lightningExemption = table.deepcopy(data.raw["planet"]["fulgora"].lightning_properties.exemption_rules)
lightningExemption = table.insert(lightningExemption,{type = "prototype", string = pre .. "cultivated-aether-crystal"})

local prismaris = {
	name = "prismaris",
	type = "planet",
	order = "d[prismaris]",
	icon = iconsPath .. "space/prismaris_icon_temp.png",
	starmap_icon = iconsPath .. "space/prismaris_starmap_icon_temp.png",
	starmap_icon_size = 512,
	subgroup = "planets",
	pollutant_type = nil,
	--persistent_ambient_sounds
	surface_render_parameters = {
		fog = effects.default_fog_effect_properties(),
		day_night_cycle_color_lookup =
		{
			{0.0, "__space-age__/graphics/lut/fulgora-1-noon.png"},
			{0.2, "__space-age__/graphics/lut/fulgora-1-noon.png"},
			{0.3, "__space-age__/graphics/lut/fulgora-2-afternoon.png"},
			{0.4, "__space-age__/graphics/lut/fulgora-3-after-sunset.png"},
			{0.6, "__space-age__/graphics/lut/fulgora-4-before-dawn.png"},
			{0.7, "__space-age__/graphics/lut/fulgora-5-morning.png"},
		},
		terrain_tint_effect = {
			noise_texture = {
				filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
				color_channels = 3,
				size = 4096
			},
			offset = { 0.2, 0, 0.4, 0.8 },
			intensity = { 0.4, 0.4, 0.4, 0.7 },
			scale_u = { 1.1, 1.85, 1.85, 0.5 },
			scale_v = { 0.45, 1, 1, 0.7 },
			global_intensity = 0.3,
			global_scale = 0.25,
			zoom_factor = 3.8,
			zoom_intensity = 0.75
		}
	},
	platform_surface_render_parameters = {
		platform_backdrop = {
			radius = 730,
			planet_surface = {
				filename = spaceGraphics .. "prismaris.png",
				width = 2048,
				height = 1024,
			},
			planet_emission = {
				filename = spaceGraphics .. "prismaris-emission.png",
				width = 2048,
				height = 1024,
			},
			emission_scales_with_shadow = false, -- may change if the glow doesn't look good
			global_cloud = {
				filename = spaceGraphics .. "prismaris-cloud.png",
				width = 2048,
				height = 1024,
			},
			global_cloud_normal = {
				filename = spaceGraphics .. "prismaris-cloud-normal.png",
				width = 2048,
				height = 1024,
			},
			global_cloud_flow = {
				filename = spaceGraphics .. "prismaris-cloud-flow.png",
				width = 2048,
				height = 1024,
			},
			--hero_clouds = table.deepcopy(data.raw.planet["fulgora"].platform_backdrop.hero_clouds),
			--hero_cloud_texture_1 = table.deepcopy(data.raw.planet["fulgora"].platform_backdrop.hero_cloud_texture_1),
			rotation_seconds = 780,
			planet_axis = {1,21},
			planet_axis_deviation_amplitude = {18,18},
			planet_axis_deviation_seconds = {612, 587},
			parallax_strength = {.95,.95},
			hero_clouds_are_emissive = true,
			atmosphere_color = {0.095, 0.15, 0.19, 0.1},
			specular_color ={1.0, 1.0, 1.0, 1.0},
			light_color = {0.9804, 1.0, 1.0, 1.0},
			light_direction = {-1.0, 0.0, 0.5},
			cloud_flow_intensity = 1.1,
			cloud_panning_rate = 0.075,
		}
	},
	 platform_procession_set =
    {
      arrival = {"planet-to-platform-b", "platform-to-platform-b"},
      departure = {"platform-to-planet-a", "platform-to-platform-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
	procession_graphic_catalogue = planet_catalogue_fulgora,
	--player_effects
	--ticks_between_player_effects
	map_gen_settings = mapGen.prismaris(),
	surface_properties = {
		["day-night-cycle"] = 27 * minute,
		["magnetic-field"] = 93,
		["solar-power"] = 75,
		["robot-energy-usage"] = 2,
		pressure = 1100,
		gravity = 14,
	},
	lightning_properties = {
		lightnings_per_chunk_per_tick = 1 / (60 * 14), -- one per chunk every 14 seconds, about 71.4% of fulgora's peak
		search_radius = 10.0,
		lightning_types = {"lightning"}, -- default for now
		lightning_multiplier_at_day = 1,
		lightning_multiplier_at_night = .50, -- Half-strength lightning at night
		priority_rules = 
		{
			{
				type = "id", -- "id" means a SPECIFIC item to hit
				string = "lightining-collector",
				priority_bonus = 10000
			},
			{
				type = "prototype", -- "prototype" means every entity with the same prototype
				string = "lightining-attractor",
				priority_bonus = 1000
			},
			-- TODO: More specific naturally occuring items to attract lightning
			{
				type = "prototype",
				string = "pipe",
				priority_bonus = 1,
			},
			{
				type = "prototype",
				string = "pump",
				priority_bonus = 1,
			},
			{
				type = "prototype",
				string = "offshore-pump",
				priority_bonus = 1,
			},
			{
				type = "prototype",
				string = "power-switch",
				priority_bonus = 10,
			},
			{
				type = "prototype",
				string = "electric-pole",
				priority_bonus = 10,
			},
			{
				type = "prototype", -- Zap da robots
				string = "logistic-robot",
				priority_bonus = botPriority * 1.1,
			},
			{
				type = "prototype",
				string = "construction-robot",
				priority_bonus = botPriority * 0.9,
			},
			{
				type = "impact-soundset",
				string = "metal",
				priority_bonus = 1,
			},
		},
		exemption_rules = lightningExemption,
	},
	gravity_pull = 10,
	orbit = {
		parent = {
			name = "star",
			type = "space-location"
		},
		distance = 15,
		orientation = .9,
	},
	is_satellite = false,
	magnitude = 1.3,
	--parked_platforms_orientation
	label_orientation = .75,
	draw_orbit = false, -- set to false because it shares Nauvis's orbit
	solar_power_in_space = 300,
	asteroid_spawn_influence = table.deepcopy(data.raw["planet"]["gleba"].asteroid_spawn_influence)
	
}

PlanetsLib:extend({prismaris})

data:extend({
	{
		type = "space-connection",
		name = "gleba-prismaris",
		from = "gleba",
		to = "prismaris",
		icon = iconsPath .. "recipe-temp.png", -- TODO: placeholder
		icon_size = 64,
		asteroid_spawn_definitions = table.deepcopy(data.raw["space-connection"]["nauvis-gleba"].asteroid_spawn_definitions),
		length = 20000,
		subgroup = "planet-connections",
		order = "e-a"
	},
	{
		type = "space-connection",
		name = "vulcanus-prismaris",
		from = "vulcanus",
		to = "prismaris",
		icon = iconsPath .. "recipe-temp.png", -- TODO: placeholder
		icon_size = 64,
		asteroid_spawn_definitions = table.deepcopy(data.raw["space-connection"]["nauvis-vulcanus"].asteroid_spawn_definitions),
		length = 15000,
		subgroup = "planet-connections",
		order = "e-b"
	},
})

