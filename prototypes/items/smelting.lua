-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end

-- Setup inputs
local inputs = {
    mod = "angels",
    group = "smelting",
    make_icon_pictures = false,
    flat_icon = true,
}

local intermediaries = {
    ----------------------------------------------------------------------------------------------------
    -- Intermediaries
    ----------------------------------------------------------------------------------------------------
    -- Pure Angels Plates
    ["copper-plate"] = {icon_filename = "__base__/graphics/icons/copper-plate.png", icon_size = 64, icon_mipmaps = 4},
    -- ["iron-plate"] = {subgroup = "plates"},
    ["steel-plate"] = {icon_filename = "__base__/graphics/icons/steel-plate.png", icon_size = 64, icon_mipmaps = 4},

    -- Plates shared with Bob's Mods, but unique sprites
    -- ["aluminium-plate"] = {},
    -- ["lead-plate"] = {},
    -- ["nickel-plate"] = {},
    -- ["tin-plate"] = {},
    -- ["titanium-plate"] = {},
    -- ["zinc-plate"] = {},
    -- ["bronze-alloy"] = {},
    -- ["brass-alloy"] = {},
    -- ["gunmetal-alloy"] = {},
    -- ["invar-alloy"] = {},
    -- ["nitinol-alloy"] = {},

    ----------------------------------------------------------------------------------------------------
    -- Recipes
    ----------------------------------------------------------------------------------------------------
    -- Plates

    -- ["angels-bronze-alloy"] = {}, -- Inherit
    -- ["angels-plate-brass"] = {}, -- Inherit
    -- ["angels-plate-gunmetal"] = {}, -- Inherit
}

-- Plates sharing sprites with reskins-bobs
if mods["bobplates"] and mods["reskins-bobs"] then
    -- Plates
    intermediaries["cobalt-plate"] = {mod = "bobs", group = "plates", subgroup = "plates"}
    intermediaries["glass"] = {mod = "bobs", group = "plates", subgroup = "items"}
    intermediaries["gold-plate"] = {mod = "bobs", group = "plates", subgroup = "plates"}
    intermediaries["silver-plate"] = {mod = "bobs", group = "plates", subgroup = "plates"}
    intermediaries["tungsten-plate"] = {mod = "bobs", group = "plates", subgroup = "plates"}
    intermediaries["cobalt-steel-alloy"] = {mod = "bobs", group = "plates", subgroup = "plates"}

    -- Recipes
    intermediaries["angels-plate-tungsten"] = {type = "recipe", mod = "bobs", group = "plates", subgroup = "plates", image = "tungsten-plate"}
    intermediaries["angels-plate-glass-1"] = {type = "recipe", mod = "bobs", group = "plates", subgroup = "items", image = "glass", icon_extras = reskins.angels.num_tier(1, inputs.group)} -- "1"
    intermediaries["angels-plate-glass-2"] = {type = "recipe", mod = "bobs", group = "plates", subgroup = "items", image = "glass", icon_extras = reskins.angels.num_tier(2, inputs.group)} -- "2"
    intermediaries["angels-plate-glass-3"] = {type = "recipe", mod = "bobs", group = "plates", subgroup = "items", image = "glass", icon_extras = reskins.angels.num_tier(3, inputs.group)} -- "3"
    intermediaries["tungsten-carbide"] = {type = "recipe", mod = "bobs", group = "plates", subgroup = "plates", image = "tungsten-carbide", icon_extras = reskins.angels.num_tier(1, inputs.group)} -- "1"
    intermediaries["tungsten-carbide-2"] = {type = "recipe", mod = "bobs", group = "plates", subgroup = "plates", image = "tungsten-carbide", icon_extras = reskins.angels.num_tier(2, inputs.group)} -- "2"
end

-- In the pure Angels case, Angel's internal names are used
if not mods["bobplates"] then
    -- intermediaries["angels-plate-aluminium"] = {}
    -- intermediaries["angels-plate-gold"] = {}
    -- intermediaries["angels-plate-lead"] = {}
    -- intermediaries["angels-plate-silver"] = {}
    -- intermediaries["angels-plate-tin"] = {}
    -- intermediaries["angels-plate-titanium"] = {}
    -- intermediaries["angels-plate-tungsten"] = {}
    -- intermediaries["angels-plate-zinc"] = {}
end

reskins.lib.create_icons_from_list(intermediaries, inputs)

-- Recipes with layered icons
local numbered_recipes = {
    -- Glass

    -- Tungsten Carbide
}

local shift = reskins.angels.constants.recipe_corner_shift
local scale = reskins.angels.constants.recipe_corner_scale

