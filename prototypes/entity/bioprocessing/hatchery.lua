-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Hatchery = require("__reskins-assets-api__.assets.angels.entities.bioprocessing.hatchery")

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.bioprocessing.entities) then
	return
end

-- Artisanal Reskins: Compatibility reskins the tiers of this building that Extended Angel's adds.
if mods["extendedangels"] and mods["reskins-compatibility"] then
	return
end

local entities = {
	["angels-bio-hatchery"] = {},
}

local TYPE = "furnace"

for name in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local sprite_set = Hatchery.get_sprite_set({})
	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_data = Hatchery.get_icon({})
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		icon_data = icon_data,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
