data:extend({
	{
		type = "bool-setting",
		name = "prismaris-add-polysci-to-endgame",
		setting_type = "startup",
		default_value = true,
		order = "a[science]-a[endgame]"
	},
	{
		type = "string-setting",
		name = "prismaris-science-phase",
		setting_type = "startup",
		default_value = "randomized",
		allowed_values = {"randomized","all","all-balanced","red-only","green-only","blue-only"},
		order = "a[science]-b[randomized]"
	},
	{
		type = "bool-setting",
		name = "prismaris-easy-labs-ignore-spoil-percent",
		setting_type = "startup",
		default_value = false,
		order = "a[science]-d[spoil]"
	},
	{
		type = "bool-setting",
		name = "prismaris-lightning-mercy",
		setting_type = "startup",
		default_value = false,
		order ="m[mercy]-l[lightning-bots]"
	},
	{
		type = "bool-setting",
		name = "prismaris-aether-mercy",
		setting_type = "startup",
		default_value = false,
		order="m[mercy]-c[circuit]"
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