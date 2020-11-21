-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Set input parameters
local inputs = {
    type = "logistic-container",
    mod = "angels",
    icon_layers = 1,
    make_remnants = false,
    make_explosions = false,
}

local logistic_map = {
    ["active-provider"] = {tint = util.color("760fd6")},
    ["buffer"] = {tint = util.color("00bf13")},
    ["passive-provider"] = {tint = util.color("ff0000")},
    ["requester"] = {tint = util.color("227dae")},
    ["storage"] = {tint = util.color("ba7713")},
}

-- Reskin Warehouses
if reskins.angels.triggers.storage.warehouses then
    for chest, map in pairs(logistic_map) do
        -- Fetch entity
        local name = "angels-warehouse-"..chest
        local entity = data.raw[inputs.type][name]

        -- Check if entity exists, if not, skip this iteration
        if not entity then goto continue end

        -- Determine what tint we're using
        inputs.tint = map.tint

        inputs.group = "addons-storage"

        -- Setup icon details
        inputs.icon_name = "warehouse"
        inputs.icon_base = "logistic-warehouse-"..chest

        reskins.lib.setup_standard_entity(name, 0, inputs)

        entity.picture = {
            layers = {
                -- Base
                {
                    filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/logistic-warehouse-"..chest..".png",
                    priority = "high",
                    width = 197,
                    height = 223,
                    shift = util.by_pixel(0, -15),
                    hr_version = {
                        filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/hr-logistic-warehouse-"..chest..".png",
                        priority = "high",
                        width = 391,
                        height = 446,
                        shift = util.by_pixel(-0.5, -15),
                        scale = 0.5,
                    }
                },
                -- Shadow
                {
                    filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/warehouse-shadow.png",
                    priority = "high",
                    width = 297,
                    height = 140,
                    shift = util.by_pixel(51, 30),
                    draw_as_shadow = true,
                    hr_version = {
                        filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/hr-warehouse-shadow.png",
                        priority = "high",
                        width = 592,
                        height = 276,
                        shift = util.by_pixel(52.5, 30.5),
                        draw_as_shadow = true,
                        scale = 0.5,
                    }
                },
                -- Light
                -- {
                --     filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/logistic-warehouse-light.png",
                --     priority = "high",
                --     width = 7,
                --     height = 16,
                --     shift = util.by_pixel(72, -104),
                --     draw_as_light = true,
                --     hr_version = {
                --         filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/hr-logistic-warehouse-light.png",
                --         priority = "high",
                --         width = 9,
                --         height = 28,
                --         shift = util.by_pixel(71.5, -104),
                --         draw_as_light = true,
                --         scale = 0.5,
                --     }
                -- },
            }
        }

        -- Label to skip to next iteration
        ::continue::
    end
end

-- Reskin Silos
if reskins.angels.triggers.storage.silos then
--     for chest, map in pairs(logistic_map) do
--         -- Fetch entity
--         local name = "angels-warehouse-"..chest
--         local entity = data.raw[inputs.type][name]

--         -- Check if entity exists, if not, skip this iteration
--         if not entity then goto continue end

--         -- Determine what tint we're using
--         inputs.tint = map.tint

--         inputs.icon_name = "warehouse"

--         reskins.lib.setup_standard_entity(name, 0, inputs)

