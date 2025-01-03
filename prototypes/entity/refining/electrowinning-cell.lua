-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.entities) then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "electrowinning-cell",
    base_entity_name = "assembling-machine-1",
    mod = "angels",
    particles = { ["big"] = 1, ["medium"] = 2 },
    group = "refining",
    make_remnants = false,
}

local tier_map = {
    ["electro-whinning-cell"] = { tier = 1, prog_tier = 3 },
    ["electro-whinning-cell-2"] = { tier = 2, prog_tier = 4 },
    ["electro-whinning-cell-3"] = { tier = 3, prog_tier = 5 },
}

if reskins.lib.version.is_same_or_newer(mods["angelsrefining"], "0.12.5") then
    tier_map["electro-whinning-cell"].prog_tier = 4
    tier_map["electro-whinning-cell-2"].prog_tier = 5
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    ---@type data.AssemblingMachinePrototype
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tiers.get_tint(tier)

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.graphics_set.animation = {
        layers = {
            -- Base
            {
                filename = "__angelsrefininggraphics__/graphics/entity/electro-whinning-cell/electro-whinning-cell.png",
                priority = "extra-high",
                width = 224,
                height = 224,
                frame_count = 36,
                line_length = 6,
                shift = { 0, 0 },
                animation_speed = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-angels__/graphics/entity/refining/electrowinning-cell/electrowinning-cell-mask.png",
                priority = "extra-high",
                width = 224,
                height = 224,
                repeat_count = 36,
                shift = { 0, 0 },
                animation_speed = 0.5,
                tint = inputs.tint,
            },
            -- Highlights
            {
                filename = "__reskins-angels__/graphics/entity/refining/electrowinning-cell/electrowinning-cell-highlights.png",
                priority = "extra-high",
                width = 224,
                height = 224,
                repeat_count = 36,
                shift = { 0, 0 },
                animation_speed = 0.5,
                blend_mode = reskins.lib.settings.blend_mode,
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
