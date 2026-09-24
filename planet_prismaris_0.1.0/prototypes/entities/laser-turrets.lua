local laserTurretTemplate = table.deepcopy(data.raw['electric-turret']['laser-turret'])
local laserGraphicsPath = prismarisConstants.entityGraphicsPath .. "laser-turret/"

function modify_beam(beamTint, damageType)
	local newBeam = table.deepcopy(data.raw['beam']['laser-beam'])
	newBeam.name = damageType .. "-laser-beam"
	--log(serpent.block(newBeam.action.action_delivery.target_effects)) -- Just a debugging sanity check
	newBeam.action.action_delivery.target_effects[1].damage.type = damageType -- Talk about nesting hell...
	-- Beam color
	newBeam.graphics_set.beam.head.layers[1].filename = laserGraphicsPath .. "laser-body-grayscale.png"
	newBeam.graphics_set.beam.head.layers[1].tint = beamTint
	newBeam.graphics_set.beam.head.layers[2].tint = beamTint
	newBeam.graphics_set.beam.tail.layers[1].filename = laserGraphicsPath .. "laser-end-grayscale.png"
	newBeam.graphics_set.beam.tail.layers[1].tint = beamTint
	newBeam.graphics_set.beam.tail.layers[2].tint = beamTint
	newBeam.graphics_set.beam.body[1].layers[1].filename = laserGraphicsPath .. "laser-body-grayscale.png"
	newBeam.graphics_set.beam.body[1].layers[1].tint = beamTint
	newBeam.graphics_set.beam.body[1].layers[2].tint = beamTint

	newBeam.graphics_set.ground.head.tint = beamTint
	newBeam.graphics_set.ground.tail.tint = beamTint
	newBeam.graphics_set.ground.body.tint = beamTint
	return newBeam
end



function modify_turret(tint, damageType)
	local newTurret = table.deepcopy(data.raw['electric-turret']['laser-turret'])
	newTurret.name = pre .. damageType .. "-laser-turret"
	newTurret.icon = nil
	newTurret.icons = {
		{icon = "__base__/graphics/icons/laser-turret.png", ['tint'] = tint} -- Temporary until I make new icons.
	}
	newTurret.minable.result = newTurret.name
	newTurret.folded_animation.layers[3].apply_runtime_tint = false
	newTurret.folded_animation.layers[3].tint = tint
	newTurret.folding_animation.layers[3].apply_runtime_tint = false
	newTurret.folding_animation.layers[3].tint = tint
	newTurret.preparing_animation.layers[3].apply_runtime_tint = false
	newTurret.preparing_animation.layers[3].tint = tint
	newTurret.prepared_animation.layers[3].apply_runtime_tint = false
	newTurret.prepared_animation.layers[3].tint = tint
	newTurret.energy_glow_animation.filename = laserGraphicsPath .. "laser-turret-shooting-light-grayscale.png"
	newTurret.energy_glow_animation.tint = tint
	--newTurret.water_reflection.pictures.filename = laserGraphicsPath .. "laser-turret-reflection-grayscale.png"
	--newTurret.water_reflection.pictures.tint = tint

	table.insert(newTurret.graphics_set.base_visualisation.animation.layers, {
		filename = laserGraphicsPath .. "laser-turret-base-mask.png",
		flags = {"mask"},
		tint = tint,
		width = 138,
		height = 104,
		shift = util.by_pixel(-0.5,2),
		scale = 0.5
	})


	newTurret.attack_parameters.ammo_type.action.action_delivery.beam = damageType .. "-laser-beam"

	return newTurret
end

-- Actually add the generated building and beam entities to the game
for i,key in ipairs(prismarisConstants.laserTintsAndTypes) do
	data:extend{
		modify_beam(key[1],key[2]),
		modify_turret(key[1],key[2])
	}
end