local techPlaceholder = prismarisConstants.technologyIconsPath .. "technology_placeholder.png"

-- pf.technologyFactory(name, icons, essential, unlockCondition, prerequisites, effects)
	-- pf.unlockUnitHelper(count,packs,seconds)
	-- pf.unlockTriggerHelper(type, triggerItemID, count)

data:extend({
	pf.technologyFactory( -- planet-discovery-prismaris
		"planet-discovery-prismaris",
		techPlaceholder,
		true,
		pf.unlockUnitHelper(
			1500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				"agricultural-science-pack"
			},
			60
		),
		{
			"agricultural-science-pack",
			"production-science-pack"
		},
		{
			{
				type = "unlock-space-location",
				space_location = "prismaris"
			},
		}
	),
	pf.technologyFactory( -- prismatic-separation
		"prismatic-separation",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"mine-entity",
			{pre .. "prismatic-shard"}
		),
		{
			"planet-discovery-prismaris"
		},
		{
			"lightning-rod",
			pre .. "prismatic-shard-separation",
			pre .. "crystal-separator",
		}
	),
	pf.technologyFactory( -- prismatic-synthesis
		"prismatic-synthesis",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"craft-item",
			pre .. "activated-prismatic-shard-r",
			10
		),
		{
			"prismatic-separation"
		},
		{
			pre .."shard-illumination",
			pre .."shard-obscuring",
			pre .. "ferric-shard",
			pre .. "cupric-shard",
			pre .. "lithic-shard",
			pre .. "ferric-shard-cracking",
			pre .. "cupric-shard-cracking",
			pre .. "lithic-shard-cracking"
		}
	),
	pf.technologyFactory( -- aethric-cultivation
		"aethric-cultivation",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"mine-entity",
			{pre .. "cultivated-aether-crystal"}
		),
		{
			"planet-discovery-prismaris",
			"prismatic-separation"
		},
		{
			pre .. "aethric-shard-separation"
		}
	),
	pf.technologyFactory( -- aethric-destabilization
		"aethric-destabilization",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"craft-item",
			pre .. "shattered-aethric-shard-f",
			10
		),
		{
			"aethric-cultivation"
		},
		{
			-- Cutting out aethric soil since it's now a part of Prismaris's natural terrain generation.
			-- pre .. "aethric-soil",
			pre .. "destabilized-aethric-shard-a",
			pre .. "destabilized-aethric-shard-b",
			pre .. "destabilized-aethric-shard-c",
			pre .. "destabilized-aethric-shard-d",
			pre .. "destabilized-aethric-shard-e",
			pre .. "destabilized-aethric-shard-f",
		}
	),
	pf.technologyFactory( -- entropic-sea-filtering
		"entropic-sea-filtering",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"craft-fluid",
			pre .. "liquid-entropy",
			1
		),
		{
			"planet-discovery-prismaris"
		},
		{
			pre .. "entropic-filtering",
			pre .. "entropic-refinement"
		}
	),
	pf.technologyFactory( -- void-essence-refining
		"void-essence-refining",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"craft-fluid",
			pre .. "raw-void-essence",
			1
		),
		{
			"planet-discovery-prismaris",
			"entropic-sea-filtering"
		},
		{
			pre .. "void-essence-refinement"
		}
	),
	pf.technologyFactory( -- void-essence-stabilization
		"void-essence-stabilization",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"craft-fluid",
			pre .. "concentrated-void-essence",
			10
		),
		{
			"void-essence-refining"
		},
		{
			pre .. "void-essence-stabilization",
			pre .. "void-essence-concentration"
		}
	),
	pf.technologyFactory( -- flux-capacitor
		"flux-capacitor",
		techPlaceholder,
		true,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				"agricultural-science-pack"
			},
			30
		),
		{
			"void-essence-stabilization",
			"aethric-destabilization",
			"prismatic-synthesis"
		},
		{
			pre .. "flux-capacitor",
			pre .. "reset-flux-capacitor",
		}
	),
	pf.technologyFactory( -- green-polyphasic-science-pack
		"green-polyphasic-science-pack",
		techPlaceholder,
		true,
		pf.unlockTriggerHelper(
			"craft-item",
			pre .. "charging-flux-capacitor",
			1
		),
		{
			"flux-capacitor"
		},
		{
			pre .. "green-polyphasic-science-pack"
		}
	),
	pf.technologyFactory( -- red-polyphasic-science-pack
		"red-polyphasic-science-pack",
		techPlaceholder,
		true,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack"
			},
			30
		),
		{
			"green-polyphasic-science-pack",
		},
		{
			pre .. "red-polyphasic-science-pack"
		}
	),
	pf.technologyFactory( -- blue-polyphasic-science-pack
		"blue-polyphasic-science-pack",
		techPlaceholder,
		true,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack"
			},
			30
		),
		{
			"green-polyphasic-science-pack",
		},
		{
			pre .. "blue-polyphasic-science-pack"
		}
	),
	pf.technologyFactory( -- complete-polyphasic-science
		"complete-polyphasic-science",
		techPlaceholder,
		true,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			30
		),
		{
			"green-polyphasic-science-pack",
			"blue-polyphasic-science-pack",
			"red-polyphasic-science-pack"
		},
		{
			-- No effects; this science is simply a gate.
		}
	),
	pf.technologyFactory( -- entropic-nurturing
		"entropic-nurturing",
		techPlaceholder,
		true,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				"agricultural-science-pack",
				pre .. "green-polyphasic-science-pack",
			},
			60
		),
		{
			"green-polyphasic-science-pack"
		},
		{
			pre .. "entropic-nurturing"
		}
	),
	pf.technologyFactory( -- lunar-panels
		"lunar-panels",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			1000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack",
			},
			60
		),
		{
			"green-polyphasic-science-pack",
			"solar-energy"
		},
		{
			pre .. "lunar-panel"
		}
	),
	pf.technologyFactory(
		"thermal-flux",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			1000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack",
			},
			60
		),
		{
			"green-polyphasic-science-pack"
		},
		{
			pre .. "thermal-flux-furnace",
			pre .. "electric-heater"
		}
	),
	pf.technologyFactory( -- chronocycler-core
		"chronocycler-core",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			1500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack",
			},
			60
		),
		{
			"green-polyphasic-science-pack"
		},
		{
			pre .. "unconfigured-chronocycler",
		}
	),
	pf.technologyFactory( --chronocycler-acceleration
		"chronocycler-acceleration",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "green-polyphasic-science-pack",
			},
			60
		),
		{
			"chronocycler-core"
		},
		{
			pre .. "acceleration-chronocycler"
		}
	),
	pf.technologyFactory( --chronocycler-stasis
		"chronocycler-stasis",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"chronocycler-core",
			"red-polyphasic-science-pack"
		},
		{
			pre .. "stasis-chronocycler"
		}
	),
	pf.technologyFactory( --chronocycler-reversal
		"chronocycler-reversal",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "blue-polyphasic-science-pack",
			},
			60
		),
		{
			"chronocycler-core",
			"blue-polyphasic-science-pack",
			"recycling"
		},
		{
			pre .. "reversal-chronocycler"
		}
	),
	pf.technologyFactory(--prismaris-bonus-worker-robots-speed-1
		"prismaris-bonus-worker-robots-speed-1",
		"__base__/graphics/technology/worker-robots-speed.png", -- Actually the real art for once
		false,
		pf.unlockUnitHelper(
			1000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"complete-polyphasic-science",
			"worker-robots-speed-5"
		},
		{
			{
				type = "worker-robot-speed",
				modifier = 1.0
			}
		},
		{
			upgrade = true
		}
	),
	pf.technologyFactory(--prismaris-bonus-worker-robots-speed-2
		"prismaris-bonus-worker-robots-speed-2",
		"__base__/graphics/technology/worker-robots-speed.png", -- Actually the real art for once
		false,
		pf.unlockUnitHelper(
			2000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"prismaris-bonus-worker-robots-speed-1"
		},
		{
			{
				type = "worker-robot-speed",
				modifier = 1.0
			}
		},
		{
			upgrade = true
		}
	),
	pf.technologyFactory( --prismatic-tesla-turret
		"prismatic-tesla-turret",
		techPlaceholder, -- TODO: placeholder
		false,
		pf.unlockUnitHelper(
			2000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"military-science-pack",
				"chemical-science-pack",
				"utility-science-pack",
				"space-science-pack",
				"electromagnetic-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"complete-polyphasic-science",
			"tesla-weapons"
		},
		{
			--TODO: Tesla recipes
		}
	),
	pf.technologyFactory( --prismatic-laser-turret
		"prismatic-laser-turret",
		techPlaceholder, -- TODO: placeholder
		false,
		pf.unlockUnitHelper(
			1000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"military-science-pack",
				"chemical-science-pack",
				"space-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"complete-polyphasic-science",
			"laser-turret"
		},
		{
			--TODO: Laser recipes
		}
	),
	pf.technologyFactory( --cogitor
		"cogitor",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			2500,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"military-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				"agricultural-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"complete-polyphasic-science",
			"production-science-pack",
			"military-science-pack",
			"utility-science-pack",
			"space-science-pack",
			"agricultural-science-pack",
			"carbon-fiber"
		},
		{
			pre .. "cogitor",
			pre .. "basic-catalytic-crystal",
			pre .. "advanced-catalytic-crystal",
			pre .. "automation-to-logistic-transmutation",
			pre .. "logistic-to-military-transmutation",
			pre .. "military-to-chemical-transmutation",
			pre .. "chemical-to-automation-transmutation",
			pre .. "utility-to-production-transmutation",
			pre .. "production-to-space-transmutation",
			pre .. "space-to-utility-transmutation",
		}
	),
	pf.technologyFactory( --cogitor-alien-science
		"cogitor-alien-science",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			2000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"space-science-pack",
				"agricultural-science-pack",
				"electromagnetic-science-pack",
				"metallurgic-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"cogitor",
			"electromagnetic-science-pack",
			"metallurgic-science-pack"
		},
		{
			pre .. "alien-catalytic-crystal",
			pre .. "electromagnetic-to-agricultural-transmutation",
			pre .. "agricultural-to-metallurgic-transmutation",
			pre .. "metallurgic-to-electromagnetic-transmutation",
		}
	),
	pf.technologyFactory( -- cogitor-promethium-science
		"cogitor-promethium-science",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			2000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"space-science-pack",
				"promethium-science-pack",
				"cryogenic-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"cogitor-alien-science",
			"cryogenic-science-pack",
			"promethium-science-pack",
		},
		{
			pre .. "promethium-catalytic-crystal",
			pre .. "cryogenic-to-promethium-transmutation",
			pre .. "promethium-to-cryogenic-transmutation",
		}
	),
	pf.technologyFactory(-- void-beacon
		"void-beacon",
		techPlaceholder,
		false,
		pf.unlockUnitHelper(
			750,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"space-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60
		),
		{
			"complete-polyphasic-science",
			"effect-transmission"
		},
		{
			pre.."void-beacon"
		}
	),
	pf.technologyFactory( -- prismaris-bonus-lab-speed
		"prismaris-bonus-lab-speed",
		"__base__/graphics/technology/research-speed.png",
		false,
		pf.unlockUnitHelper(
			750,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			30
		),
		{
			"complete-polyphasic-science",
			"research-speed-6"
		},
		{
			{
				type = "laboratory-speed",
				modifier = 0.7
			}
		}
	),
	pf.technologyFactory( -- prismaris-bonus-lab-productivity
		"prismaris-bonus-lab-productivity",
		"__space-age__/graphics/technology/research-productivity.png",
		false,
		pf.unlockUnitHelper(
			1000,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"military-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"utility-science-pack",
				"space-science-pack",
				"agricultural-science-pack",
				"electromagnetic-science-pack",
				"metallurgic-science-pack",
				pre .. "blue-polyphasic-science-pack",
				pre .. "green-polyphasic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			120
		),
		{
			"prismaris-bonus-lab-speed",
			"electromagnetic-science-pack",
			"metallurgic-science-pack"
		},
		{
			{
				type = "laboratory-productivity",
				modifier = 0.1
			}
		}
	),
	pf.technologyFactory( -- metallurgic-productivity
		"metallurgic-productivity",
		"__space-age__/graphics/technology/foundry.png",
		false,
		pf.unlockUnitHelper(
			nil,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"metallurgic-science-pack",
				pre .. "red-polyphasic-science-pack",
			},
			60,
			"1.5^L*1000"
		),
		{
			"metallurgic-science-pack",
			"red-polyphasic-science-pack"
		},
		{
			{
				type = "change-recipe-productivity",
				recipe = "molten-iron-from-lava",
				change = 0.1
			},
			{
				type = "change-recipe-productivity",
				recipe = "molten-copper-from-lava",
				change = 0.1
			},
			{
				type = "change-recipe-productivity",
				recipe = "iron-ore-melting",
				change = 0.1
			},
			{
				type = "change-recipe-productivity",
				recipe = "copper-ore-melting",
				change = 0.1
			},
		},
		{
			max_level = "infinite",
			upgrade = true
		}
	),
	pf.technologyFactory( -- holmium-productivity
		"holmium-productivity",
		"__space-age__/graphics/technology/holmium-processing.png",
		false,
		pf.unlockUnitHelper(
			nil,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"electromagnetic-science-pack",
				pre .. "blue-polyphasic-science-pack",
			},
			60,
			"1.5^L*1000"
		),
		{
			"electromagnetic-science-pack",
			"blue-polyphasic-science-pack"
		},
		{
			{
				type = "change-recipe-productivity",
				recipe = "holmium-solution",
				change = 0.1
			}
		},
		{
			max_level = "infinite",
			upgrade = true
		}
	),
	pf.technologyFactory( -- bioflux-productivity
		"bioflux-productivity",
		"__space-age__/graphics/technology/bioflux.png",
		false,
		pf.unlockUnitHelper(
			nil,
			{
				"automation-science-pack",
				"logistic-science-pack",
				"chemical-science-pack",
				"production-science-pack",
				"agricultural-science-pack",
				pre .. "green-polyphasic-science-pack",
			},
			60,
			"1.5^L*1000"
		),
		{
			"green-polyphasic-science-pack"
		},
		{
			{
				type = "change-recipe-productivity",
				recipe = "bioflux",
				change = 0.1
			}
		},
		{
			max_level = "infinite",
			upgrade = true
		}
	),
})


