
local prismaticShardPatch = table.deepcopy(data.raw["resource"]["iron-ore"])
prismaticShardPatch.name = pre .. "prismatic-shard"
prismaticShardPatch.infinite = true
prismaticShardPatch.minimum = 60000
prismaticShardPatch.normal = 60000
prismaticShardPatch.infinite_depletion_amount = 0
prismaticShardPatch.minable.result = pre .. "prismatic-shard"

local voidEssenceWell = table.deepcopy(data.raw["resource"]["sulfuric-acid-geyser"])
voidEssenceWell.name = pre .. "void-essence-well"
voidEssenceWell.minable.results = {
	{
		type = "fluid",
		name = pre .. "raw-void-essence",
		amount = 20
	}
}
voidEssenceWell.normal = 300000
voidEssenceWell.minimum = 300000
voidEssenceWell.order = "e"

data:extend({prismaticShardPatch,voidEssenceWell})
