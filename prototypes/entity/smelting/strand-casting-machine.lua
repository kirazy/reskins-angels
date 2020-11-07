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
    icon_name = "strand-casting-machine",
    base_entity = "oil-refinery",
    mod = "angels",
    particles = {["big-tint"] = 5, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["strand-casting-machine"] = {tier = 1, prog_tier = 2},
    ["strand-casting-machine-2"] = {tier = 2, prog_tier = 3},
    ["strand-casting-machine-3"] = {tier = 3, prog_tier = 4},
    ["strand-casting-machine-4"] = {tier = 4, prog_tier = 5},
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
    entity.animation = nil

    entity.working_visualisations = {
        -- Idle state
        {
            always_draw = true,
            animation = {
                layers = {
                    -- Idle State
                    {
                        filename = "__angelssmelting__/graphics/entity/strand-casting-machine/strand-casting-machine-idle-state.png",
                        priority = "high",
                        width = 167,
                        height = 197,
                        shift = util.by_pixel(0, -16.5),
                        hr_version = {
                            filename = "__angelssmelting__/graphics/entity/strand-casting-machine/hr-strand-casting-machine-idle-state.png",
                            priority = "high",
                            width = 329,
                            height = 392,
                            shift = util.by_pixel(0, -16.5),
                            scale = 0.5,
                        }
                    },
                    -- Shadow
                    {
                        filename = "__angelssmelting__/graphics/entity/strand-casting-machine/strand-casting-machine-shadow.png",
                        priority = "high",
                        width = 223,
                        height = 157,
                        draw_as_shadow = true,
                        shift = util.by_pixel(29.5, 3.5),
                        hr_version = {
                            filename = "__angelssmelting__/graphics/entity/strand-casting-machine/hr-strand-casting-machine-shadow.png",
                            priority = "high",
                            width = 444,
                            height = 311,
                            draw_as_shadow = true,
                            shift = util.by_pixel(29.5, 3.5),
                            scale = 0.5,
                        }
                    }
                }
            }
        },

        -- Recipe Mask
        {
            apply_recipe_tint = "primary",
            always_draw = true,
            animation = {
                filename = "__angelssmelting__/graphics/entity/strand-casting-machine/strand-casting-machine-recipe-mask.png",
                priority = "high",
                width = 167,
                height = 197,
                shift = util.by_pixel(0, -16.5),
                hr_version = {
                    filename = "__angelssmelting__/graphics/entity/strand-casting-machine/hr-strand-casting-machine-recipe-mask.png",
                    priority = "high",
                    width = 329,
                    height = 392,
                    shift = util.by_pixel(0, -16.5),
                    scale = 0.5,
                }
            },
        },

        -- Animation
        {
            fadeout = true,
            animation = {
                filename = "__angelssmelting__/graphics/entity/strand-casting-machine/strand-casting-machine-working-animation.png",
                priority = "high",
                width = 167,
                height = 197,
                line_length = 6,
                frame_count = 24,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -16.5),
                hr_version = {
                    filename = "__angelssmelting__/graphics/entity/strand-casting-machine/hr-strand-casting-machine-working-animation.png",
                    priority = "high",
                    width = 329,
                    height = 392,
                    line_length = 6,
                    frame_count = 24,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -16.5),
                    scale = 0.5,
                }
            }
        },

        -- Color Mask
        {
            always_draw = true,
            animation = {
                layers = {
                    -- Mask
                    {
                        filename = reskins.angels.directory.."/graphics/entity/smelting/strand-casting-machine/strand-casting-machine-mask.png",
                        priority = "high",
                        width = 167,
                        height = 197,
                        shift = util.by_pixel(0, -16.5),
                        tint = inputs.tint,
                        hr_version = {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/strand-casting-machine/hr-strand-casting-machine-mask.png",
                            priority = "high",
                            width = 329,
                            height = 392,
                            shift = util.by_pixel(0, -16.5),
                            tint = inputs.tint,
                            scale = 0.5,
                        }
                    },
                    -- Highlights
                    {
                        filename = reskins.angels.directory.."/graphics/entity/smelting/strand-casting-machine/strand-casting-machine-highlights.png",
                        priority = "high",
                        width = 167,
                        height = 197,
                        shift = util.by_pixel(0, -16.5),
                        blend_mode = reskins.lib.blend_mode,
                        hr_version = {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/strand-casting-machine/hr-strand-casting-machine-highlights.png",
                            priority = "high",
                            width = 329,
                            height = 392,
                            shift = util.by_pixel(0, -16.5),
                            blend_mode = reskins.lib.blend_mode,
                            scale = 0.5,
                        }
                    }
                }
            }
        },

        -- Light
        {
            draw_as_sprite = false,
            draw_as_light = true,
            animation = {
                filename = "__angelssmelting__/graphics/entity/strand-casting-machine/strand-casting-machine-light.png",
                priority = "high",
                width = 167,
                height = 197,
                shift = util.by_pixel(0, -16.5),
                hr_version = {
                    filename = "__angelssmelting__/graphics/entity/strand-casting-machine/hr-strand-casting-machine-light.png",
                    priority = "high",
                    width = 329,
                    height = 392,
                    shift = util.by_pixel(0, -16.5),
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end