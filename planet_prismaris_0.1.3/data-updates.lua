-- Update foundry smoke and em plant lightning to reflect crafting machine color
-- also set default color of foundry/em plant recipes to the original default color to preserve aesthetic of vanilla items

local foundryWorkVisuals = data.raw['assembling-machine']['foundry'].graphics_set.working_visualisations

foundryWorkVisuals[3].apply_recipe_tint = "primary" -- overwriting old crucible smoke

foundryWorkVisuals[4].apply_recipe_tint = "secondary" -- overwriting old smoke rings

foundryWorkVisuals[8] = { -- overwriting old smoke stack
	constant_speed = true,
	fadeout = true,
	render_layer = "wires",
	apply_recipe_tint = "tertiary",
	animation = {
		animation_speed = 0.5,
		filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
		frame_count = 47,
		height = 188,
		width = 90,
		line_length = 16,
		scale = 0.5,
		shift = util.by_pixel(52, -131),
	}
}
foundryWorkVisuals [9] = { -- new smoke inner layer
	constant_speed = true,
	fadeout = true,
	render_layer = "wires",
	apply_recipe_tint = "quaternary",
	animation = {
		animation_speed = 0.5,
		filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
		frame_count = 47,
		height = 84,
		width = 40,
		line_length = 16,
		scale = 0.5,
		shift = util.by_pixel(54, -105),
	}
}

local electromagneticPlantWorkVisuals = data.raw['assembling-machine']['electromagnetic-plant'].graphics_set.working_visualisations

electromagneticPlantWorkVisuals[6].apply_recipe_tint = "primary"
electromagneticPlantWorkVisuals[7].apply_recipe_tint = "primary"
electromagneticPlantWorkVisuals[8].apply_recipe_tint = "primary"
electromagneticPlantWorkVisuals[9].apply_recipe_tint = "primary"

for recipeName,recipe in pairs(data.raw['recipe']) do
	for _,category in pairs(recipe.categories or {}) do
		if category == "metallurgy" and recipe.crafting_machine_tint == nil then
			recipe.crafting_machine_tint = {
				primary = {1,1,1},
				secondary = {1,1,1},
				tertiary = {0.4, 0.4, 0.4, 1},
				quaternary = {0.4, 0.4, 0.4, 0},
			}
		elseif category == "electromagnetics" and recipe.crafting_machine_tint == nil then
			recipe.crafting_machine_tint = {
				primary = {1,1,1,1}
			}
		end

	end
end