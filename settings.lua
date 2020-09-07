-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Core settings
data:extend({
    {
        type = "bool-setting",
        name = "reskins-angels-use-angels-tier-colors",
        setting_type = "startup",
        order = "a",
        default_value = false,
        hidden = true,
    }
})

-- Settings available based on mod loadout
if mods["angelsbioprocessing"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsbioprocessing",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["angelsexploration"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsexploration",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["angelsindustries"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsindustries",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["angelspetrochem"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelspetrochem",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["angelsrefining"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsrefining",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["angelssmelting"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelssmelting",
            setting_type = "startup",
            default_value = true,
        }
    })
end

if mods["angelsaddons-cab"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsaddons-cab",
            setting_type = "startup",
            default_value = true,
        }
    })
end

-- Handle Mobility vs deprecated individual mobility mods
if mods["angelsaddons-mobility"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsaddons-mobility",
            setting_type = "startup",
            default_value = true,
        }
    })
else
    if mods["angelsaddons-crawlertrain"] then
        data:extend({
            {
                type = "bool-setting",
                name = "reskins-angels-do-angelsaddons-crawlertrain",
                setting_type = "startup",
                default_value = true,
            }
        })
    end

    if mods["angelsaddons-petrotrain"] then
        data:extend({
            {
                type = "bool-setting",
                name = "reskins-angels-do-angelsaddons-petrotrain",
                setting_type = "startup",
                default_value = true,
            }
        })
    end

    if mods["angelsaddons-smeltingtrain"] then
        data:extend({
            {
                type = "bool-setting",
                name = "reskins-angels-do-angelsaddons-smeltingtrain",
                setting_type = "startup",
                default_value = true,
            }
        })
    end
end

-- Handle Storage vs deprecated individual storage mods
if mods["angelsaddons-storage"] then
    data:extend({
        {
            type = "bool-setting",
            name = "reskins-angels-do-angelsaddons-storage",
            setting_type = "startup",
            default_value = true,
        }
    })
else
    if mods["angelsaddons-oresilos"] then
        data:extend({
            {
                type = "bool-setting",
                name = "reskins-angels-do-angelsaddons-oresilos",
                setting_type = "startup",
                default_value = true,
            }
        })
    end

    if mods["angelsaddons-pressuretanks"] then
        data:extend({
            {
                type = "bool-setting",
                name = "reskins-angels-do-angelsaddons-pressuretanks",
                setting_type = "startup",
                default_value = true,
            }
        })
    end

    if mods["angelsaddons-warehouses"] then
        data:extend({
            {
                type = "bool-setting",
                name = "reskins-angels-do-angelsaddons-warehouses",
                setting_type = "startup",
                default_value = true,
            }
        })
    end
end