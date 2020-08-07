-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Pure Angels uses 4 tiers (for now?), so hide extra color settings
local function hide_setting(setting_type, setting_name, setting_default)
    if data.raw[setting_type] and data.raw[setting_type][setting_name] then
        data.raw[setting_type][setting_name].hidden = true
        if setting_default ~= nil then
            data.raw[setting_type][setting_name].default_value = setting_default
        end
    end
end

if not mods["boblibrary"] then
    hide_setting("string-setting", "reskins-lib-custom-colors-tier-0")
    hide_setting("string-setting", "reskins-lib-custom-colors-tier-5")
end

-- 595959
-- 2957cc
-- cc2929
-- ccae29