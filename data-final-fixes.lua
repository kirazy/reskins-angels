-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

----------------------------------------------------------------------------------------------------
-- ITEMS
----------------------------------------------------------------------------------------------------
-- angelspetrochem at this version or earlier do icon work in data-final-fixes
if reskins.lib.version.is_same_or_older(mods["angelspetrochem"], "0.9.19") then
	require("prototypes.items.petrochem")
	require("prototypes.items.petrochem.sulfur")
end

-- angelssmelting at this version or earlier does icon work in data-final-fixes
if reskins.lib.version.is_same_or_older(mods["angelssmelting"], "0.6.16") then
	require("prototypes.items.smelting")
end

----------------------------------------------------------------------------------------------------
-- RECIPE ADJUSTMENTS
----------------------------------------------------------------------------------------------------
-- Recipe adjustments
require("prototypes.recipe-adjustments.refining.clarifier")
require("prototypes.recipe-adjustments.refining.ore-flotation-cell")

----------------------------------------------------------------------------------------------------
-- TECHNOLOGY
----------------------------------------------------------------------------------------------------
-- require("prototypes.technology.smelting-final-fixes")