--         entity.picture = {
--             layers = {
--                 -- Base
--                 {
--                     filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/warehouse-"..chest.."-base.png",
--                     priority = "high",
--                     width = 164,
--                     height = 189,
--                     shift = util.by_pixel(0, 0),
--                     hr_version = {
--                         filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/hr-warehouse-"..chest.."-base.png",
--                         priority = "high",
--                         width = 328,
--                         height = 376,
--                         shift = util.by_pixel(0, 0),
--                         scale = 0.5,
--                     }
--                 },
--                 -- Shadow
--                 {
--                     filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/warehouse-"..chest.."-shadow.png",
--                     priority = "high",
--                     width = 164,
--                     height = 189,
--                     shift = util.by_pixel(0, 0),
--                     draw_as_shadow = true,
--                     hr_version = {
--                         filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/hr-warehouse-"..chest.."-shadow.png",
--                         priority = "high",
--                         width = 328,
--                         height = 376,
--                         shift = util.by_pixel(0, 0),
--                         draw_as_shadow = true,
--                         scale = 0.5,
--                     }
--                 },
--                 -- Light
--                 {
--                     filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/warehouse-"..chest.."-light.png",
--                     priority = "high",
--                     width = 164,
--                     height = 189,
--                     shift = util.by_pixel(0, 0),
--                     draw_as_light = true,
--                     hr_version = {
--                         filename = reskins.angels.directory.."/graphics/entity/addons-storage/warehouse/hr-warehouse-"..chest.."-light.png",
--                         priority = "high",
--                         width = 328,
--                         height = 376,
--                         shift = util.by_pixel(0, 0),
--                         draw_as_light = true,
--                         scale = 0.5,
--                     }
--                 },
--             }
--         }

--         -- Label to skip to next iteration
--         ::continue::
--     end
end

-- Reskin Big Chests
if reskins.angels.triggers.industries.big_chests then
--     for chest, map in pairs(logistic_map) do
--         -- Fetch entity
--         local name = "angels-big-chest-"..chest
--         local entity = data.raw[inputs.type][name]

--         -- Check if entity exists, if not, skip this iteration
--         if not entity then goto continue end

--         -- Determine what tint we're using
--         inputs.tint = map.tint

--         inputs.icon_name = "big-chest"

--         reskins.lib.setup_standard_entity(name, 0, inputs)

--         entity.picture = {
--             layers = {
--                 -- Base
--                 {
--                     filename = reskins.angels.directory.."/graphics/entity/industries/big-chest/big-chest-"..chest.."-base.png",
--                     priority = "high",
--                     width = 164,
--                     height = 189,
--                     shift = util.by_pixel(0, 0),
--                     hr_version = {
--                         filename = reskins.angels.directory.."/graphics/entity/industries/big-chest/hr-big-chest-"..chest.."-base.png",
--                         priority = "high",
--                         width = 328,
--                         height = 376,
--                         shift = util.by_pixel(0, 0),
--                         scale = 0.5,
--                     }
--                 },
--                 -- Shadow
--                 {
--                     filename = reskins.angels.directory.."/graphics/entity/industries/big-chest/big-chest-"..chest.."-shadow.png",
--                     priority = "high",
--                     width = 164,
--                     height = 189,
--                     shift = util.by_pixel(0, 0),
--                     draw_as_shadow = true,
--                     hr_version = {
--                         filename = reskins.angels.directory.."/graphics/entity/industries/big-chest/hr-big-chest-"..chest.."-shadow.png",
--                         priority = "high",
--                         width = 328,
--                         height = 376,
--                         shift = util.by_pixel(0, 0),
--                         draw_as_shadow = true,
--                         scale = 0.5,
--                     }
--                 },
--                 -- Light
--                 {
--                     filename = reskins.angels.directory.."/graphics/entity/industries/big-chest/big-chest-"..chest.."-light.png",
--                     priority = "high",
--                     width = 164,
--                     height = 189,
--                     shift = util.by_pixel(0, 0),
--                     draw_as_light = true,
--                     hr_version = {
--                         filename = reskins.angels.directory.."/graphics/entity/industries/big-chest/hr-big-chest-"..chest.."-light.png",
--                         priority = "high",
--                         width = 328,
--                         height = 376,
--                         shift = util.by_pixel(0, 0),
--                         draw_as_light = true,
--                         scale = 0.5,
--                     }
--                 },
--             }
--         }

--         -- Label to skip to next iteration
--         ::continue::
--     end
end