-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.technologies) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "angels",
    group = "smelting",
    type = "technology",
    technology_icon_size = 256,
    technology_icon_mipmaps = 2,
}

---@param material string
---@return CreateIconsFromListOverrides
local function get_casting_overrides(material)
    ---@type CreateIconsFromListOverrides
    local override = {
        subgroup = "casting",
        flat_icon = true,
        technology_icon_mipmaps = 4,
        image = "casting-" .. material .. "-technology-icon",
    }

    return override
end

---@param material string
---@return CreateIconsFromListOverrides
local function get_smelting_overrides(material)
    ---@type CreateIconsFromListOverrides
    local override = {
        subgroup = "smelting",
        flat_icon = true,
        technology_icon_mipmaps = 4,
        image = "smelting-" .. material .. "-technology-icon",
    }

    return override
end

---@type CreateIconsFromListTable
local technologies = {
    -- Metallurgy
    ["angels-metallurgy-1"] = { tier = 1, icon_name = "metallurgy" },
    ["angels-metallurgy-2"] = { tier = 2, icon_name = "metallurgy" },
    ["angels-metallurgy-3"] = { tier = 3, icon_name = "metallurgy" },
    ["angels-metallurgy-4"] = { tier = 4, icon_name = "metallurgy" },
    ["angels-metallurgy-5"] = { tier = 5, icon_name = "metallurgy" },

    -- Strand Casting
    ["strand-casting-1"] = { tier = 1, prog_tier = 2, icon_name = "strand-casting" },
    ["strand-casting-2"] = { tier = 2, prog_tier = 3, icon_name = "strand-casting" },
    ["strand-casting-3"] = { tier = 3, prog_tier = 4, icon_name = "strand-casting" },
    ["strand-casting-4"] = { tier = 4, prog_tier = 5, icon_name = "strand-casting" },

    -- Ore Processing
    ["ore-processing-1"] = { tier = 1, prog_tier = 2, icon_name = "ore-processing-machine" },
    ["ore-processing-2"] = { tier = 1, prog_tier = 3, icon_name = "pellet-press" },
    ["ore-processing-3"] = { tier = 2, prog_tier = 4, icon_name = "pellet-press" },
    ["ore-processing-4"] = { tier = 3, prog_tier = 5, icon_name = "pellet-press" },
    ["ore-processing-5"] = { tier = 4, prog_tier = 6, icon_name = "pellet-press" },

    -- Smelting
    ["angels-solder-smelting-basic"] = get_casting_overrides("solder"),

    ["angels-copper-smelting-1"] = get_casting_overrides("copper"),
    ["angels-copper-smelting-2"] = get_casting_overrides("copper"),
    ["angels-copper-smelting-3"] = get_casting_overrides("copper"),

    ["angels-iron-smelting-1"] = get_casting_overrides("iron"),
    ["angels-iron-smelting-2"] = get_casting_overrides("iron"),
    ["angels-iron-smelting-3"] = get_casting_overrides("iron"),

    ["angels-lead-smelting-1"] = get_casting_overrides("lead"),
    ["angels-lead-smelting-2"] = get_casting_overrides("lead"),
    ["angels-lead-smelting-3"] = get_casting_overrides("lead"),

    ["angels-nickel-smelting-1"] = get_casting_overrides("nickel"),
    ["angels-nickel-smelting-2"] = get_casting_overrides("nickel"),
    ["angels-nickel-smelting-3"] = get_casting_overrides("nickel"),

    ["angels-silicon-smelting-1"] = get_casting_overrides("silicon"),
    ["angels-silicon-smelting-2"] = get_casting_overrides("silicon"),
    ["angels-silicon-smelting-3"] = get_casting_overrides("silicon"),

    ["angels-solder-smelting-1"] = get_casting_overrides("solder"),
    ["angels-solder-smelting-2"] = get_casting_overrides("solder"),
    ["angels-solder-smelting-3"] = get_casting_overrides("solder"),

    ["angels-tin-smelting-1"] = get_casting_overrides("tin"),
    ["angels-tin-smelting-2"] = get_casting_overrides("tin"),
    ["angels-tin-smelting-3"] = get_casting_overrides("tin"),

    ["angels-aluminium-smelting-1"] = get_casting_overrides("aluminium"),
    ["angels-aluminium-smelting-2"] = get_casting_overrides("aluminium"),
    ["angels-aluminium-smelting-3"] = get_casting_overrides("aluminium"),

    ["angels-cobalt-smelting-1"] = get_casting_overrides("cobalt"),
    ["angels-cobalt-smelting-2"] = get_casting_overrides("cobalt"),
    ["angels-cobalt-smelting-3"] = get_casting_overrides("cobalt"),

    ["angels-gold-smelting-1"] = get_casting_overrides("gold"),
    ["angels-gold-smelting-2"] = get_casting_overrides("gold"),
    ["angels-gold-smelting-3"] = get_casting_overrides("gold"),

    ["angels-glass-smelting-1"] = get_casting_overrides("glass"),
    ["angels-glass-smelting-2"] = get_casting_overrides("glass"),
    ["angels-glass-smelting-3"] = get_casting_overrides("glass"),

    ["angels-manganese-smelting-1"] = get_casting_overrides("manganese"),
    ["angels-manganese-smelting-2"] = get_casting_overrides("manganese"),
    ["angels-manganese-smelting-3"] = get_casting_overrides("manganese"),

    ["angels-silver-smelting-1"] = get_casting_overrides("silver"),
    ["angels-silver-smelting-2"] = get_casting_overrides("silver"),
    ["angels-silver-smelting-3"] = get_casting_overrides("silver"),

    ["angels-steel-smelting-1"] = get_casting_overrides("steel"),
    ["angels-steel-smelting-2"] = get_casting_overrides("steel"),
    ["angels-steel-smelting-3"] = get_casting_overrides("steel"),

    ["angels-zinc-smelting-1"] = get_casting_overrides("zinc"),
    ["angels-zinc-smelting-2"] = get_casting_overrides("zinc"),
    ["angels-zinc-smelting-3"] = get_casting_overrides("zinc"),

    ["angels-chrome-smelting-1"] = get_casting_overrides("chrome"),
    ["angels-chrome-smelting-2"] = get_casting_overrides("chrome"),
    ["angels-chrome-smelting-3"] = get_casting_overrides("chrome"),

    ["angels-platinum-smelting-1"] = get_casting_overrides("platinum"),
    ["angels-platinum-smelting-2"] = get_casting_overrides("platinum"),
    ["angels-platinum-smelting-3"] = get_casting_overrides("platinum"),

    ["angels-titanium-smelting-1"] = get_casting_overrides("titanium"),
    ["angels-titanium-smelting-2"] = get_casting_overrides("titanium"),
    ["angels-titanium-smelting-3"] = get_casting_overrides("titanium"),
}

