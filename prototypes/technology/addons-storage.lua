-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

if not mods["angelsaddons-storage"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.angels.technologies.icons")

_framework.tiers.assign_icons_with_tier_labels("technology", {
	-- Reskin warehouse technologies
	["angels-logistic-warehouses"] = { icon_data = Icons.get_logistic_warehouses_icon() },
	["angels-warehouses"] = { icon_data = Icons.get_warehouses_icon() },
})
