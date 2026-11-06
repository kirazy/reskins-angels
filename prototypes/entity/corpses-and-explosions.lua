-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _defines = require("__reskins-assets-api__.api.defines")
local Applicators = require("__reskins-assets-api__.api.applicators")

-- Each group of Angel's entities that keep the artwork of Angel's mods, with the triggers that enable it and the base
-- entity of which the dying explosion is used. Each entity uses the generic remnants for its size.
local groups = {
	{
		triggers = { "refining" },
		type = "furnace",
		explosion = "storage-tank",
		names = { "angels-clarifier" },
	},
	{
		triggers = { "refining" },
		type = "assembling-machine",
		explosion = "assembling-machine-1",
		names = { "angels-barreling-pump" },
	},
	{
		triggers = { "refining" },
		type = "mining-drill",
		explosion = "pumpjack",
		names = { "angels-thermal-bore", "angels-thermal-extractor", "angels-sea-pump" },
	},
	{
		triggers = { "refining" },
		type = "offshore-pump",
		explosion = "pumpjack",
		names = { "angels-sea-pump-placeable", "angels-seafloor-pump" },
	},
	{
		triggers = { "refining" },
		type = "offshore-pump",
		explosion = "pipe",
		names = { "angels-ground-water-pump" },
	},
	{
		triggers = { "petrochem" },
		type = "furnace",
		explosion = "storage-tank",
		names = { "angels-flare-stack" },
	},
	{
		triggers = { "petrochem", "storage" },
		type = "storage-tank",
		explosion = "oil-refinery",
		names = { "angels-storage-tank-1" },
	},
	{
		triggers = { "petrochem", "storage" },
		type = "storage-tank",
		explosion = "roboport",
		names = { "angels-storage-tank-2" },
	},
	{
		triggers = { "petrochem", "storage" },
		type = "storage-tank",
		explosion = "storage-tank",
		names = { "angels-storage-tank-3", "angels-pressure-tank-1" },
	},
	{
		triggers = { "smelting" },
		type = "assembling-machine",
		explosion = "assembling-machine-1",
		names = { "angels-cooling-tower" },
	},
	{
		triggers = { "storage" },
		type = "container",
		explosion = "storage-tank",
		names = {
			"angels-silo",
			"angels-silo-coal",
			"angels-silo-ore1",
			"angels-silo-ore2",
			"angels-silo-ore3",
			"angels-silo-ore4",
			"angels-silo-ore5",
			"angels-silo-ore6",
		},
	},
	{
		triggers = { "storage" },
		type = "logistic-container",
		explosion = "storage-tank",
		names = {
			"angels-silo-active-provider",
			"angels-silo-buffer",
			"angels-silo-passive-provider",
			"angels-silo-requester",
			"angels-silo-storage",
		},
	},
	{
		triggers = { "bots" },
		type = "roboport",
		explosion = "roboport",
		names = {
			"angels-cargo-box",
			"angels-cargo-hub",
			"angels-cargo-roboport",
			"angels-charging-station",
			"angels-construction-zone-expander",
			"angels-construction-zone-expander-2",
			"angels-construction-zone-expander-3",
			"angels-relay-station",
			"angels-relay-station-2",
			"angels-relay-station-3",
			"angels-zone-expander",
			"angels-zone-expander-2",
			"angels-zone-expander-3",
		},
	},
}

---Indicates whether the entities of any trigger in the given `triggers` are reskinned.
---@param triggers string[]
---@return boolean
local function is_enabled(triggers)
	for _, trigger in pairs(triggers) do
		if reskins.angels and reskins.angels.triggers[trigger].entities then
			return true
		end
	end

	return false
end

for _, group in pairs(groups) do
	if not is_enabled(group.triggers) then
		goto continue
	end

	local Explosion = require("__reskins-assets-api__.assets.base.explosions." .. group.explosion)

	for _, name in pairs(group.names) do
		local entity = data.raw[group.type][name]
		if entity then
			Applicators.apply_corpse_and_explosion(entity, {
				corpse = _defines.generic_remnants,
				dying_explosion = Explosion.get_explosion({}),
			})
		end
	end

	::continue::
end
