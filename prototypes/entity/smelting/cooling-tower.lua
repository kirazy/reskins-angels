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
    icon_name = "cooling-tower",
    base_entity = "chemical-plant",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "smelting",
    tint = util.color("f5f4f4"),
    icon_layers = 1,
    make_remnants = false,
}

local entity = data.raw[inputs.type]["cooling-tower"]

-- Check if entity exists, if not, return
if not entity then return end

-- TODO: Come back and do more complex particle creation handling, perhaps when we overhaul the explosion/particle system

-- Setup the cooling tower
reskins.lib.setup_standard_entity("cooling-tower", 0, inputs)

-- Reskin the cooling tower
entity.animation = reskins.lib.make_4way_animation_from_spritesheet({
    layers = {
        -- Base
        {
            filename = "__angelssmelting__/graphics/entity/cooling-tower/cooling-tower.png",
            priority = "high",
            width = 108,
            height = 157,
            shift = util.by_pixel(0, -19),
            hr_version = {
                filename = "__angelssmelting__/graphics/entity/cooling-tower/hr-cooling-tower.png",
                priority = "high",
                width = 213,
                height = 309,
                shift = util.by_pixel(0, -18.5),
                scale = 0.5,
            }
        },
        -- Shadow
        {
            filename = "__angelssmelting__/graphics/entity/cooling-tower/cooling-tower-shadow.png",
            priority = "high",
            width = 160,
            height = 100,
            shift = util.by_pixel(28, 10),
            draw_as_shadow = true,
            hr_version = {
                filename = "__angelssmelting__/graphics/entity/cooling-tower/hr-cooling-tower-shadow.png",
                priority = "high",
                width = 320,
                height = 197,
                shift = util.by_pixel(28, 9),
                draw_as_shadow = true,
                scale = 0.5,
            }
        }
    }
})

-- Setup the fan animation
entity.working_visualisations = {
    -- Idle state
    {
        always_draw = true,
        animation = {
            filename = "__angelssmelting__/graphics/entity/cooling-tower/fan-animation.png",
            priority = "high",
            width = 36,
            height = 32,
            shift = util.by_pixel(0, -74),
            hr_version = {
                filename = "__angelssmelting__/graphics/entity/cooling-tower/hr-fan-animation.png",
                priority = "high",
                width = 69,
                height = 60,
                shift = util.by_pixel(0, -74.5),
                scale = 0.5,
            }
        }
    },

    -- Working state
    {
        animation = {
            filename = "__angelssmelting__/graphics/entity/cooling-tower/fan-animation.png",
            priority = "high",
            width = 36,
            height = 32,
            line_length = 5,
            frame_count = 25,
            animation_speed = 2.4, -- 60 fps
            shift = util.by_pixel(0, -74),
            hr_version = {
                filename = "__angelssmelting__/graphics/entity/cooling-tower/hr-fan-animation.png",
                priority = "high",
                width = 69,
                height = 60,
                line_length = 5,
                frame_count = 25,
                animation_speed = 2.4, -- 60 fps
                shift = util.by_pixel(0, -74.5),
                scale = 0.5,
            }
        }
    },

    -- Vertical Pipe Shadow Patch
    {
        always_draw = true,
        north_animation = reskins.angels.vertical_pipe_shadow({1, -1}),
        south_animation = reskins.angels.vertical_pipe_shadow({1, -1}),
    },
}