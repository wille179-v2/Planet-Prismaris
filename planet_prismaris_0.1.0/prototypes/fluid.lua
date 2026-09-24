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
		color.entropy[1],
		color.entropy[2],
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "raw-void-essence",
		prisFluid .. "raw-void-essence.png",
		15,
		color.rawVoid[1],
		color.rawVoid[2],
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "concentrated-void-essence",
		prisFluid .. "concentrated-void-essence.png",
		15,
		color.concentratedVoid[1],
		color.concentratedVoid[2],
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
		color.distortedVoid[1],
		color.distortedVoid[2],
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "stabilized-void-essence",
		prisFluid .. "stabilized-void-essence.png",
		15,
		color.stabilizedVoid[1],
		color.stabilizedVoid[2],
		{
			draw_as_glow = true,
			auto_barrel = false
		}
	),
})