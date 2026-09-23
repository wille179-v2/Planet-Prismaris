local scienceGroup = "intermediate-products"
if mods["science-tab"] then
	scienceGroup = "science"
end

data:extend{
	{
		type = "item-subgroup",
		name = "prismaris-processes-prismatic",
		group = "intermediate-products",
		order = "o[prismaris]-a"
	},
	{
		type = "item-subgroup",
		name = "prismaris-processes-aethric",
		group = "intermediate-products",
		order = "o[prismaris]-b"
	},
	{
		type = "item-subgroup",
		name = "prismaris-processes-entropic",
		group = "intermediate-products",
		order = "o[prismaris]-c"
	},
	{
		type = "item-subgroup",
		name = "prismaris-processes-void",
		group = "intermediate-products",
		order = "o[prismaris]-d"
	},
	{
		type = "item-subgroup",
		name = "prismaris-processes-technical",
		group = "intermediate-products",
		order = "o[prismaris]-e"
	},
	{
		type = "item-subgroup",
		name = "prismaris-science-pack",
		group = scienceGroup,
		order = "y-b"
	},
	{
		type = "item-subgroup",
		name = "prismaris-cogitor-catalyst",
		group = scienceGroup,
		order = "zz-a"
	},
	{
		type = "item-subgroup",
		name = "prismaris-cogitor-transmute",
		group = scienceGroup,
		order = "zz-b"
	},
	{
		type = "item-subgroup",
		name = "prismaris-chronocycler",
		group = "production",
		order = "e[chronocycler]"
	},
	--{
	--	type = "item-subgroup",
	--	name = "prismaris-chronocycler-acceleration",
	--	group = "production",
	--	order = "e[chronocycler]-a[acceleration]"
	--},
	{
		type = "item-subgroup",
		name = "prismaris-tiles",
		group = "tiles",
		order = "e-a"
	},
	{
		type = "item-subgroup",
		name = "prismaris-laser-turrets",
		group = "combat",
		order = "i-a[laser]"
	},
	{
		type = "item-subgroup",
		name = "prismaris-tesla-turrets",
		group = "combat",
		order = "i-b[tesla]"
	},
}