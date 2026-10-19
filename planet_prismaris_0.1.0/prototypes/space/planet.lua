local effects = require("__core__.lualib.surface-render-parameter-effects")
local planet_catalogue_fulgora = require("__space-age__.prototypes.planet.procession-catalogue-fulgora")
local mapGen = require("prototypes.space.map-gen")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

local iconsPath = prismarisConstants.iconsPath
local spaceGraphics = prismarisConstants.graphicsPath .. "space/"
local spaceIcons = iconsPath .. "space/"


-- Bot logic for lightning
local botPriority = 100
if settings.startup["prismaris-lightning-mercy"].value == false then
	botPriority = 1000
end
local lightningExemption = table.deepcopy(data.raw["planet"]["fulgora"].lightning_properties.exemption_rules)
table.insert(lightningExemption,{type = "prototype", string = pre .. "cultivated-aether-crystal"})
table.insert(lightningExemption,{type = "prototype", string = pre .. "crystal-huge"})
table.insert(lightningExemption,{type = "prototype", string = pre .. "crystal-big"})
table.insert(lightningExemption,{type = "prototype", string = pre .. "aether-crystal-natural"})

-- Solar for connections
local spaceSolar = 150
-- if this setting exists, a B&A or SYSG mods are installed and we're using a shared stargate.
if settings.startup["stargate-solar-power"] then
	spaceSolar = settings.startup["stargate-solar-power"].value == "very-low-power" and 1 or (settings.startup["stargate-solar-power"].value) == "low-power" and 10 or spaceSolar
end

-- Asteroids
local interStargateAsteroids = {
	{
		type = "asteroid-chunk",
		asteroid = "oxide-asteroid-chunk",
		spawn_points = {
			{probability = 0.03, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.1},	   -- Start
			{probability = 0.05, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.5},		   -- Peak
			{probability = 0.03, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.9}		-- End
		}
	},
	{
		type = "asteroid-chunk",
		asteroid = "carbonic-asteroid-chunk",
		spawn_points = {
			{probability = 0.02, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.1},	   -- Start
			{probability = 0.03, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.5},		   -- Peak
			{probability = 0.02, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.9}		-- End
		}
	},
	{
		type = "asteroid-chunk",
		asteroid = "metallic-asteroid-chunk",
		spawn_points = {
			{probability = 0.02, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.1},	   -- Start
			{probability = 0.04, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.5},		   -- Peak
			{probability = 0.02, angle_when_stopped = 1, speed = asteroid_util.standard_speed*10, distance = 0.9}		-- End
		}
	}
}
local stargateAsteroids = {
  {
	asteroid = "small-metallic-asteroid",  
	probability = 0.0001,
	angle_when_stopped = 1,
	speed = asteroid_util.standard_speed*0.2,
  },
  {
	asteroid = "small-oxide-asteroid",  
	probability = 0.0001,
	angle_when_stopped = 1,
	speed = asteroid_util.standard_speed*0.2,
  },
  {
	asteroid = "small-carbonic-asteroid",  
	probability = 0.0001,
	angle_when_stopped = 1,
	speed = asteroid_util.standard_speed*0.2,
  }
}

--makes the icons for space connections
function connectionIcon(topIcon, bottomIcon)
	return {
		{
			icon = "__space-age__/graphics/icons/planet-route.png"
		},
		{
			icon = topIcon,
			icon_size = 64,
			scale = 0.333,
			shift = {-6,-6}
		},
		{
			icon = bottomIcon,
			icon_size = 64,
			scale = 0.333,
			shift = {6,6}
		}
	}
end
------------------------------
-- Planet & Space Locations --
------------------------------


-- Prismaris itself
local prismaris = {
	name = "prismaris",
	type = "planet",
	order = "d[prismaris]",
	icon = iconsPath .. "space/prismaris-icon.png",
	starmap_icon = iconsPath .. "space/prismaris-starmap-icon.png",
	starmap_icon_size = 512,
	subgroup = "planets",
	pollutant_type = nil,
	persistent_ambient_sounds = table.deepcopy(data.raw["planet"]["aquilo"].persistent_ambient_sounds),
		surface_render_parameters = {
		fog = effects.default_fog_effect_properties(),
		--[[
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
		]]
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
	procession_graphic_catalogue = planet_catalogue_aquilo,
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
			name = "prismaris-star",
			type = "space-location"
		},
		distance = 15,
		orientation = .45,
	},
	is_satellite = false,
	magnitude = 1.35,
	--parked_platforms_orientation
	label_orientation = .25,
	draw_orbit = true,
	solar_power_in_space = 300,
	asteroid_spawn_influence = table.deepcopy(data.raw["planet"]["gleba"].asteroid_spawn_influence)	
}




