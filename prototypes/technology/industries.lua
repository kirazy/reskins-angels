-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

if not mods["angelspetrochem"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.angels.technologies.icons")

_framework.tiers.assign_icons_with_tier_labels("technology", {
	-- Nuclear
	["angels-thorium-power"] = { icon_data = Icons.get_thorium_power_icon() },
})
