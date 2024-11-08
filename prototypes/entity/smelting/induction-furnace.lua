-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.entities) then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "induction-furnace",
    base_entity_name = "oil-refinery",
    mod = "angels",
    particles = { ["big-tint"] = 5, ["medium"] = 2 },
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["induction-furnace"] = { tier = 1 },
    ["induction-furnace-2"] = { tier = 2 },
    ["induction-furnace-3"] = { tier = 3 },
    ["induction-furnace-4"] = { tier = 4 },
}

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
                priority = "extra-high",
                width = 336,
                height = 381,
                frame_count = 36,
                stripes = {
                    {
                        filename = "__angelssmeltinggraphics__/graphics/entity/induction-furnace/hr-induction-furnace-base_01.png",
                        width_in_frames = 6,
                        height_in_frames = 3,
                    },
                    {
                        filename = "__angelssmeltinggraphics__/graphics/entity/induction-furnace/hr-induction-furnace-base_02.png",
                        width_in_frames = 6,
                        height_in_frames = 3,
                    },
                },
                animation_speed = 0.5,
                shift = util.by_pixel(0, -5),
                scale = 0.5,
            },
            -- Mask
            {
                priority = "extra-high",
                width = 336,
                height = 381,
                frame_count = 36,
                stripes = {
                    {
                        filename = "__reskins-angels__/graphics/entity/smelting/induction-furnace/hr-induction-furnace-mask_01.png",
                        width_in_frames = 6,
                        height_in_frames = 3,
                    },
                    {
                        filename = "__reskins-angels__/graphics/entity/smelting/induction-furnace/hr-induction-furnace-mask_02.png",
                        width_in_frames = 6,
                        height_in_frames = 3,
                    },
                },
                animation_speed = 0.5,
                tint = inputs.tint,
                shift = util.by_pixel(0, -5),
                scale = 0.5,
            },
            -- Highlights
            {
                priority = "extra-high",
                width = 336,
                height = 381,
                frame_count = 36,
                stripes = {
                    {
                        filename = "__reskins-angels__/graphics/entity/smelting/induction-furnace/hr-induction-furnace-highlights_01.png",
                        width_in_frames = 6,
                        height_in_frames = 3,
                    },
                    {
                        filename = "__reskins-angels__/graphics/entity/smelting/induction-furnace/hr-induction-furnace-highlights_02.png",
                        width_in_frames = 6,
                        height_in_frames = 3,
                    },
                },
                animation_speed = 0.5,
                blend_mode = reskins.lib.settings.blend_mode,
                shift = util.by_pixel(0, -5),
                scale = 0.5,
            },
            -- Shadow
            {
                priority = "extra-high",
                width = 429,
                height = 336,
                frame_count = 36,
                stripes = {
                    {
                        filename = "__angelssmeltinggraphics__/graphics/entity/induction-furnace/hr-induction-furnace-shadow_01.png",
                        width_in_frames = 3,
                        height_in_frames = 6,
                    },
                    {
                        filename = "__angelssmeltinggraphics__/graphics/entity/induction-furnace/hr-induction-furnace-shadow_02.png",
                        width_in_frames = 3,
                        height_in_frames = 6,
                    },
                },
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(23, 8.5),
                scale = 0.5,
            },
        },
    }

    -- Label to skip to next iteration
    ::continue::
end
