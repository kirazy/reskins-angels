-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

if not (mods["bobelectronics"] and reskins.lib.setting("reskins-bobs-do-bobelectronics-circuits")) then return end
local shift, scale = reskins.angels.constants.recipe_corner_shift, reskins.angels.constants.recipe_corner_scale

-- Fix fibreglass board
local composite_recipes = {
    ["angels-glass-fiber-board"] = {["fibreglass-board"] = {}, ["angels-coil-glass-fiber"] = {shift = shift, scale = scale}},
}

for name, sources in pairs(composite_recipes) do
    reskins.lib.composite_existing_icons(name, "recipe", sources)
end