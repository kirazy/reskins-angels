-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.entities) then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "pellet-press",
    base_entity_name = "assembling-machine-1",
    mod = "angels",
    particles = { ["big"] = 1, ["medium"] = 2 },
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["pellet-press"] = { tier = 1 },
    ["pellet-press-2"] = { tier = 2 },
    ["pellet-press-3"] = { tier = 3 },
    ["pellet-press-4"] = { tier = 4 },
}

-- Support rework of Angel's Smelting ingredient tiers
if reskins.lib.version.is_same_or_newer(mods["angelssmelting"], "0.6.20") then
    tier_map["pellet-press"].prog_tier = 3
    tier_map["pellet-press-2"].prog_tier = 4
    tier_map["pellet-press-3"].prog_tier = 5
    tier_map["pellet-press-4"].prog_tier = 6
end

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
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
    entity.animation = {
        layers = {
            -- Base
            {
                filename = "__angelssmelting__/graphics/entity/pellet-press/hr-pellet-press-base.png",
                priority = "extra-high",
                width = 200,
                height = 199,
                line_length = 10,
                frame_count = 60,
                animation_speed = 0.5,
                shift = util.by_pixel(0, 0),
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-angels__/graphics/entity/smelting/pellet-press/hr-pellet-press-mask.png",
                priority = "extra-high",
                width = 200,
                height = 199,
                line_length = 10,
                frame_count = 60,
                animation_speed = 0.5,
                shift = util.by_pixel(0, 0),
                tint = inputs.tint,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-angels__/graphics/entity/smelting/pellet-press/hr-pellet-press-highlights.png",
                priority = "extra-high",
                width = 200,
                height = 199,
                line_length = 10,
                frame_count = 60,
                animation_speed = 0.5,
                shift = util.by_pixel(0, 0),
                blend_mode = reskins.lib.settings.blend_mode,
                scale = 0.5,
            },
            -- Shadow
            {
                filename = "__angelssmelting__/graphics/entity/pellet-press/hr-pellet-press-shadow.png",
                priority = "extra-high",
                width = 246,
                height = 132,
                line_length = 6,
                frame_count = 60,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(12, 17),
                scale = 0.5,
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