local composite_recipes = {
    ----------------------------------------------------------------------------------------------------
    -- PLATES
    ----------------------------------------------------------------------------------------------------
    -- Aluminium
    -- ["angels-plate-aluminium"] = {}, -- Molten Aluminium
    -- ["angels-roll-aluminium-converting"] = {}, -- Aluminium sheet coil

    -- Cobalt
    ["angels-plate-cobalt"] = {["cobalt-plate"] = {}, ["liquid-molten-cobalt"] = {type = "fluid", scale = scale, shift = shift}}, -- Molten cobalt
    ["angels-roll-cobalt-converting"] = {["cobalt-plate"] = {}, ["angels-roll-cobalt"] = {scale = scale, shift = shift}}, -- Cobalt sheet coil

    -- Copper
    ["angelsore3-crushed-smelting"] = {["copper-plate"] = {}, ["angels-ore3-crushed"] = {scale = scale, shift = shift}}, -- Crushed stiratite
    ["copper-plate"] = {["copper-plate"] = {}, ["copper-ore"] = {scale = scale, shift = shift}}, -- Copper ore
    ["angels-plate-copper"] = {["copper-plate"] = {}, ["liquid-molten-copper"] = {type = "fluid", scale = scale, shift = shift}}, -- Molten copper
    ["angels-roll-copper-converting"] = {["copper-plate"] = {}, ["angels-roll-copper"] = {scale = scale, shift = shift}}, -- Copper sheet coil

    -- Glass
    ["quartz-glass"] = {["glass"] = {}, ["quartz"] = {scale = scale, shift = shift}}, -- Silicon ore

    -- Gold
    ["angels-plate-gold"] = {["gold-plate"] = {}, ["liquid-molten-gold"] = {type = "fluid", scale = scale, shift = shift}}, -- Molten gold
    ["angels-roll-gold-converting"] = {["gold-plate"] = {}, ["angels-roll-gold"] = {scale = scale, shift = shift}}, -- Gold sheet coil

    -- Iron
    -- ["angelsore1-crushed-smelting"] = {}, -- Crushed saphirite
    -- ["iron-plate"] = {}, -- Iron ore
    -- ["angels-plate-iron"] = {}, -- Molten iron
    -- ["angels-roll-iron-converting"] = {}, -- Iron sheet coil

    -- Lead
    -- ["angelsore5-crushed-smelting"] = {}, -- Crushed rubyte
    -- ["lead-plate"] = {}, -- Lead ore
    -- ["angels-plate-lead"] = {}, -- Molten lead
    -- ["angels-roll-lead-converting"] = {}, -- Lead sheet coil
    ["silver-from-lead"] = {["lead-plate"] = {}, ["silver-ore"] = {scale = scale, shift = shift}},

    -- Nickel
    -- ["angels-plate-nickel"] = {}, -- Molten nickel
    -- ["angels-roll-nickel-converting"] = {}, -- Nickel sheet roll

    -- Silver
    ["silver-plate"] = {["silver-plate"] = {}, ["silver-ore"] = {scale = scale, shift = shift}}, -- Silver ore
    ["angels-plate-silver"] = {["silver-plate"] = {}, ["liquid-molten-silver"] = {type = "fluid", scale = scale, shift = shift}}, -- Molten silver
    ["angels-roll-silver-converting"] = {["silver-plate"] = {}, ["angels-roll-silver"] = {scale = scale, shift = shift}}, -- Silver sheet coil

    -- Tin
    -- ["angelsore6-crushed-smelting"] = {}, -- Crushed bobmonium
    -- ["tin-plate"] = {}, -- Tin ore
    -- ["angels-plate-tin"] = {}, -- Molten tin
    -- ["angels-roll-tin-converting"] = {}, -- Tin sheet coil

    -- Titanium
    -- ["angels-plate-titanium"] = {}, -- Molten titanium
    -- ["angels-roll-titanium-converting"] = {}, -- Titanium sheet coil

    -- Zinc
    -- ["angels-plate-zinc"] = {}, -- Molten Zinc
    -- ["angels-roll-zinc-converting"] = {}, -- Zinc sheet coil

    -- Steel plate
    ["steel-plate"] = {["steel-plate"] = {}, ["iron-plate"] = {scale = scale, shift = shift}}, -- Iron plate
    ["angels-plate-steel"] = {["steel-plate"] = {}, ["liquid-molten-steel"] = {type = "fluid", scale = scale, shift = shift}}, -- Molten steel
    ["angels-roll-steel-converting"] = {["steel-plate"] = {}, ["angels-roll-steel"] = {scale = scale, shift = shift}}, -- Steel sheet coil

    -- Invar
    -- ["angels-plate-invar"] = {}, -- Molten invar
    -- ["invar-alloy"] = {}, -- Nickel/Iron plates

    -- Nitinol
    -- ["angels-plate-nitinol"] = {}, -- Molten nitinol
}

for name, sources in pairs(composite_recipes) do
    reskins.lib.composite_existing_icons(name, "recipe", sources)
end