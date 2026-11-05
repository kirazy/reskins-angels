-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local HydroPlant = require("__reskins-assets-api__.assets.angels.entities.refining.hydro-plant")

if not (reskins.angels and reskins.angels.triggers.refining.entities) then
	return
end

local entities = {
	["angels-hydro-plant"] = { tier = 1 },
	["angels-hydro-plant-2"] = { tier = 2 },
	["angels-hydro-plant-3"] = { tier = 3 },
	["angels-hydro-plant-4"] = { tier = 4 }, -- Extended Angels
}

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = HydroPlant.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = HydroPlant.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
