-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
-- if reskins.lib.setting("reskins-bobs-do-angelssmelting") == false then return end

-- Setup standard inputs
local inputs = {
    directory = reskins.angels.directory,
    mod = "angels",
    group = "smelting",
    technology_icon_size = 256,
    technology_icon_mipmaps = 2,
    technology_icon_layers = 1,
}

local technologies = {
    ["strand-casting-1"] = {tier = 1, icon_name = "strand-casting"},
    ["strand-casting-2"] = {tier = 2, icon_name = "strand-casting"},
    ["strand-casting-3"] = {tier = 3, icon_name = "strand-casting"},
    ["strand-casting-4"] = {tier = 4, icon_name = "strand-casting"},
    ["powder-metallurgy-1"] = {tier = 1, icon_name = "powder-metallurgy"},
    ["powder-metallurgy-2"] = {tier = 2, icon_name = "powder-metallurgy"},
    ["powder-metallurgy-3"] = {tier = 3, icon_name = "powder-metallurgy"},
    ["powder-metallurgy-4"] = {tier = 4, icon_name = "powder-metallurgy"},
}

reskins.lib.create_icons_from_list(technologies, inputs)