utils.set_prerequisites("steel-processing", {})
utils.set_trigger("steel-processing",{type = "craft-item", item = "iron-plate", count = 50})
utils.add_recipes("steel-processing", {"medium-electric-pole","iron-stick"})
utils.remove_recipes("electric-energy-distribution-1",{"medium-electric-pole","iron-stick"})

utils.set_prerequisites("entropic-sea-filtering", {"steel-processing", "electronics"})
utils.add_recipes("entropic-sea-filtering", {"chemical-plant"})
utils.remove_recipes("oil-processing", {"chemical-plant"})

utils.add_prerequisites("void-essence-refining", {"oil-gathering"})
utils.add_recipes("void-essence-refining", {"oil-refinery"})
utils.remove_recipes("oil-processing", {"oil-refinery"})

utils.set_unit("oil-gathering",{count = 50, time = 15, ingredients = {{"automation-science-pack",1}} })
utils.set_prerequisites("oil-gathering", {"automation"})

utils.set_prerequisites("oil-processing", {"fluid-handling","chronopetrochemistry"})
utils.set_trigger("oil-processing",{type = "craft-fluid", fluid = "crude-oil", amount = 100})

utils.add_recipes("aethric-cultivation", {"agricultural-tower"})
utils.remove_recipes("agriculture", {"agricultural-tower"})

utils.set_unit("landfill", {count = 20, time = 15, ingredients = {{"automation-science-pack",1}} })
utils.set_prerequisites("landfill", {"automation-science-pack", "prismatic-synthesis"})

utils.remove_packs("flux-capacitor", {"agricultural-science-pack", "space-science-pack"})
utils.add_prerequisites("flux-capacitor", {"production-science-pack","battery"})

utils.remove_packs("thermal-flux", {"space-science-pack"})
utils.add_prerequisites("thermal-flux", {"utility-science-pack","heating-tower"})
utils.set_prerequisites("heating-tower", {"concrete"})
utils.set_packs("heating-tower", {"automation-science-pack","logistic-science-pack"},250,30)

utils.set_prerequisites("elevated-rail",{"concrete","railway"})
utils.remove_packs("elevated-rail", {"chemical-science-pack","production-science-pack"})

utils.add_prerequisites("planet-discovery-gleba",{"heating-tower"})

-- Since bellicos & aegis compatibility moves the stargate, we have to pick which planets to force a connection to first
local discovery_planet = (mods["bellicos-and-aegis"] or mods["stargate-merger"]) and "fulgora" or "gleba"
utils.add_space_locations("planet-discovery-" .. discovery_planet,{"prismaris-stargate",prismarisConstants.activeWarpGate})
for _,tech in pairs(data.raw["technology"]) do
	local name = tech.name
	if string.find(name, "planet-discovery",1,true) and not string.find(name,discovery_planet) and not string.find(name,"prismaris") then
		utils.add_prerequisites(name, {"planet-discovery-" .. discovery_planet})
	end
end

--- Post PolyScience Tech Tweaks

utils.add_prerequisites("chronocycler-core", {"space-science-pack"})
utils.remove_packs("blue-polyphasic-science-pack", {"space-science-pack"})
utils.remove_packs("red-polyphasic-science-pack", {"space-science-pack"})
utils.remove_packs("complete-polyphasic-science", {"space-science-pack"})
utils.remove_packs("prismatic-laser-turret", {"space-science-pack"})
utils.remove_packs("prismaris-bonus-worker-robots-speed-1", {"space-science-pack"})
utils.remove_packs("prismaris-bonus-worker-robots-speed-2", {"space-science-pack"})
utils.remove_packs("void-beacon", {"space-science-pack"})
utils.remove_packs("lunar-panels", {"space-science-pack"})
utils.add_prerequisites("prismaris-bonus-lab-productivity", {"agricultural-science-pack"})
utils.add_prerequisites("entropic-nurturing", {"agricultural-science-pack"})