-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
-- if reskins.lib.setting("reskins-angels-do-angelssmelting") == false then return end

-- Setup standard inputs
local inputs = {
    mod = "angels",
    group = "smelting",
    type = "technology",
    technology_icon_size = 256,
    technology_icon_mipmaps = 2,
}

local technologies = {
    -- Metallurgy
    ["angels-metallurgy-1"] = {tier = 1, icon_name = "metallurgy"},
    ["angels-metallurgy-2"] = {tier = 2, icon_name = "metallurgy"},
    ["angels-metallurgy-3"] = {tier = 3, icon_name = "metallurgy"},
    ["angels-metallurgy-4"] = {tier = 4, icon_name = "metallurgy"},
    ["angels-metallurgy-5"] = {tier = 5, icon_name = "metallurgy"},

    -- Strand Casting
    ["strand-casting-1"] = {tier = 1, prog_tier = 2, icon_name = "strand-casting"},
    ["strand-casting-2"] = {tier = 2, prog_tier = 3, icon_name = "strand-casting"},
    ["strand-casting-3"] = {tier = 3, prog_tier = 4, icon_name = "strand-casting"},
    ["strand-casting-4"] = {tier = 4, prog_tier = 5, icon_name = "strand-casting"},

    -- Powder Metallurgy
    ["powder-metallurgy-1"] = {tier = 1, prog_tier = 2, icon_name = "powder-metallurgy"},
    ["powder-metallurgy-2"] = {tier = 2, prog_tier = 3, icon_name = "powder-metallurgy"},
    ["powder-metallurgy-3"] = {tier = 3, prog_tier = 4, icon_name = "powder-metallurgy"},
    ["powder-metallurgy-4"] = {tier = 4, prog_tier = 5, icon_name = "powder-metallurgy"},

    -- Ore Processing
    ["ore-processing-1"] = {tier = 1, icon_name = "ore-processing-machine"},
    ["ore-processing-2"] = {tier = 1, prog_tier = 2, icon_name = "pellet-press"},
    ["ore-processing-3"] = {tier = 2, prog_tier = 3, icon_name = "pellet-press"},
    ["ore-processing-4"] = {tier = 3, prog_tier = 4, icon_name = "pellet-press"},
    ["ore-processing-5"] = {tier = 4, prog_tier = 5, icon_name = "pellet-press"},

    -- Smelting
    ["angels-solder-smelting-basic"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-solder-technology-icon"},

    ["angels-copper-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-copper-technology-icon"},
    ["angels-copper-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-copper-technology-icon"},
    ["angels-copper-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-copper-technology-icon"},

    ["angels-iron-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-iron-technology-icon"},
    ["angels-iron-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-iron-technology-icon"},
    ["angels-iron-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-iron-technology-icon"},

    ["angels-lead-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-lead-technology-icon"},
    ["angels-lead-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-lead-technology-icon"},
    ["angels-lead-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-lead-technology-icon"},

    ["angels-nickel-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-nickel-technology-icon"},
    ["angels-nickel-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-nickel-technology-icon"},
    ["angels-nickel-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-nickel-technology-icon"},

    ["angels-silicon-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-silicon-technology-icon"},
    ["angels-silicon-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-silicon-technology-icon"},
    ["angels-silicon-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-silicon-technology-icon"},

    ["angels-solder-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-solder-technology-icon"},
    ["angels-solder-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-solder-technology-icon"},
    ["angels-solder-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-solder-technology-icon"},

    ["angels-tin-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-tin-technology-icon"},
    ["angels-tin-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-tin-technology-icon"},
    ["angels-tin-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-tin-technology-icon"},

    ["angels-aluminium-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-aluminium-technology-icon"},
    ["angels-aluminium-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-aluminium-technology-icon"},
    ["angels-aluminium-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-aluminium-technology-icon"},

    ["angels-cobalt-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-cobalt-technology-icon"},
    ["angels-cobalt-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-cobalt-technology-icon"},
    ["angels-cobalt-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-cobalt-technology-icon"},

    ["angels-gold-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-gold-technology-icon"},
    ["angels-gold-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-gold-technology-icon"},
    ["angels-gold-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-gold-technology-icon"},

    ["angels-glass-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-glass-technology-icon"},
    ["angels-glass-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-glass-technology-icon"},
    ["angels-glass-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-glass-technology-icon"},

    ["angels-manganese-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-manganese-technology-icon"},
    ["angels-manganese-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-manganese-technology-icon"},
    ["angels-manganese-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-manganese-technology-icon"},

    ["angels-silver-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-silver-technology-icon"},
    ["angels-silver-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-silver-technology-icon"},
    ["angels-silver-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-silver-technology-icon"},

    ["angels-steel-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-steel-technology-icon"},
    ["angels-steel-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-steel-technology-icon"},
    ["angels-steel-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-steel-technology-icon"},

    ["angels-zinc-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-zinc-technology-icon"},
    ["angels-zinc-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-zinc-technology-icon"},
    ["angels-zinc-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-zinc-technology-icon"},

    ["angels-chrome-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-chrome-technology-icon"},
    ["angels-chrome-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-chrome-technology-icon"},
    ["angels-chrome-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-chrome-technology-icon"},

    ["angels-platinum-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-platinum-technology-icon"},
    ["angels-platinum-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-platinum-technology-icon"},
    ["angels-platinum-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-platinum-technology-icon"},

    ["angels-titanium-smelting-1"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-titanium-technology-icon"},
    ["angels-titanium-smelting-2"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-titanium-technology-icon"},
    ["angels-titanium-smelting-3"] = {subgroup = "casting", flat_icon = true, technology_icon_mipmaps =4, image = "casting-titanium-technology-icon"},
}

reskins.lib.create_icons_from_list(technologies, inputs)