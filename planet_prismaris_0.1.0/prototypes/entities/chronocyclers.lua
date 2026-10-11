--Reverse Chronocycler, temporarily using a copy of the recycler
local reversalChronocycler = table.deepcopy(data.raw["furnace"]["recycler"])
reversalChronocycler.name = pre .. "reversal-chronocycler"
reversalChronocycler.crafting_categories = {"recycling",pre.."reverse-chronocycling"}
reversalChronocycler.minable.result = pre .. "reversal-chronocycler"
reversalChronocycler.crafting_speed = .25
reversalChronocycler.effect_receiver = {
	base_effect = {
		productivity = 0.25,
		quality = 0.05
	}
}
reversalChronocycler.energy_usage = "1MW"
reversalChronocycler.energy_source = {
	type = "fluid",
	fluid_box = fluidboxes.input,
	output_fluid_box = fluidboxes.output,
	burns_fluid = true,
	scale_fluid_usage = true,
}
if settings.startup["test-reversal-mode"].value == "complex" then
	reversalChronocycler.localised_description = {"entity-description.prismaris-reversal-chronocycler-complex"}
else
	reversalChronocycler.localised_description = {"entity-description.prismaris-reversal-chronocycler-simple"}
end


--Stasis Chronocycler, temporarily using a copy of the recycler
local stasisChronocycler = table.deepcopy(data.raw["furnace"]["recycler"])
stasisChronocycler.name = pre .. "stasis-chronocycler"
stasisChronocycler.crafting_categories = {pre .. "stasis-chronocycling"}
stasisChronocycler.minable.result = pre .. "stasis-chronocycler"
stasisChronocycler.crafting_speed = 1
stasisChronocycler.allowed_effects = {"speed","consumption","pollution"}
stasisChronocycler.module_slots = 2
stasisChronocycler.energy_usage = "4MW"
stasisChronocycler.energy_source = {
	type = "fluid",
	fluid_box = fluidboxes.input,
	output_fluid_box = fluidboxes.output,
	burns_fluid = true,
	scale_fluid_usage = true,
}
if settings.startup["test-stasis-mode"].value == "refresh" then
	stasisChronocycler.localised_description = {"entity-description.prismaris-stasis-chronocycler-refresh"}
else
	stasisChronocycler.localised_description = {"entity-description.prismaris-stasis-chronocycler-freeze"}
end


--Acceleration Chronocycler, temporarily using a copy of the recycler
local accelerationChronocycler = table.deepcopy(data.raw["furnace"]["recycler"])
accelerationChronocycler.name = pre .. "acceleration-chronocycler"
accelerationChronocycler.crafting_categories = {pre.."acceleration-chronocycling"}
accelerationChronocycler.minable.result = pre .. "acceleration-chronocycler"
accelerationChronocycler.crafting_speed = 1
accelerationChronocycler.energy_usage = "4MW"
accelerationChronocycler.energy_source = {
	type = "fluid",
	fluid_box = fluidboxes.input,
	output_fluid_box = fluidboxes.output,
	burns_fluid = true,
	scale_fluid_usage = true,
}




data:extend({
	reversalChronocycler,
	stasisChronocycler,
	accelerationChronocycler,
	{
		type = "recipe-category",
		name = pre .. "reverse-chronocycling"
	},
	{
		type = "recipe-category",
		name = pre .. "stasis-chronocycling"
	},
	{
		type = "recipe-category",
		name = pre .. "acceleration-chronocycling"
	},
})
