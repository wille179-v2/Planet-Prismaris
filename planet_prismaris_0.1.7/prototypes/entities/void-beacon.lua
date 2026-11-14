local useNerfedBeaconProfile = true -- May be a setting later. If true, generates a beacon transmission profile that degrades faster and caps out at 4 beacons.
local beaconLimit = 4 -- Lowered from 6 because I realized regular and void beacons stacked.

local voidBeacon = table.deepcopy(data.raw["beacon"]["beacon"])
voidBeacon.name = pre .. "void-beacon"
voidBeacon.energy_usage = "1.44MW"
voidBeacon.allowed_effects = {"consumption","speed","pollution","productivity","quality"}
voidBeacon.supply_area_distance = 6
voidBeacon.distribution_effectivity = 2
voidBeacon.distribution_effectivity_bonus_per_quality_level = 0.3
-- TODO: When Nonstandard Beacons mod gets updated to 2.1, convert to fluid burning beacon
voidBeacon.minable.result = pre .. "void-beacon"
voidBeacon.graphics_set.animation_list[1].animation.layers[1].filename = prismarisConstants.entityGraphicsPath .. "void-beacon/void-beacon-bottom.png"
voidBeacon.graphics_set.animation_list[2].animation.filename = prismarisConstants.entityGraphicsPath .. "void-beacon/void-beacon-top.png"
--voidBeacon.beacon_counter = "total" -- Makes it so all other types of beacons interfere with it.

if useNerfedBeaconProfile then
	local nerfedProfile = {}
	nerfedProfile[1] = 1
	local limitCap = 1/(math.sqrt(beaconLimit)+(math.sqrt(beaconLimit)/10))
	for i=2,99 do
		if i <= beaconLimit then
			nerfedProfile[i] = 1/(math.sqrt(i)+(math.sqrt(i)/10))
		else
			nerfedProfile[i] = limitCap * beaconLimit / i
		end
	end
	voidBeacon.profile = nerfedProfile
end

voidBeacon.localised_description = {"entity-description.prismaris-void-beacon",tostring(beaconLimit)}

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