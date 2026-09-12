require("prototypes.recipes.auto-recipes.acceleration")
require("prototypes.recipes.auto-recipes.reversal")
require("prototypes.recipes.auto-recipes.stasis")

-- Searches for burner buildings; adds a trash slot to them if required.
for category,prototypeList in pairs(data.raw) do -- Prototype categories
	for prototypeName,prototypeData in pairs (prototypeList) do -- specific prototypes
		if prototypeData.energy_source ~= nil and prototypeData.energy_source.type == "burner" then -- check if it's a burner item
			local valid = false
			for _,i in ipairs(prototypeData.energy_source.fuel_categories or {}) do 
				if i == "chemical" or i == "nutrients" then -- check if the burner uses nutrients or chemical fuel
					valid = true
				end
			end
			if (prototypeData.energy_source.burnt_inventory_size == nil or prototypeData.energy_source.burnt_inventory_size <= 0) and valid then -- only modify valid buildings that need to be modified
				data.raw[category][prototypeName].energy_source.burnt_inventory_size = 1
			end
		end
	end
end

-- TODO: Add polyscience to endgame
	-- Note: If settings.startup["prismaris-add-polysci-to-endgame"].value == false, do nothing in this section and ignore the value of "prismaris-randomized-science-phase"
	-- If "prismaris-randomized-science-phase" == true (default value), every science should get one randomly chosen polyphase science pack instead of all three, but require three of them.
	-- Else if "prismaris-randomized-science-phase" == false, every science should require aone of all three polyphase science packs
		-- If "prismaris-easy-endgame-science-rescaling" == true (default is false), rebalance the technology costs and research times: