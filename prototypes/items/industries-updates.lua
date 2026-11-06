-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.petrochem.items) then
	return
end

if not mods["angelspetrochem"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Isotopes = require("__reskins-assets-api__.assets.angels.items.isotopes")

-- Angel's Petrochem gives the isotopes of Bob's mods the icons of its own isotopes in data-updates, so they are
-- assigned again here. The assignment in the data stage stays, since the recycling recipes take their icons in
-- between.
_framework.tiers.assign_icons_with_tier_labels("item", {
	["bob-plutonium-239"] = { composition = Isotopes.get_icon_composition({ isotope = "plutonium-240" }) },
	["bob-thorium-232"] = { composition = Isotopes.get_icon_composition({ isotope = "thorium-232" }) },
})
