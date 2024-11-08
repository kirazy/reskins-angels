-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.entities) then return end

---@type ConstructIconInputsOld
local inputs = {
    type = "mining-drill",
    icon_name = "thermal-extractor",
    mod = "angels",
    group = "refining",
}

-- Setup defaults.
reskins.lib.set_inputs_defaults(inputs)

local tier_map = {
    ["thermal-bore"] = { tier = 1, prog_tier = 2 },
    ["thermal-extractor"] = { tier = 2, prog_tier = 3 },
}

for name, map in pairs(tier_map) do
    local tier = map.tier
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    inputs.tint = map.tint or reskins.lib.tiers.get_tint(tier)

    reskins.lib.construct_icon(name, tier, inputs)
end
