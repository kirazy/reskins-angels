-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local SinteringOven = require("__reskins-assets-api__.assets.angels.entities.smelting.sintering-oven")

if not (reskins.angels and reskins.angels.triggers.smelting.entities) then
	return
end

-- This file is loaded in data-updates. When sintering ovens 1, 2, and 3 are hidden, Angel's Smelting replaces the icons
-- of sintering ovens 4 and 5 in data-updates.
--
-- Sintering ovens 1, 2, and 3 are reskinned with their own tiers when they are hidden, since they still show in the
-- editor, and sintering ovens 4 and 5 take the tiers 1 and 2 of the numbers that Angel's Smelting gives them.
local entities = {
	["angels-sintering-oven"] = { tier = 1, prog_tier = 1 },
	["angels-sintering-oven-2"] = { tier = 2, prog_tier = 2 },
	["angels-sintering-oven-3"] = { tier = 3, prog_tier = 3 },
}

if angelsmods.trigger.early_sintering_oven then
	entities["angels-sintering-oven-4"] = { tier = 4, prog_tier = 4 }
	entities["angels-sintering-oven-5"] = { tier = 5, prog_tier = 5 }
else
	entities["angels-sintering-oven-4"] = { tier = 1, prog_tier = 4 }
	entities["angels-sintering-oven-5"] = { tier = 2, prog_tier = 5 }
end

local TYPE = "assembling-machine"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local sprite_set = SinteringOven.get_sprite_set({ tint = tint })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = SinteringOven.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
