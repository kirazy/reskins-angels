-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Hide chemical furnace color setting, as Angel's Smelting disables these
if mods["angelssmelting"] then
	reskins.lib.setting_override("string-setting", "reskins-bobs-chemical-furnace-color")
end
