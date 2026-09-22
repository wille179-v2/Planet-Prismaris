local pre = prismarisConstants.prototypePrefix
local saIcons = "__space-age__/graphics/icons/"
local baseIcons = "__base__/graphics/icons/"
local prisFluid = prismarisConstants.iconsPath .. "fluid/"

--pf.fluidFactory(name, icons, default_temperature, base_color, flow_color, otherKeys)

data:extend({
	pf.fluidFactory(
		pre .. "liquid-entropy",
		prisFluid .. "liquid-entropy.png",
		15,
		{.95,.95,.95},
		{.05,.05,.05},
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "raw-void-essence",
		prisFluid .. "raw-void-essence.png",
		15,
		{236,159,5},
		{84,13,110},
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "concentrated-void-essence",
		prisFluid .. "concentrated-void-essence.png",
		15,
		{236,159,5}, -- TODO: Pick new colors (slightly brigher yellow, more pink for secondary)
		{84,13,110},
		{
			draw_as_glow = true,
			fuel_value = "250kJ",
			spent_fluid = {
				name = pre .. "distorted-void-essence",
				amount = prismarisConstants.voidFluidRatio
			}
		}
	),
	pf.fluidFactory(
		pre .. "distorted-void-essence",
		prisFluid .. "distorted-void-essence.png",
		15,
		{236,159,5}, -- TODO: Pick new colors (more brown-orange)
		{84,13,110},
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "stabilized-void-essence",
		prisFluid .. "stabilized-void-essence.png",
		15,
		{236,159,5}, -- TODO: Pick new colors (more pale primary color)
		{84,13,110},
		{
			draw_as_glow = true,
			auto_barrel = false
		}
	),
})