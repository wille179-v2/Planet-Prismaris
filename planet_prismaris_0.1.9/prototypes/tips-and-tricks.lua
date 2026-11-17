local iconPath = prismarisConstants.iconsPath

function tipsAndTricksTemplate(tipDefinition)
	return {
		-- Required
		name = tipDefinition.name,
		trigger = tipDefinition.trigger or {type = "research",technology = tipDefinition.technology},
		order = tipDefinition.order,
		tag = tipDefinition.tag,

		--Optional
		image = tipDefinition.image,
		simulation = tipDefinition.simulation,
		is_title = tipDefinition.is_title,
		
		--Optional with default
		indent = tipDefinition.indent or 1,
		icon = tipDefinition.icon,
		icon_size = tipDefinition.icon_size or 64,
		
		-- Constants
		category = "prismaris-tips",
		type = "tips-and-tricks-item",
	}
end


data:extend{
	{
		type = "tips-and-tricks-item-category",
		name = "prismaris-tips",
		order = "k-[space-age]-p[prismaris]"
	},
	tipsAndTricksTemplate{
		name = "planet-prismaris-briefing",
		technology = "planet-discovery-prismaris",
		order = "a[briefing]-a[overview]",
		tag = "[planet=prismaris]",
		indent = 0,
		is_title = true
	},
	tipsAndTricksTemplate{
		name = "hostile-atmosphere",
		technology = "planet-discovery-prismaris",
		order = "a[briefing]-b[hostile]",
		tag = "[entity=lightning]"
	},
	tipsAndTricksTemplate{
		name = "prismatic-shards",
		technology = "prismatic-separation",
		order = "b[resources]-a[prismatic]",
		tag = "[item=prismaris-prismatic-shard][entity=prismaris-crystal-separator]"
	},
	tipsAndTricksTemplate{
		name = "aehtric-shards",
		technology = "aethric-cultivation",
		order = "b[resources]-b[aehtric]",
		tag = "[entity=prismaris-cultivated-aether-crystal][item=prismaris-aethric-shard]"
	},
	tipsAndTricksTemplate{
		name = "entropic-sea",
		technology = "planet-discovery-prismaris",
		order = "b[resources]-c[entropic]-a[sea]",
		tag = "[fluid=prismaris-liquid-entropy]"
	},
	tipsAndTricksTemplate{
		name = "entropic-dust",
		technology = "entropic-sea-filtering",
		order = "b[resources]-c[entropic]-b[dust]",
		tag = "[item=prismaris-raw-entropic-dust-positive][item=prismaris-raw-entropic-dust-negative][item=prismaris-refined-entropic-dust-positive][item=prismaris-refined-entropic-dust-negative]",
		indent = 2
	},
	tipsAndTricksTemplate{
		name = "entropic-nutrients",
		technology = "entropic-nurturing",
		order = "b[resources]-c[entropic]-c[nutrients]",
		tag = "[item=prismaris-entropic-nutrients][entity=biochamber]",
		indent = 2
	},
	tipsAndTricksTemplate{
		name = "void-essence",
		technology = "void-essence-stabilization",
		order = "b[resources]-d[void]",
		tag = "[fluid=prismaris-raw-void-essence][fluid=prismaris-concentrated-void-essence][fluid=prismaris-distorted-void-essence][fluid=prismaris-stabilized-void-essence]"
	},
	tipsAndTricksTemplate{
		name = "flux-capacitor",
		technology = "flux-capacitor",
		order = "c[item]-a[flux]",
		tag = "[item=prismaris-active-flux-capacitor]"
	},
	tipsAndTricksTemplate{
		name = "chronocycling",
		technology = "chronocycler-core",
		order = "d[chronocycler]-a[core]",
		tag = "[item=prismaris-unconfigured-chronocycler]"
	},
	tipsAndTricksTemplate{
		name = "chronocycler-stasis",
		technology = "chronocycler-stasis",
		order = "d[chronocycler]-b[stasis]",
		tag = "[entity=prismaris-stasis-chronocycler]",
		indent = 2
	},
	tipsAndTricksTemplate{
		name = "chronocycler-acceleration",
		technology = "chronocycler-acceleration",
		order = "d[chronocycler]-c[acceleration]",
		tag = "[entity=prismaris-acceleration-chronocycler]",
		indent = 2
	},
	tipsAndTricksTemplate{
		name = "chronocycler-reversal",
		technology = "chronocycler-reversal",
		order = "d[chronocycler]-d[reversal]",
		tag = "[entity=prismaris-reversal-chronocycler]",
		indent = 2
	},
	tipsAndTricksTemplate{
		name = "thermal-flux",
		technology = "thermal-flux",
		order = "e[buildings]-a[flux]",
		tag = "[entity=prismaris-thermal-flux-furnace][entity=prismaris-electric-heater]"
	},
	tipsAndTricksTemplate{
		name = "cogitor",
		technology = "cogitor",
		order = "e[buildings]-b[cogitor]",
		tag = "[entity=prismaris-cogitor]"
	},
}