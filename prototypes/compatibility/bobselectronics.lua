-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["bobelectronics"] then return end
if reskins.lib.settings.get_value("reskins-bobs-do-bobelectronics-circuit-style") == "off" and reskins.lib.settings.get_value("reskins-compatibility-do-circuitprocessing-circuit-style") == "off" then return end

local shift, scale = reskins.angels.constants.recipe_corner_shift, reskins.angels.constants.recipe_corner_scale

-- A map of recipe names to the icon sources used to create a combined icon.
-- The first entry in each IconSources is the first layer of the created icon.
---@type { [string]: IconSources }
local recipe_icon_source_map = {
	-- Fix fibreglass board
	["angels-glass-fiber-board"] = {
		{ name = "fibreglass-board", type_name = "item" },
		{ name = "angels-coil-glass-fiber", type_name = "item", scale = scale, shift = shift },
	},
}

reskins.lib.icons.create_and_assign_combined_icons_from_sources_to_recipe(recipe_icon_source_map)
