-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local AdvancedChemicalPlant = require("__reskins-assets-api__.assets.angels.entities.petrochem.advanced-chemical-plant")

if not (reskins.angels and reskins.angels.triggers.petrochem.entities) then
	return
end

local entities = {
	["angels-advanced-chemical-plant"] = { tier = 1, prog_tier = 2 },
	["angels-advanced-chemical-plant-2"] = { tier = 2, prog_tier = 4 },

	-- Extended Angels
	["angels-advanced-chemical-plant-3"] = { tier = 3, prog_tier = 5 },
}

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = AdvancedChemicalPlant.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = AdvancedChemicalPlant.get_icon({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
