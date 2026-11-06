-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local RefugiumFish = require("__reskins-assets-api__.assets.angels.entities.bioprocessing.refugium-fish")

if not (reskins.angels and reskins.angels.triggers.bioprocessing.entities) then
	return
end

-- Artisanal Reskins: Compatibility reskins the tiers of this building that Extended Angel's adds.
if mods["extendedangels"] and mods["reskins-compatibility"] then
	return
end

local entities = {
	["angels-bio-refugium-fish"] = {},
}

local TYPE = "assembling-machine"

for name in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local sprite_set = RefugiumFish.get_sprite_set({})
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = RefugiumFish.get_icon_composition({})
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
