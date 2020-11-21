-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check if reskinning needs to be done

local triggers = {}

-- Angel's Industries
triggers.industries = {
    big_chests = reskins.lib.setting("reskins-angels-do-angelsindustries"),
}

-- Angel's Petrochem

-- Angel's Smelting

-- Angel's Addons - Mobility and related deprecated mods
triggers.mobility = {
    crawler_train = reskins.lib.setting("reskins-angels-do-angelsaddons-mobility") or reskins.lib.setting("reskins-angels-do-angelsaddons-crawlertrain"),
    petro_train = reskins.lib.setting("reskins-angels-do-angelsaddons-mobility") or reskins.lib.setting("reskins-angels-do-angelsaddons-petrotrain"),
    smelting_train = reskins.lib.setting("reskins-angels-do-angelsaddons-mobility") or reskins.lib.setting("reskins-angels-do-angelsaddons-smeltingtrain"),
}

-- Angel's Addons - Storage and related deprecated mods
triggers.storage = {
    warehouses = reskins.lib.setting("reskins-angels-do-angelsaddons-storage") or reskins.lib.setting("reskins-angels-do-angelsaddons-warehouses"),
    silos = reskins.lib.setting("reskins-angels-do-angelsaddons-storage") or reskins.lib.setting("reskins-angels-do-angelsaddons-silos"),
    pressure_tanks = reskins.lib.setting("reskins-angels-do-angelsaddons-storage") or reskins.lib.setting("reskins-angels-do-angelsaddons-pressuretanks"),
}

return triggers