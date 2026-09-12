
# Implementation

- [ ] Planet Generation (low priority)
	- [x] Mapgen settings (once resource-specific tiles have been created)
	- [x] Asteroid spawn influence
	- [x] Platform surface render parameters (AKA the visible planet effect)
		- [ ] Include alternate art for visible planets in space mod
	- [x] Space routes
	- [ ] Alternate rocks with proper starting resources
- [x] Disable quality in `shard-obscuring` and `shard-illuminating` recipes to prevent casino loop
- [ ] Edit landfill/foundation to be able to go onto the entropic sea tiles
- [ ] Entropic Dust Bigger Rocket Capacity
- [ ] Chronocycler variants need correct error message for something that cannot be chronocycled (localization).
- [x] Figure out why no modules are working with `prismaris-aethric-shard-separation` (maybe it's because it's based on a stone furnace?)
- [x] make crystal separator crafting recipe, add unlock to `prismatic-separation` technology
- [ ] Endgame polyphasic science addition (see `data-final-fixes.lua` for more notes) 
- [x] Revisit stasis; extremely long-spoiling item variants?
	- Alpha testing option implemented
- [ ] Make sure laser/tesla weapons are affected by the correct damage researches
- [ ] Make sure all labs have at least 4 trash inventory slots.
- [ ] Figure out where the entropic sea glow is coming from
- [ ] Make sure entropic dust can't be recycled at all, or rather returns 100% of its yield instead.
- [ ] Alternate recipes for biochamber and agricultural tower on prismaris

- [x] Map settings - resource richness should be fixed and unchangable.

# Balance
- [ ] Aethric soil split into "natural" and "artificial" variants, plus a set of precursor tiles like `jellynut-wetland` where they can be placed
	- [ ] Alternatively, DON'T do this and instead disable the soil making/placing. Use the natural terrain generation of vulcanus. (I think I'm going to do this...)
- [ ] Up the yield on aethric shard destabilization? (Maybe two per craft instead of one...)