-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local OreRefinery = require("__reskins-assets-api__.assets.angels.entities.refining.ore-refinery")

if not (reskins.angels and reskins.angels.triggers.refining.entities) then
	return
end

local entities = {
	["angels-ore-refinery"] = { tier = 1, prog_tier = 4 },
	["angels-ore-refinery-2"] = { tier = 2, prog_tier = 5 },

	-- Extended Angels
	["angels-ore-refinery-3"] = { tier = 3, prog_tier = 6 },
}

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = OreRefinery.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = OreRefinery.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
