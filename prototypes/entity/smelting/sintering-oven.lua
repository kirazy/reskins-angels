-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
-- if reskins.lib.setting("reskins-bobs-do-angelssmelting") == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "sintering-oven",
    base_entity = "roboport",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["medium"] = 2},
    group = "smelting",
    icon_layers = 1,
    make_remnants = false,
}

local tier_map = {
    ["sintering-oven"] = {tier = 1},
    ["sintering-oven-2"] = {tier = 2},
    ["sintering-oven-3"] = {tier = 3},
    ["sintering-oven-4"] = {tier = 4},
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end
      
    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index["tier-"..map.tier]

    reskins.lib.setup_standard_entity(name, map.tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/sintering-oven-base.png",
                priority = "high",
                width = 165,
                height = 177,
                shift = util.by_pixel(-1, -6),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/hr-sintering-oven-base.png",
                    priority = "high",
                    width = 326,
                    height = 350,
                    shift = util.by_pixel(-1, -6.5),
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/sintering-oven-shadow.png",
                priority = "high",
                width = 197,
                height = 123,
                shift = util.by_pixel(16, 22),
                draw_as_shadow = true,
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/hr-sintering-oven-shadow.png",
                    priority = "high",
                    width = 391,
                    height = 242,
                    shift = util.by_pixel(14.5, 22.5),
                    draw_as_shadow = true,
                    scale = 0.5,
                }
            }
        }
    }

    entity.working_visualisations = {
        -- Glow
        {
            effect = "uranium-glow",
            animation = {
                filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/sintering-oven-glow.png",
                priority = "high",
                width = 165,
                height = 177,
                blend_mode = "additive",
                shift = util.by_pixel(-1, -6),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/hr-sintering-oven-glow.png",
                    priority = "high",
                    width = 326,
                    height = 350,
                    blend_mode = "additive",
                    shift = util.by_pixel(-1, -6.5),
                    scale = 0.5,
                }
            }
        },
        -- Light
        {
            effect = "uranium-glow",
            draw_as_sprite = false,
            draw_as_light = true,
            animation = {
                filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/sintering-oven-light.png",
                priority = "high",
                width = 165,
                height = 177,
                shift = util.by_pixel(-1, -6),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/sintering-oven/hr-sintering-oven-light.png",
                    priority = "high",
                    width = 326,
                    height = 350,
                    shift = util.by_pixel(-1, -6.5),
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::    
end