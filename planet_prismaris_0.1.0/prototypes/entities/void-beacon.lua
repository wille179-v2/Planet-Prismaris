local voidBeacon = table.deepcopy(data.raw["beacon"]["beacon"])
voidBeacon.name = pre .. "void-beacon"
voidBeacon.energy_usage = "720kW"
voidBeacon.allowed_effects = {"consumption","speed","pollution","productivity","quality"}
voidBeacon.supply_area_distance = 5
voidBeacon.distribution_effectivity = 2
voidBeacon.distribution_effectivity_bonus_per_quality_level = 0.25
-- TODO: When Nonstandard Beacons mod gets updated to 2.1, convert to fluid burning beacon
voidBeacon.minable.result = pre .. "void-beacon"
voidBeacon.graphics_set.animation_list[1].animation.layers[1].filename = prismarisConstants.entityGraphicsPath .. "void-beacon/void-beacon-bottom.png"
voidBeacon.graphics_set.animation_list[2].animation.filename = prismarisConstants.entityGraphicsPath .. "void-beacon/void-beacon-top.png"

data:extend{voidBeacon}


----- Updates to visuals of productivity and quality modules to affect void beacon -----

local modules = {
	prod = {
		data.raw['module']['productivity-module'],
		data.raw['module']['productivity-module-2'],
		data.raw['module']['productivity-module-3'],
	},
	quality = {
		data.raw['module']['quality-module'],
		data.raw['module']['quality-module-2'],
		data.raw['module']['quality-module-3'],
	}
}

for i,module in ipairs(modules.prod) do
	module.art_style = "vanilla"
	module.beacon_tint = {
		primary = {1,0,0},
		secondary = {0.9,0.9,0.37,1}
	}
end

for i,module in ipairs(modules.quality) do 
	module.art_style = "vanilla"
	module.beacon_tint = {
		primary = {0.8,0.8,0.8},
		secondary = {1,0.4,0.4,1}
	}
end