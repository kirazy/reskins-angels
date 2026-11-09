-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data

-- The `util` global is not available during the settings stage and must be imported.
local util = require("util")
local _settings = require("__reskins-framework__.api.settings-utils")

-- Hide the chemical furnace color setting of Artisanal Reskins: Bob's Mods, because Angel's Smelting hides the chemical
-- furnaces of Bob's mods.
if mods["angelssmelting"] then
	local setting = data.raw["color-setting"]["reskins-bobs-chemical-furnace-color"]
	if setting then
		setting.hidden = true
	end
end

_settings.set_default_tier_color(4, util.color("#b459ff"))
_settings.set_default_tier_color(5, util.color("#67e55c"))
_settings.set_default_tier_color(6, util.color("#ff8533"))
