data:extend({
	{
		type = "bool-setting",
		name = "prismaris-add-polysci-to-endgame",
		setting_type = "startup",
		default_value = true,
		order = "a[science]-a[endgame]"
	},
	{
		type = "bool-setting",
		name = "prismaris-randomized-science-phase",
		setting_type = "startup",
		default_value = true,
		order = "a[science]-b[randomized]"
	},
	{
		type = "bool-setting",
		name = "prismaris-easy-endgame-science-rescaling",
		setting_type = "startup",
		default_value = false,
		order = "a[science]-c[scaling]"
	},
	{
		type = "bool-setting",
		name = "prismaris-lightning-targets-robots",
		setting_type = "startup",
		default_value = true,
		order ="l[lightning-bots]"
	},
	{
		type="string-setting",
		name="test-stasis-mode",
		setting_type = "startup",
		default_value = "refresh",
		allowed_values = {"refresh","freeze"},
		order = "z"
	},
	{
		type = "string-setting",
		name = "test-reversal-mode",
		setting_type = "startup",
		default_value = "simple",
		allowed_values = {"simple","complex"},
		order = "z"
	}
})