-- The version of the gate that loads if no other shared gateway mod is enabled
local calidusGatePrismaris = {
	type = "space-location",
	name = prismarisConstants.defaultWarpGate,
	hidden = prismarisConstants.useModedGate, -- Hide this if using a compatible mod.
	starmap_icon = spaceIcons .. "starmap-stargate-calidus-512.png",
	starmap_icon_size = 512,
	icon = spaceIcons .. "starmap-stargate-calidus-64.png",
	icon_size = 64,
	subgroup = "planets",
	order = "a",
	gravity_pull = -10,
	orbit = {
		parent = {
			name = "gleba",
			type = "planet"
		},
		orientation = 0.85,
		distance = 4,
	},
	draw_orbit = false,
	is_satellite = true,
	asteroid_spawn_influence = 0,
	label_orientation = 0.1,
	solar_power_in_space = spaceSolar,
	asteroid_spawn_definitions = stargateAsteroids,
	redrawn_connections_exclude = true,
}

-- Always active gate
local prismarisGate = {
	type = "space-location",
	name = "prismaris-stargate",
	starmap_icon = spaceIcons .. "calidus-prismaris-stargate-starmap.png",
	starmap_icon_size = 512,
	icon = spaceIcons .. "calidus-prismaris-stargate-icon.png",
	subgroup = "planets",
	order = "a",
	gravity_pull = -10,
	orbit = {
		parent = {
			name = "prismaris-star",
			type = "space-location"
		},
		orientation = 0.23,
		distance = 15
	},
	asteroid_spawn_influence = 0,
	solar_power_in_space = spaceSolar,
	asteroid_spawn_definitions = stargateAsteroids,
	draw_orbit = false,
	label_orientation = .9,
}

-- The star that prismaris orbits
local prismarisStar = {
	type = "space-location",
	name = "prismaris-star",
	starmap_icon = spaceIcons .. "prismaris-star-starmap.png",
	starmap_icon_size = 1024,
	orbit = {
		parent = {
			name = "star",
			type = "space-location"
		},
		orientation = .75,
		distance = 100,
	},
	draw_orbit = false,
	sprite_only = true,
	magnitude = 9.3,
	hidden_in_factoriopedia = true,
	--asteroid_spawn_influence = 0,
	--asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora)
}

PlanetsLib:extend({prismaris, calidusGatePrismaris, prismarisGate, prismarisStar})


local stargateConnection = {
	type = "space-connection",
	name = "cross-stargate-connection",
	subgroup = "planet-connections",
	icons = connectionIcon(
		spaceIcons .. "calidus-prismaris-stargate-icon.png", 
		spaceIcons .. "starmap-stargate-calidus-64.png"
	),
	from = prismarisConstants.activeWarpGate,
	to = "prismaris-stargate",
	order = "b",
	length = 3000,
	shape = "line",
	asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_fulgora),
	localised_name = {
		"",
		"Wormhole from ",
		"space-location-name." .. prismarisConstants.activeWarpGate,
		" to ",
		"space-location-name.prismaris-stargate"
	}
}

local stargateToPrismarisConnection = {
	type = "space-connection",
	name = "stargate-prismaris",
	from = "prismaris-stargate",
	to = "prismaris",
	subgroup = "planet-connections",
	icons = connectionIcon(
		spaceIcons .. "calidus-prismaris-stargate-icon.png",
		spaceIcons .. "prismaris-icon.png"
	),
	order = "b",
	length = 17000,
	asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_gleba)
}

local glebaToStargateConnection = {
	type = "space-connection",
	name = "gleba-stargate",
	from = "gleba",
	to = prismarisConstants.defaultWarpGate,
	icons = connectionIcon(
		"__space-age__/graphics/icons/gleba.png",
		spaceIcons .. "starmap-stargate-calidus-64.png"
	),
	subgroup = "planet-connections",
	order = "b",
	length = 6000,
	hidden = prismarisConstants.useModedGate, -- Hide this if using a compatible mod.
		-- Doesn't work because factorio itself is bugged for hiding connections.

	-- If I ever want to do custom asteroids, here's where I'd update their spawn definitions
	asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_fulgora)
}

-- stargate to prismaris
-- active stargate to gleba IF the mod connection is not availible


data:extend{stargateConnection,stargateToPrismarisConnection}
if not prismarisConstants.useModedGate then
	data:extend{glebaToStargateConnection} --This is terrible. Fix this when/if the bugfix comes.
end


-- Old space connections
--[[
data:extend({
	{
		type = "space-connection",
		name = "gleba-prismaris",
		from = "gleba",
		to = "prismaris",
		icons = {
			{
				icon = "__space-age__/graphics/icons/planet-route.png"
			},
			{
				icon = "__space-age__/graphics/icons/gleba.png",
				icon_size = 64,
				scale = 0.333,
				shift = {-6,-6}
			},
			{
				icon = iconsPath .. "space/prismaris-icon.png",
				icon_size = 64,
				scale = 0.333,
				shift = {6,6}
			}
		},
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
		icons = {
			{
				icon = "__space-age__/graphics/icons/planet-route.png"
			},
			{
				icon = "__space-age__/graphics/icons/vulcanus.png",
				icon_size = 64,
				scale = 0.333,
				shift = {-6,-6}
			},
			{
				icon = iconsPath .. "space/prismaris-icon.png",
				icon_size = 64,
				scale = 0.333,
				shift = {6,6}
			}
		},
		asteroid_spawn_definitions = table.deepcopy(data.raw["space-connection"]["nauvis-vulcanus"].asteroid_spawn_definitions),
		length = 15000,
		subgroup = "planet-connections",
		order = "e-b"
	},
})
]]

