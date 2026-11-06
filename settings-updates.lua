-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Hide the chemical furnace color setting of Artisanal Reskins: Bob's Mods, because Angel's Smelting hides the chemical
-- furnaces of Bob's mods.
if mods["angelssmelting"] then
	local setting = data.raw["color-setting"]["reskins-bobs-chemical-furnace-color"]
	if setting then
		setting.hidden = true
	end
end
