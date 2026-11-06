-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local ThermalExtractor = require("__reskins-assets-api__.assets.angels.entities.refining.thermal-extractor")

if not mods["angelsrefining"] then
	return
end

local entities = {
	["angels-thermal-bore"] = { tier = 1, prog_tier = 2 },
	["angels-thermal-extractor"] = { tier = 2, prog_tier = 3 },
}

local TYPE = "mining-drill"

for name, options in pairs(entities) do
	local entity = data.raw[TYPE][name]
	if not entity then
		goto continue
	end

	local tier = _framework.tiers.get_tier(options)
	local tint = _framework.tiers.get_tint(tier)

	local composition = ThermalExtractor.get_icon_composition({ tint = tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
