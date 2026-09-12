*Prismaris* is a planet of ever-shifting resources. Everything is constantly becoming something else all the time through the spoilage mechanic, but nothing is ever lost for good. Almost every recipe has multiple possible outputs and many items spoil after a short duration into another item in a cycle. Recycling is also borked on this planet; the only way to stem the tide is to embrace the sushi and pray nothing clogs.

Prismaris is *intended* to be done between the inner planets and aquilo, but strictly speaking it only requires Gleba first. It eligible for any planet start.

Prismaris's terrain is based loosely on the generation of aquilo, with small islands of solid ground and vast seas of entropy.


Prismaris comes with a few specific resources:
- Prismatic Shards - Can be split into items with an a fast-shifting RGBW or CMYK cycle. Opposing pairs can be converted into iron ore, copper ore, or stone. White and Black variants are less useful and hog belt space, having the longest spoil times.
	- Patches are small and far apart, but are literally infinite.
- Aethric Shards - Can be "shattered" into a set of (seemingly) identical variants, then further "destabilized" into forms that decay into solid petrochemical resources (coal, carbon, solid fuel, sulfur) and calcite.
	- Grown like plants using an agricultural tower. Very fast growth time, but relatively low yield per harvest.
	- One of the variants (which has the longest spoil time and the only unique icon) acts as a seed for the crystals.
- Entropic Sea - A fluid resource, from the ocean. Can be separated into "entropic dust" and water. Entropic dust rapidly flickers between a positive and negative form; only the positive form is useful. It's also very hard to get rid of entropic dust as you generally consume less than you produce and it can't be recycled away.
	- Positive Entropic Dust also has a small fuel value... and a burn result of negative entropic dust, meaning you can't actually get rid of it by burning it. It can also be converted into entropic nutrients, but those spoil/burn back to negative entropic dust too. Productivity bonuses can quickly cause this to grow out of control.
	- On Prismaris, excess can be tossed back into the ocean. On other planets, it can be voided by tossing it into lava or launched into space.
		- Entropic dust has a *very* high rocket capacity for this reason.
- Void Essence - A pumped fluid. Useful in many processes, particularly as a catalyst. Like Fluoroketone, comes in multiple variants that must be cycled between, but tends to be ever-so-slightly "lossy" at first. Sufficient (and *easily* attainable) levels of productivity can make the process net positive, however.

Prismaris has a few interesting environmental features
- Lightning - Like Fulgora, Prismaris has lightning storms, though these go all day and night (stronger during the day). These lightning strikes are far less frequent than on Fulgora and each bolt has less energy, so the power they provide is significantly diminished but they still necessitate protection. (Maybe Yoink Hyarion's laser lightning / crystals?)
- Thin Air - Like Aquilo, the air in Prismaris is thin, increasing the energy usage of robots significantly (though not as much as Aquilo)
- Low solar - The solar power on Prismaris is fairly low.
- Tainted Water - The only source of water on the planet has a physical byproduct
- Broken Recycling - The recycler won't accept any item native to Prismaris


Exclusive Buildings:
- Crystal Separator - Furnace prototype for processing prismatic and Aethric shards. Happily accepts any variant put into it and spits out *something,* though sometimes that something is junk.

Alternate Recipes
- Provides an alternate recipe for unlocking/crafting the agricultural tower and the 

Science Pack:
- Prismaris has the "Polyphasic Science Pack," which comes in three forms that cycle on a 10 minute timer by spoilage. Basic technologies need one of the three variants (Red / Green / Blue) while more advanced technologies might need two or even three different packs.

Technology Rewards:
- Chronocycler - Multi-phase building, comes in four variants. Uses Void Essence as a liquid fuel. All work like a furnace prototype with a liquid fuel.
	- Unconfigured Chronocycler - the base item, cannot be placed as a building. This is the version that is crafted, and the item form of all other chronocyclers are both made from 1 of these and spoil back into 1 of these after 1 hour.
	- Reversal Chronocycler - Works like a normal recycler, but has an innate quality and productivity bonus at the cost of being slightly slower.
	- Stasis Chronocycler - Takes in an item with a spoil time, and produces the same amount of that item at the same quality, but with the spoil time reset. Useful when built on spaceships for gleba transport.
	- Acceleration Chronocycler - Takes in an item with a spoil time, and immediately produces its spoil result, at a slight chance of loss.
- Lunar Panels - Inverted, more efficient solar panels that work at night rather than during the day.
- Cogitor - Uses a complex crystal catalyst to work (catalyst self-resets through a long spoilage time). Can transmute science packs in a lossy cycle, but has a very high innate quality bonus. If the cycle goes completely around, it produces extra low-tier science packs but not enough for the cycle to be net positive. All cycles require all of their respective science packs to unlock.
	- Each step loses 50% of the science put in, except when the cycle resets to the lowest tier, which returns 200%.
		- Completing a full cycle generally returns `1/(2^(n-1))` of the original science, where `n` is the number of packs in the cycle
		- i.e. Red -> 1/2 Green -> 1/4 Gray -> 1/8 Blue -> 1/4 Red (returns 200% instead of 50%)
	- Cycles are:
		- Basic Catalytic Crystal: Red -> Green -> Gray -> Blue
		- Advanced Catalytic Crystal: Yellow -> Purple -> Space
		- Alien Catalytic Crystal: Vulcanus -> Fulgora -> Gleba (all are considered "equal" in tier)
		- Promethium Catalytic Crystal: Cryogenic -> Promethium (Cry to Prometh has a 75% loss instead of the normal 50% loss because the cycle is so short, and Prometh to Cry only returns 150% instead of 200%)
	- Catalytic crystals are expensive to produce and several science packs themselves to be used in the process of crafting (100 of each relevant pack per crystal), but crystals can be reused.
- Prismatic Laser & Tesla Turrets - Laser turrets that do damage types other than "laser" or "electric."
	- Uses the same "Unconfigured" / 1-hour spoil-reversion mechanic of the chronocycler, though it takes a prismatic shard to configure and that shard is lost if it reverts. Beam matches the color of the prismatic shard.
	- Damage of each turret is slightly higher, but so is the energy consumption. 
	- All variants are affected by the same damage / shooting speed researches as their vanilla counterparts.
	- Variants:
		- R: Fire
		- G: Acid
		- B: Electric / Laser (opposite of default)
		- C: Poison
		- M: Physical
		- Y: Explosion
- Additional Lab Speed + 3 levels of research productivity
- 2 Free levels of worker robot speed
- Void Beacons - Beacons that allow productivity/quality modules and have both a high multiplier and high transmission range, but use concentrated void fluid as their fuel instead of electricity, outputting impure void essence as waste product.