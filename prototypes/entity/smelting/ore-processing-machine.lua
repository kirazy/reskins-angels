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
    icon_layers = 1,
    make_remnants = false,
}

-- These are super half-assed, just to ensure working_visualisations was working properly
local recipe_tints = {
    ["bauxite"] = {primary = util.color("ffde0080"), secondary = util.color("b39b00")},
    ["chrome"] = {primary = util.color("a78cff80"), secondary = util.color("645499")},
    ["cobalt"] = {primary = util.color("0045ad80"), secondary = util.color("002761")},
    ["copper"] = {primary = util.color("be553880"), secondary = util.color("59281a")},
    ["gold"] = {primary = util.color("e4b71d80"), secondary = util.color("7d6410")},
    ["iron"] = {primary = util.color("9ec5e480"), secondary = util.color("566c7d")},
    ["lead"] = {primary = util.color("47485480"), secondary = util.color("1c1d21")},
    ["manganese"] = {primary = util.color("e0323280"), secondary = util.color("7a1b1b")},
    ["nickel"] = {primary = util.color("2b887f80"), secondary = util.color("15312e")},
    ["silica"] = {primary = util.color("cccccc80"), secondary = util.color("808080")},
    ["silver"] = {primary = util.color("bad0de80"), secondary = util.color("778289")},
    ["tin"] = {primary = util.color("7abd8780"), secondary = util.color("527158")},
    ["titanium"] = {primary = util.color("b387ae80"), secondary = util.color("6d556a")},
    ["tungsten"] = {primary = util.color("7e5a3c80"), secondary = util.color("4d3a2a")},
    ["zinc"] = {primary = util.color("5caaa480"), secondary = util.color("3e6663")},
}

for name, tints in pairs(recipe_tints) do
    -- Fetch recipe
    local recipe = data.raw.recipe[name.."-ore-processing"]

    -- Check if recipe exists, if not, skip this iteration
    if not recipe then goto continue end

    -- Set the primary recipe tint
    recipe.crafting_machine_tint = {
        primary = tints.primary,
        secondary = tints.secondary,
    }

    -- Label to skip to next iteration
    ::continue::
end

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

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index["tier-"..map.tier]

    reskins.lib.setup_standard_entity(name, map.tier, inputs)

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
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/ore-processing-machine-shadow.png",
                priority = "high",
                width = 114,
                height = 76,
                repeat_count = 25,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(8, 13),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/ore-processing-machine/hr-ore-processing-machine-shadow.png",
                    priority = "high",
                    width = 224,
                    height = 150,
                    repeat_count = 25,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(7.5, 13),
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