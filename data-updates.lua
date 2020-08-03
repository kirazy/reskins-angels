-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Compatibility with ShinyAngelGFX
if mods["ShinyAngelGFX"] then
    require("shiny-angel-compatibility")
end

----------------------------------------------------------------------------------------------------
-- DEFERRED ICON ASSIGNMENTS
----------------------------------------------------------------------------------------------------
-- Item Icons
if reskins.angels.icons and reskins.angels.icons["data-updates"] then
    for name, inputs in pairs(reskins.angels.icons["data-updates"]) do
        reskins.lib.assign_icons(name, inputs)
    end
end

-- Technology Icons
if reskins.angels.technology and reskins.angels.technology["data-updates"] then
    for name, inputs in pairs(reskins.angels.technology["data-updates"]) do
        reskins.lib.assign_technology_icons(name, inputs)
    end
end