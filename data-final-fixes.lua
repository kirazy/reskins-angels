-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--     
-- See LICENSE.md in the project directory for license information.

----------------------------------------------------------------------------------------------------
-- DEFERRED ICON ASSIGNMENTS
----------------------------------------------------------------------------------------------------
-- Item Icons
if reskins.angels.icons and reskins.angels.icons["data-final-fixes"] then
    for name, inputs in pairs(reskins.angels.icons["data-final-fixes"]) do
        reskins.lib.assign_icons(name, inputs)
    end
end

-- Technology Icons
if reskins.angels.technology and reskins.angels.technology["data-final-fixes"] then
    for name, inputs in pairs(reskins.angels.technology["data-final-fixes"]) do
        reskins.lib.assign_technology_icons(name, inputs)
    end
end