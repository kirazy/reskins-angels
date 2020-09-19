-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
if reskins.lib.setting("reskins-angels-do-angelssmelting") == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "ore-processing-machine",
    base_entity = "assembling-machine-1",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["ore-processing-machine"] = {tier = 1},
    ["ore-processing-machine-2"] = {tier = 2},
    ["ore-processing-machine-3"] = {tier = 3},
    ["ore-processing-machine-4"] = {tier = 4},
}

local dust = {
    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-dust.png",
    priority = "high",
    width = 36,
    height = 57,
    line_length = 5,
    frame_count = 20,
    animation_speed = 0.40,
    shift = util.by_pixel(0, -15),
    hr_version = {
        filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-dust.png",
        priority = "high",
        width = 107,
        height = 170,
        line_length = 5,
        frame_count = 20,
        animation_speed = 0.40,
        shift = util.by_pixel(0, -21.5),
        scale = 0.5,
    }
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index["tier-"..tier]

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-base.png",
                priority = "high",
                width = 100,
                height = 105,
                line_length = 5,
                frame_count = 25,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -3),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-base.png",
                    priority = "high",
                    width = 196,
                    height = 206,
                    line_length = 5,
                    frame_count = 25,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.5, -2 ),
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-mask.png",
                priority = "high",
                width = 100,
                height = 105,
                line_length = 5,
                frame_count = 25,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -3),
                tint = inputs.tint,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-mask.png",
                    priority = "high",
                    width = 196,
                    height = 206,
                    line_length = 5,
                    frame_count = 25,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.5, -2 ),
                    tint = inputs.tint,
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-highlights.png",
                priority = "high",
                width = 100,
                height = 105,
                line_length = 5,
                frame_count = 25,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -3),
                blend_mode = reskins.lib.blend_mode,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-highlights.png",
                    priority = "high",
                    width = 196,
                    height = 206,
                    line_length = 5,
                    frame_count = 25,
                    animation_speed = 0.5,
                    shift = util.by_pixel(-0.5, -2 ),
                    blend_mode = reskins.lib.blend_mode,
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-shadow.png",
                priority = "high",
                width = 122,
                height = 70,
                repeat_count = 25,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(13, 16),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-shadow.png",
                    priority = "high",
                    width = 243,
                    height = 137,
                    repeat_count = 25,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(12.5, 16),
                    scale = 0.5,
                }
            },
        }
    }

    entity.working_visualisations = {
        -- Dust
        {
            fade_out = true,
            constant_speed = true,
            animation = dust,
        },

        -- Dust Tinted
        {
            apply_recipe_tint = "primary",
            fade_out = true,
            constant_speed = true,
            animation = dust,
        },

        -- Machine Top
        {
            always_draw = true,
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-top.png",
                priority = "high",
                width = 97,
                height = 71,
                shift = util.by_pixel(0, -23),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-top.png",
                    priority = "high",
                    width = 192,
                    height = 139,
                    shift = util.by_pixel(0, -22.5),
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end