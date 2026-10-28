--------------------------------------
-- Section A: Accessibility Options --
--------------------------------------

data:extend{
	{ --Determines whether to use the "lava" tile effect (default) or "water" tile effect (low eye-strain) for entropy tiles.
		type="bool-setting",
		name = "prismaris-entropy-eye-strain-accessibility",
		setting_type = "startup",
		default_value = false,
		order = "a[accessibility]-a[eye-strain]"
	}
}


--------------------------------------
-- Section B: Difficulty Options --
--------------------------------------

data:extend{
	{ -- If enabled, labs stop considering the spoil percentage of polyphasic science like gleba's science
		type = "bool-setting",
		name = "prismaris-easy-labs-ignore-spoil-percent",
		setting_type = "startup",
		default_value = false,
		order = "b[difficulty]-a[science-spoil]"
	},
	{ -- If enabled, lightning stops prioritizing robots 
		type = "bool-setting",
		name = "prismaris-lightning-mercy",
		setting_type = "startup",
		default_value = false,
		order ="b[difficulty]-b[lightning-bots]"
	},
	{ -- If enabled, reveals the full aether crystal set in factoriopedia/signal UI and reveals the phase and end product in tooltips.
		type = "bool-setting",
		name = "prismaris-aether-mercy",
		setting_type = "startup",
		default_value = false,
		order="b[difficulty]-c[circuit]"
	},
	{ -- Determines how entropic dust behavies in recipes and when burnt.
		-- Default: (hard) spoils in pair cycles, but burning and using recipes demotes refined back down to raw.
		-- Collapse: (medium) all spoilage and consumption returns the dust back to raw.
		-- Preserve: (easy) all burning and recipes produce the refined version; once refined it stays refined. Cannot be used in the heating tower in this mode.
		type = "string-setting",
		name = "prismaris-dust-mode",
		setting_type = "startup",
		default_value = "default-mode",
		allowed_values = {"default-mode","collapse-mode","preserve-mode"},
		order = "b[difficulty]-d[entropic-dust]"
	},
	{ -- Chose whether aether crystals are edible items that restore a small amount of health, are not edible at all, or count as a weak source of non-spoiling nutrients for the biochamber.
		type = "string-setting",
		name = "prismaris-rock-candy",
		setting_type = "startup",
		default_value = "candy",
		allowed_values = {"inedible","candy","candy-and-nutrients"},
		order = "b[difficulty]-e[candy]"
	},
}

--------------------------------------------
-- Section C: Minor Tweaks --
--------------------------------------------

data:extend{
	{ -- Choose how long it takes for prismaris items to spoil, without affecting the global spoil timer.
		type = "string-setting",
		name = "prismaris-spoil-speed",
		setting_type = "startup",
		default_value = "default",
		allowed_values = {"turbo","default","slow","glacial"},
		order = "c[tweaks]-f[spoil-speed]"
	},
}


--------------------------------------------
-- Section D: Endgame Progression Options --
--------------------------------------------

data:extend{
	{ -- Adds polysci to endgame researches (aquilo and any science requiring, cryogenic science, promethean science, or all three post-nauvis planetary sciences); disabling leaves all vanilla technologies unaltered.
		type = "bool-setting",
		name = "prismaris-add-polysci-to-endgame",
		setting_type = "startup",
		default_value = true,
		order = "d[endgame]-a[add-science]"
	},
	{ -- Determines how polysci is added to the endgame:
			-- Randomized: Every endgame technology gets one randomly chosen polysci pack
			-- All: Every endgame technology requires all three polysci packs
			-- All (balanced): Every technology requires all three polysci packs, but all other science packs consume 3 units, take 3x as long per unit, and have their total units multiplied by 1/3 (effectively reducing each polysci pack to 1/3 its effective cost).
			-- Rainbow: A rainbow science pack is created, using one of all 3 polysci packs to produce 3x rainbow packs. The rainbow pack is the only science pack added to any lab.
		type = "string-setting",
		name = "prismaris-science-phase",
		setting_type = "startup",
		default_value = "randomized",
		allowed_values = {"randomized","all","all-balanced","rainbow"},
		order = "d[endgame]-b[science-phase]"
	},
}

--------------------------------------------
-- Section E: Mod Compatibility Options --
--------------------------------------------

-- Any Planet Start and other mod compatibility related stuff goes here.
-- See: https://mods.factorio.com/mod/any-planet-start

if mods["any-planet-start"] then
	APS.add_choice("prismaris")
end

data:extend{
	{ -- Removes stasis mode entirely, for use when another mod adds its own method of stasis
		type = "bool-setting",
		name = "prismaris-stasis-removal",
		setting_type = "startup",
		default_value = false,
		order = "e[compatibility]-a[remove-stasis]"
	}
}



--------------------------------------------
-- Section Z: Mod Testing Options --
--------------------------------------------

data:extend({
	{
		type="string-setting",
		name="test-stasis-mode",
		setting_type = "startup",
		default_value = "refresh",
		allowed_values = {"refresh","freeze"},
		order = "z-stasis"
	},
	{
		type = "string-setting",
		name = "test-reversal-mode",
		setting_type = "startup",
		default_value = "simple",
		allowed_values = {"simple","complex"},
		order = "z-reversal"
	}
})