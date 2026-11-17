-- Disable prismaris glass recipe entirely, remove from tech tree.
-- Disable prismaris's sand; rebalance sand-from-shard recipe to be competitive
-- Add Krastorio glass to metaphysical glassworking tech
-- Replace science pack icons and locale strings with KS2-style tech cards/locale

local utils = require("utils")
local matter_lib = require("__Krastorio2__.prototypes.libraries.matter")

utils.add_prerequisites("metaphysical-glassworking",{"kr-stone-processing"})
utils.add_recipes("metaphysical-glassworking",{"kr-sand","kr-glass"})


if data.raw["recipe"]["sand"] and data.raw["recipe"]["sand"].prismaris == true then -- My version of sand has a special flag set.
	utils.remove_recipes("metaphysical-glassworking",{"sand"})
	data.raw["recipe"]["sand"].hidden = true
	data.raw["recipe"]["sand"].hidden_in_factoriopedia = true
end

if data.raw["recipe"]["glass"] and data.raw["recipe"]["glass"].prismaris == true then
	utils.remove_recipes("metaphysical-glassworking",{"glass"})
	data.raw["recipe"]["glass"].hidden = true
	data.raw["recipe"]["glass"].hidden_in_factoriopedia = true
end

data.raw["recipe"][pre .. "sand-from-cracked-lithic-shard"].results = pf.itemResultsFactory{
	{"kr-sand", min = 3, max = 4}
}

data.raw["recipe"][pre .. "shiny-bottle"].ingredients = pf.itemIngredientsFactory{
	{"kr-glass",1}
}

data.raw["recipe"][pre .. "metaphysical-prism"].ingredients = pf.ingredientsFactory(
	{
		{pre .. "activated-prismatic-shard-w",1},
		{pre .. "activated-prismatic-shard-k",1},
		{"kr-glass", 1},
	},
	{
		{pre .. "concentrated-void-essence",50}
	}
)
local modIcons = prismarisConstants.compatGraphics .. "icons/"

data.raw["recipe"][pre.."red-polyphasic-science-pack"].icons = pf.iconFactory(modIcons .. "ks2-card-red.png")
data.raw["recipe"][pre.."green-polyphasic-science-pack"].icons = pf.iconFactory(modIcons .. "ks2-card-green.png")
data.raw["recipe"][pre.."blue-polyphasic-science-pack"].icons = pf.iconFactory(modIcons .. "ks2-card-blue.png")


local rPack = data.raw["item"][pre.."red-polyphasic-science-pack"]
local gPack = data.raw["item"][pre.."green-polyphasic-science-pack"]
local bPack = data.raw["item"][pre.."blue-polyphasic-science-pack"]

rPack.icon = modIcons .. "ks2-card-red.png"
rPack.icons = pf.iconFactory(modIcons .. "ks2-card-red.png")
gPack.icon = modIcons .. "ks2-card-green.png"
gPack.icons = pf.iconFactory(modIcons .. "ks2-card-green.png")
bPack.icon = modIcons .. "ks2-card-blue.png"
bPack.icons = pf.iconFactory(modIcons .. "ks2-card-blue.png")

rPack.pictures = makeGlow(modIcons .. "ks2-card-red.png",modIcons .. "ks2-card-light.png").pictures
gPack.pictures = makeGlow(modIcons .. "ks2-card-green.png",modIcons .. "ks2-card-light.png").pictures
bPack.pictures = makeGlow(modIcons .. "ks2-card-blue.png",modIcons .. "ks2-card-light.png").pictures

rPack.localised_name = {"item-name.prismaris-red-tech-card"}
gPack.localised_name = {"item-name.prismaris-green-tech-card"}
bPack.localised_name = {"item-name.prismaris-blue-tech-card"}

matter_lib.make_recipes{
	material = {type = "item", name = pre .. "refined-entropic-dust-positive", amount = 10},
	matter_count = 1,
	energy_required = 1,
	unlocked_by = "entropic-sea-filtering"
}
data.raw.recipe["kr-matter-to-".. pre .. "refined-entropic-dust-positive"].surface_conditions = keys.prismarisOnly.surface_conditions

matter_lib.make_recipes{
	material = {type = "item", name = pre .. "raw-entropic-dust-positive", amount = 10},
	matter_count = 1,
	energy_required = 1,
	unlocked_by = "entropic-sea-filtering"
}
data.raw.recipe["kr-matter-to-".. pre .. "raw-entropic-dust-positive"].surface_conditions = keys.prismarisOnly.surface_conditions


