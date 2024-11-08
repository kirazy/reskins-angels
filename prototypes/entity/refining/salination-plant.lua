-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.refining.entities) then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "salination-plant",
    base_entity_name = "assembling-machine-1",
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "refining",
    make_remnants = false,
}

local tier_map = {
    ["salination-plant"] = {tier = 1, prog_tier = 3},
    ["salination-plant-2"] = {tier = 2, prog_tier = 4},

    -- Extended Angels
    ["salination-plant-3"] = {tier = 3, prog_tier = 5},
}

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
                filename = "__angelsrefining__/graphics/entity/salination-plant/hr-salination-plant-base.png",
                priority = "extra-high",
                width = 484,
                height = 540,
                frame_count = 36,
                line_length = 6,
                shift = util.by_pixel(-2.5, -12),
                animation_speed = 0.5,
                scale = 0.5,
            },
            -- Mask
            {
                filename = "__reskins-angels__/graphics/entity/refining/salination-plant/hr-salination-plant-mask.png",
                priority = "extra-high",
                width = 484,
                height = 540,
                repeat_count = 36,
                shift = util.by_pixel(-2.5, -12),
                tint = inputs.tint,
                animation_speed = 0.5,
                scale = 0.5,
            },
            -- Highlights
            {
                filename = "__reskins-angels__/graphics/entity/refining/salination-plant/hr-salination-plant-highlights.png",
                priority = "extra-high",
                width = 484,
                height = 540,
                repeat_count = 36,
                shift = util.by_pixel(-2.5, -12),
                blend_mode = reskins.lib.settings.blend_mode,
                animation_speed = 0.5,
                scale = 0.5,
            },
            -- Shadow
            {
                filename = "__angelsrefining__/graphics/entity/salination-plant/hr-salination-plant-shadow.png",
                priority = "extra-high",
                width = 509,
                height = 467,
                repeat_count = 36,
                shift = util.by_pixel(10, 6.5),
                draw_as_shadow = true,
                animation_speed = 0.5,
                scale = 0.5,
            },
        }
    }

    -- Label to skip to next iteration
    ::continue::
end