-- Powder Metallurgy
if angelsmods.trigger.early_sintering_oven then
    technologies["powder-metallurgy-1"] = { tier = 1, prog_tier = 1, icon_name = "powder-metallurgy" }
    technologies["powder-metallurgy-2"] = { tier = 2, prog_tier = 2, icon_name = "powder-metallurgy" }
    technologies["powder-metallurgy-3"] = { tier = 3, prog_tier = 3, icon_name = "powder-metallurgy" }
    technologies["powder-metallurgy-4"] = { tier = 4, prog_tier = 4, icon_name = "powder-metallurgy" }
    technologies["powder-metallurgy-5"] = { tier = 5, prog_tier = 5, icon_name = "powder-metallurgy" }
else
    technologies["powder-metallurgy-2"] = { tier = 1, prog_tier = 2, icon_name = "powder-metallurgy-special-vanilla", technology_icon_mipmaps = 4 }
    technologies["powder-metallurgy-3"] = { tier = 2, prog_tier = 3, icon_name = "powder-metallurgy-special-vanilla", technology_icon_mipmaps = 4 }
    technologies["powder-metallurgy-4"] = { tier = 3, prog_tier = 4, icon_name = "powder-metallurgy" }
    technologies["powder-metallurgy-5"] = { tier = 4, prog_tier = 5, icon_name = "powder-metallurgy" }
end

-- For Angel's Smelting with new seprated casting/smelting technology rework
if reskins.lib.version.is_newer(mods["angelssmelting"], "0.6.14") then
    technologies["angels-copper-smelting-2"] = get_smelting_overrides("copper")
    technologies["angels-copper-casting-2"] = get_casting_overrides("copper")
    technologies["angels-copper-smelting-3"] = get_smelting_overrides("copper")
    technologies["angels-copper-casting-3"] = get_casting_overrides("copper")

    technologies["angels-iron-smelting-2"] = get_smelting_overrides("iron")
    technologies["angels-iron-casting-2"] = get_casting_overrides("iron")
    technologies["angels-iron-smelting-3"] = get_smelting_overrides("iron")
    technologies["angels-iron-casting-3"] = get_casting_overrides("iron")

    technologies["angels-lead-smelting-2"] = get_smelting_overrides("lead")
    technologies["angels-lead-casting-2"] = get_casting_overrides("lead")
    technologies["angels-lead-smelting-3"] = get_smelting_overrides("lead")
    technologies["angels-lead-casting-3"] = get_casting_overrides("lead")

    technologies["angels-nickel-smelting-2"] = get_smelting_overrides("nickel")
    technologies["angels-nickel-casting-2"] = get_casting_overrides("nickel")
    technologies["angels-nickel-smelting-3"] = get_smelting_overrides("nickel")
    technologies["angels-nickel-casting-3"] = get_casting_overrides("nickel")

    technologies["angels-silicon-smelting-2"] = get_smelting_overrides("silicon")
    technologies["angels-silicon-casting-2"] = get_casting_overrides("silicon")
    technologies["angels-silicon-smelting-3"] = get_smelting_overrides("silicon")
    technologies["angels-silicon-casting-3"] = get_casting_overrides("silicon")

    technologies["angels-tin-smelting-2"] = get_smelting_overrides("tin")
    technologies["angels-tin-casting-2"] = get_casting_overrides("tin")
    technologies["angels-tin-smelting-3"] = get_smelting_overrides("tin")
    technologies["angels-tin-casting-3"] = get_casting_overrides("tin")

    technologies["angels-aluminium-smelting-2"] = get_smelting_overrides("aluminium")
    technologies["angels-aluminium-casting-2"] = get_casting_overrides("aluminium")
    technologies["angels-aluminium-smelting-3"] = get_smelting_overrides("aluminium")
    technologies["angels-aluminium-casting-3"] = get_casting_overrides("aluminium")

    technologies["angels-cobalt-smelting-2"] = get_smelting_overrides("cobalt")
    technologies["angels-cobalt-casting-2"] = get_casting_overrides("cobalt")
    technologies["angels-cobalt-smelting-3"] = get_smelting_overrides("cobalt")
    technologies["angels-cobalt-casting-3"] = get_casting_overrides("cobalt")

    technologies["angels-gold-smelting-2"] = get_smelting_overrides("gold")
    technologies["angels-gold-casting-2"] = get_casting_overrides("gold")
    technologies["angels-gold-smelting-3"] = get_smelting_overrides("gold")
    technologies["angels-gold-casting-3"] = get_casting_overrides("gold")

    technologies["angels-manganese-smelting-2"] = get_smelting_overrides("manganese")
    technologies["angels-manganese-casting-2"] = get_casting_overrides("manganese")
    technologies["angels-manganese-smelting-3"] = get_smelting_overrides("manganese")
    technologies["angels-manganese-casting-3"] = get_casting_overrides("manganese")

    technologies["angels-silver-smelting-2"] = get_smelting_overrides("silver")
    technologies["angels-silver-casting-2"] = get_casting_overrides("silver")
    technologies["angels-silver-smelting-3"] = get_smelting_overrides("silver")
    technologies["angels-silver-casting-3"] = get_casting_overrides("silver")

    technologies["angels-zinc-smelting-2"] = get_smelting_overrides("zinc")
    technologies["angels-zinc-casting-2"] = get_casting_overrides("zinc")
    technologies["angels-zinc-smelting-3"] = get_smelting_overrides("zinc")
    technologies["angels-zinc-casting-3"] = get_casting_overrides("zinc")

    technologies["angels-chrome-smelting-2"] = get_smelting_overrides("chrome")
    technologies["angels-chrome-casting-2"] = get_casting_overrides("chrome")
    technologies["angels-chrome-smelting-3"] = get_smelting_overrides("chrome")
    technologies["angels-chrome-casting-3"] = get_casting_overrides("chrome")

    technologies["angels-platinum-smelting-2"] = get_smelting_overrides("platinum")
    technologies["angels-platinum-casting-2"] = get_casting_overrides("platinum")
    technologies["angels-platinum-smelting-3"] = get_smelting_overrides("platinum")
    technologies["angels-platinum-casting-3"] = get_casting_overrides("platinum")

    technologies["angels-titanium-smelting-2"] = get_smelting_overrides("titanium")
    technologies["angels-titanium-casting-2"] = get_casting_overrides("titanium")
    technologies["angels-titanium-smelting-3"] = get_smelting_overrides("titanium")
    technologies["angels-titanium-casting-3"] = get_casting_overrides("titanium")
end

-- Check for special vanilla and override the powder metallurgy technology icons
if angelsmods and angelsmods.functions.is_special_vanilla() then
    technologies["powder-metallurgy-2"] = { tier = 1, prog_tier = 2, icon_name = "powder-metallurgy-special-vanilla", technology_icon_mipmaps = 4 }
    technologies["powder-metallurgy-3"] = { tier = 2, prog_tier = 3, icon_name = "powder-metallurgy-special-vanilla", technology_icon_mipmaps = 4 }
    technologies["powder-metallurgy-4"] = { tier = 3, prog_tier = 4, icon_name = "powder-metallurgy-special-vanilla", technology_icon_mipmaps = 4 }
    technologies["powder-metallurgy-5"] = { tier = 4, prog_tier = 5, icon_name = "powder-metallurgy-special-vanilla", technology_icon_mipmaps = 4 }
end

-- Check if we're using Angel's material colors
if reskins.lib.settings.get_value("reskins-angels-use-angels-material-colors") then
    technologies["bob-armor-making-4"] = { subgroup = "armor", flat_icon = true, technology_icon_mipmaps = 4 }
    technologies["bob-power-armor-4"] = { subgroup = "armor", flat_icon = true, technology_icon_mipmaps = 4 }
    technologies["bob-power-armor-5"] = { subgroup = "armor", flat_icon = true, technology_icon_mipmaps = 4 }
end

reskins.internal.create_icons_from_list(technologies, inputs)
