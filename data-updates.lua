-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

----------------------------------------------------------------------------------------------------
-- ENTITIES
----------------------------------------------------------------------------------------------------
require("prototypes.entity.petrochem-updates")

-- Angel's Smelting
require("prototypes.entity.smelting.pipe")

-- Angel's Refining
require("prototypes.entity.refining.liquefier")

----------------------------------------------------------------------------------------------------
-- ITEMS
----------------------------------------------------------------------------------------------------
require("prototypes.items.refining-updates")
require("prototypes.items.smelting.ores")

-- angelspetrochem at this version or earlier do icon work in data-final-fixes
if reskins.lib.version.is_newer(mods["angelspetrochem"], "0.9.19") then
	require("prototypes.items.petrochem")
	require("prototypes.items.petrochem.sulfur")
end

-- angelssmelting at this version or earlier does icon work in data-final-fixes
if reskins.lib.version.is_newer(mods["angelssmelting"], "0.6.16") then
	require("prototypes.items.smelting-updates")
end

-- Second pass
require("prototypes.items.refining-secondary-updates")

----------------------------------------------------------------------------------------------------
-- TECHNOLOGY
----------------------------------------------------------------------------------------------------
-- require("prototypes.technology.refining-updates")
require("prototypes.technology.smelting-updates")

----------------------------------------------------------------------------------------------------
-- GUI Modifications
----------------------------------------------------------------------------------------------------
-- FIXME: This is a temporary disablement of the item group icons, until new ones are created.
-- require("prototypes.item-group.item-group")
