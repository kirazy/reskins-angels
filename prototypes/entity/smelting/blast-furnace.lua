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
    icon_name = "blast-furnace",
    base_entity = "oil-refinery",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big-tint"] = 5, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["blast-furnace"] = {tier = 1},
    ["blast-furnace-2"] = {tier = 2},
    ["blast-furnace-3"] = {tier = 3},
    ["blast-furnace-4"] = {tier = 4},
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
                filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/blast-furnace-base.png",
                priority = "high",
                width = 164,
                height = 189,
                shift = util.by_pixel(0, -14),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/hr-blast-furnace-base.png",
                    priority = "high",
                    width = 328,
                    height = 376,
                    shift = util.by_pixel(0, -13.5),
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/blast-furnace-mask.png",
                priority = "high",
                width = 164,
                height = 189,
                shift = util.by_pixel(0, -14),
                tint = inputs.tint,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/hr-blast-furnace-mask.png",
                    priority = "high",
                    width = 328,
                    height = 376,
                    shift = util.by_pixel(0, -13.5),
                    tint = inputs.tint,
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/blast-furnace-highlights.png",
                priority = "high",
                width = 164,
                height = 189,
                shift = util.by_pixel(0, -14),
                blend_mode = reskins.lib.blend_mode,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/hr-blast-furnace-highlights.png",
                    priority = "high",
                    width = 328,
                    height = 376,
                    shift = util.by_pixel(0, -13.5),
                    blend_mode = reskins.lib.blend_mode,
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/blast-furnace-shadow.png",
                priority = "high",
                width = 224,
                height = 124,
                shift = util.by_pixel(30, 20),
                draw_as_shadow = true,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/hr-blast-furnace-shadow.png",
                    priority = "high",
                    width = 445,
                    height = 245,
                    shift = util.by_pixel(29, 19.5),
                    draw_as_shadow = true,
                    scale = 0.5,
                }
            },
        }
    }

    entity.working_visualisations = {
        -- Fire effect
        {
            north_position = {0, 0},
            east_position = {0, 0},
            south_position = {0, 0},
            west_position = {0, 0},
            light = {intensity = 1, size = 2, color = {r = 1.0, g = 1.0, b = 1.0}, shift = util.by_pixel(7, 38)},
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/blast-furnace-fire.png",
                priority = "high",
                width = 12,
                height = 25,
                line_length = 8,
                frame_count = 48,
                animation_speed = 0.5,
                shift = util.by_pixel(4, 29),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/hr-blast-furnace-fire.png",
                    priority = "high",
                    width = 23,
                    height = 50,
                    line_length = 8,
                    frame_count = 48,
                    animation_speed = 0.5,
                    shift = util.by_pixel(3, 29),
                    scale = 0.5,
                }
            },
        },
        -- Glow
        {
            north_position = {0, 0},
            east_position = {0, 0},
            south_position = {0, 0},
            west_position = {0, 0},
            effect = "flicker",
            animation = {
                filename = "__base__/graphics/entity/steel-furnace/steel-furnace-glow.png",
                priority = "high",
                width = 60,
                height = 43,
                blend_mode = "additive",
                shift = util.by_pixel(4, 37.5),
                scale = 0.75,
            }
        },
        -- Working Lights
        {
            north_position = {0, 0},
            east_position = {0, 0},
            south_position = {0, 0},
            west_position = {0, 0},
            effect = "flicker",
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/blast-furnace-working-light.png",
                priority = "high",
                width = 17,
                height = 20,
                blend_mode = "additive",
                shift = util.by_pixel(4.5, 40),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/blast-furnace/hr-blast-furnace-working-light.png",
                    priority = "high",
                    width = 34,
                    height = 40,
                    blend_mode = "additive",
                    shift = util.by_pixel(4.5, 40),
                    scale = 0.5,
                }
            }
        }
    }

    -- Hide the light from the burner energy source
    entity.energy_source.light_flicker = {
        color = {0, 0, 0}
    }

    -- Label to skip to next iteration
    ::continue::
end