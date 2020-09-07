-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Core functions
require("prototypes.functions")

-- Compatibility with ShinyAngelGFX (requires must be done in data-updates)
if mods["ShinyAngelGFX"] then return end

-- No ShinyBobGFX, so conduct requires in data
require("shiny-angel-compatibility")