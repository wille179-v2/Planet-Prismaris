local nukeEffectsPrismaris = table.deepcopy(data.raw['explosion']['nuke-effects-vulcanus'])
nukeEffectsPrismaris.name = "nuke-effects-prismaris"
	
nukeEffectsPrismaris.surface_conditions = {
	{
		property = "pressure",
		min = 1100,
		max = 1100
	},
	{
		property = "magnetic-field",
		min = 93,
		max = 93
	}
}

nukeEffectsPrismaris.created_effect.action_delivery.target_effects = {
	{
		type = "set-tile",
		tile_name = pre .. "entropic-sea",
		radius = 8,
		apply_projection = true,
		tile_collison_mask = {layers = {out_of_map = true}}
	},
	{
		type = "set-tile",
		tile_name = pre .. "entropic-sea-deep",
		radius = 12,
		apply_projection = true,
		tile_collison_mask = {layers = {water_tile = true}}
	},
}

data:extend({nukeEffectsPrismaris})

local atomicRocket = data.raw['projectile']['atomic-rocket']
table.insert(atomicRocket.action.action_delivery.target_effects, {
	check_buildability = true,
	entity_name = "nuke-effects-prismaris",
	type = "create-entity"
})