local pre = prismarisConstants.prototypePrefix
local saIcons = "__space-age__/graphics/icons/" -- for temporary use
local baseIcons = "__base__/graphics/icons/" -- for temporary use

--pf.fluidFactory(name, icons, default_temperature, base_color, flow_color, otherKeys)

data:extend({
	pf.fluidFactory(
		pre .. "liquid-entropy",
		saIcons .. "fluid/lava.png", -- TODO: Placeholder
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
		saIcons .. "fluid/lithium-brine.png",  -- TODO: Placeholder
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
		saIcons .. "fluid/lithium-brine.png",  -- TODO: Placeholder
		15,
		{236,159,5}, -- TODO: Pick new colors
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
		saIcons .. "fluid/lithium-brine.png",  -- TODO: Placeholder
		15,
		{236,159,5}, -- TODO: Pick new colors
		{84,13,110},
		{
			draw_as_glow = true,
			auto_barrel = false,
		}
	),
	pf.fluidFactory(
		pre .. "stabilized-void-essence",
		saIcons .. "fluid/lithium-brine.png",  -- TODO: Placeholder
		15,
		{236,159,5}, -- TODO: Pick new colors
		{84,13,110},
		{
			draw_as_glow = true,
			auto_barrel = false
		}
	),
})