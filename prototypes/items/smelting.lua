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
    ["copper-plate"] = {},
    ["iron-plate"] = {},
    ["steel-plate"] = {},

    -- Plates shared with Bob's Mods, but unique sprites
    ["aluminium-plate"] = {},
    ["lead-plate"] = {},
    ["nickel-plate"] = {},
    ["tin-plate"] = {},
    ["titanium-plate"] = {},
    ["zinc-plate"] = {},
    ["bronze-alloy"] = {},
    ["brass-alloy"] = {},
    ["gunmetal-alloy"] = {},
    ["invar-alloy"] = {},
    ["nitinol-alloy"] = {},

    -- Plates shared with Bob's mods
    ["cobalt-plate"] = {},
    ["glass"] = {},
    ["gold-plate"] = {},
    ["silver-plate"] = {},
    ["tungsten-plate"] = {},

    ----------------------------------------------------------------------------------------------------
    -- Recipes
    ----------------------------------------------------------------------------------------------------
    -- Plates
    ["angels-plate-tungsten"] = {}, -- Inherit from tungsten-plate-item
    ["angels-bronze-alloy"] = {}, -- Inherit
    ["angels-plate-brass"] = {}, -- Inherit
    ["angels-plate-gunmetal"] = {}, -- Inherit
}

-- In the pure Angels case, Angel's internal names are used
if not mods["bobplates"] then
    intermediaries["angels-plate-aluminium"] = {}
    intermediaries["angels-plate-gold"] = {}
    intermediaries["angels-plate-lead"] = {}
    intermediaries["angels-plate-silver"] = {}
    intermediaries["angels-plate-tin"] = {}
    intermediaries["angels-plate-titanium"] = {}
    intermediaries["angels-plate-tungsten"] = {}
    intermediaries["angels-plate-zinc"] = {}
end

local numbered_recipes = {
    -- Glass
    ["angels-plate-glass-1"] = {}, -- "1"
    ["angels-plate-glass-2"] = {}, -- "2"
    ["angels-plate-glass-3"] = {}, -- "3"

    -- Tungsten Carbide
    ["tungsten-carbide"] = {}, -- "1"
    ["tungsten-carbide-2"] = {}, -- "2"
}

local composite_recipes = {
    -- Aluminium
    ["angels-plate-aluminium"] = {}, -- Molten Aluminium
    ["angels-roll-aluminium-converting"] = {}, -- Aluminium sheet coil

    -- Cobalt
    ["angels-plate-cobalt"] = {}, -- Molten cobalt
    ["angels-roll-cobalt-converting"] = {}, -- Cobalt sheet coil

    -- Copper
    ["angelsore3-crushed-smelting"] = {}, -- Crushed stiratite
    ["copper-plate"] = {}, -- Copper ore
    ["angels-plate-copper"] = {}, -- Molten copper
    ["angels-roll-copper-converting"] = {}, -- Copper sheet coil

    -- Glass
    ["quartz-glass"] = {}, -- Silicon ore

    -- Gold
    ["angels-plate-gold"] = {}, -- Molten gold
    ["angels-roll-gold-converting"] = {}, -- Gold sheet coil

    -- Iron
    ["angelsore1-crushed-smelting"] = {}, -- Crushed saphirite
    ["iron-plate"] = {}, -- Iron ore
    ["angels-plate-iron"] = {}, -- Molten iron
    ["angels-roll-iron-converting"] = {}, -- Iron sheet coil

    -- Lead
    ["angelsore5-crushed-smelting"] = {}, -- Crushed rubyte
    ["lead-plate"] = {}, -- Lead ore
    ["angels-plate-lead"] = {}, -- Molten lead
    ["angels-roll-lead-converting"] = {}, -- Lead sheet coil

    -- Nickel
    ["angels-plate-nickel"] = {}, -- Molten nickel
    ["angels-roll-nickel-converting"] = {}, -- Nickel sheet roll

    -- Silver
    ["silver-plate"] = {}, -- Silver ore
    ["angels-plate-silver"] = {}, -- Molten silver
    ["angels-roll-silver-converting"] = {}, -- Silver sheet coil

    -- Tin
    ["angelsore6-crushed-smelting"] = {}, -- Crushed bobmonium
    ["tin-plate"] = {}, -- Tin ore
    ["angels-plate-tin"] = {}, -- Molten tin
    ["angels-roll-tin-converting"] = {}, -- Tin sheet coil

    -- Titanium
    ["angels-plate-titanium"] = {}, -- Molten titanium
    ["angels-roll-titanium-converting"] = {}, -- Titanium sheet coil

    -- Zinc
    ["angels-plate-zinc"] = {}, -- Molten Zinc
    ["angels-roll-zinc-converting"] = {}, -- Zinc sheet coil

    -- Steel plate
    ["steel-plate"] = {}, -- Iron plate
    ["angels-plate-steel"] = {}, -- Molten steel
    ["angels-roll-steel-converting"] = {}, -- Steel sheet coil

    -- Invar
    ["angels-plate-invar"] = {}, -- Molten invar
    ["invar-alloy"] = {}, -- Nickel/Iron plates

    -- Nitinol
    ["angels-plate-nitinol"] = {}, -- Molten nitinol
}

for name, sources in pairs(composite_recipes) do
    reskins.lib.composite_existing_icons(name, "recipe", sources)
end