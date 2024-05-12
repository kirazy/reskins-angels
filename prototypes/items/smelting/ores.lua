-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.items) then return end
if not (mods["bobplates"] or (angelsmods and angelsmods.industries and angelsmods.industries.overhaul)) then return end

---@class OreSpriteVariationsParameters
---@field key "angels"|"lib"
---@field subfolder string # e.g. "smelting/ores"; a folder under reskins[key].directory .. "/graphics/icons"
---@field num_variations? integer # Default 4.
---@field is_light? boolean # Default `nil`.

---Dictionary of ore names and their sprite variation parameters.
---Ore names are shared with the name of the icon subfolder and file.
---@type { [string]: OreSpriteVariationsParameters }
local ores = {
    -- ["angels-ore2"]   = { key = "angels", subfolder = "smelting/ores" }, -- Jivolite
    -- ["angels-ore4"]   = { key = "angels", subfolder = "smelting/ores" }, -- Crotinnium
    -- ["chrome-ore"]    = { key = "angels", subfolder = "smelting/ores" },
    ["lead-ore"]      = { key = "angels", subfolder = "smelting/ores" },
    -- ["manganese-ore"] = { key = "angels", subfolder = "smelting/ores" },
    -- ["platinum-ore"]  = { key = "angels", subfolder = "smelting/ores" },
    ["rutile-ore"]    = { key = "angels", subfolder = "smelting/ores" },                -- Titanium (dark purple)
    ["thorium-ore"]   = { key = "angels", subfolder = "smelting/ores", num_variations = 4, is_light = true }, -- Even though Angel's now fixed the issue, we make it green in AR:BM and need to put it back
    ["tin-ore"]       = { key = "angels", subfolder = "smelting/ores", num_variations = 8 },                -- (green)
}

-- TODO: Not implemented. Needs sprites.
if reskins.lib.settings.get_value("reskins-angels-use-vanilla-style-ores") then
    table.insert(ores, {
        -- ["angels-ore1"] = { key = "angels", subfolder = "smelting/ores" }, -- Saphirite
        -- ["angels-ore3"] = { key = "angels", subfolder = "smelting/ores" }, -- Stiratite
        -- ["angels-ore5"] = { key = "angels", subfolder = "smelting/ores" }, -- Rubyte
        -- ["angels-ore6"] = { key = "angels", subfolder = "smelting/ores" }, -- Bobmonium
    })
end

-- Check if we're using Angel's material colors
if reskins.lib.settings.get_value("reskins-angels-use-angels-material-colors") == false then
    ores["lead-ore"] = { key = "lib", subfolder = "shared/ores" }
    ores["tin-ore"]  = { key = "lib", subfolder = "shared/ores", num_variations = 8 }
end

if not mods["bobores"] or not mods["reskins-bobs"] then
    ores["bauxite-ore"]  = { key = "lib", subfolder = "shared/ores", num_variations = 8 }
    ores["cobalt-ore"]   = { key = "lib", subfolder = "shared/ores" }
    ores["gold-ore"]     = { key = "lib", subfolder = "shared/ores" }
    ores["nickel-ore"]   = { key = "lib", subfolder = "shared/ores" } -- 408073
    ores["quartz"]       = { key = "lib", subfolder = "shared/ores" } -- 999999
    ores["silver-ore"]   = { key = "lib", subfolder = "shared/ores" }
    ores["tungsten-ore"] = { key = "lib", subfolder = "shared/ores", num_variations = 8 }
    ores["zinc-ore"]     = { key = "lib", subfolder = "shared/ores" }
end

for ore_name, parameters in pairs(ores) do
    local item = data.raw.item[ore_name]
    if not item then goto continue end

    ---@type data.IconData[]
    local icon_data = { {
        icon = reskins[parameters.key].directory .. "/graphics/icons/" .. parameters.subfolder .. "/" .. ore_name .. "/" .. ore_name .. ".png",
        icon_size = 64,
        icon_miumaps = 4,
        scale = 0.5,
    } }

    local pictures = reskins.internal.create_sprite_variations(parameters.key, parameters.subfolder,
        ore_name, parameters.num_variations or 4, parameters.is_light)

    reskins.lib.icons.assign_icons_to_prototype_and_related_prototypes(ore_name, "item", icon_data, pictures)

    ::continue::
end

-- Setup recipe bases

---Creates the base icon layer for the Ore Sorting Machine ore recipes.
---@return data.IconData
local function make_sorting_icon_base()
    return {
        icon = "__angelsrefining__/graphics/icons/sort-icon.png",
        icon_size = 32,
        icon_mipmaps = 0,
    }
end

---Creates the base icon layer for the Crystalizer slag processing recipes.
---@return data.IconData[]
local function make_slag_processing_icon_base()
    return {
        {
            icon = "__angelsrefining__/graphics/icons/angels-liquid/liquid-recipe-base.png",
            icon_size = 600,
            icon_mipmaps = 0,
            tint = util.color("404040b2"),
        },
        {
            icon = "__angelsrefining__/graphics/icons/angels-liquid/liquid-recipe-top.png",
            icon_size = 600,
            icon_mipmaps = 0,
            tint = util.color("ca6311"),
        },
        {
            icon = "__angelsrefining__/graphics/icons/angels-liquid/liquid-recipe-mid.png",
            icon_size = 600,
            icon_mipmaps = 0,
            tint = util.color("613414"),
        },
        {
            icon = "__angelsrefining__/graphics/icons/angels-liquid/liquid-recipe-bot.png",
            icon_size = 600,
            icon_mipmaps = 0,
            tint = util.color("613414"),
        },
    }
end

local shift = { 10, 10 }
local scale = 0.5

-- A map of recipe names to the icon sources used to create a combined icon. 
-- The first entry in each IconSources is the first layer of the created icon.
---@type { [string]: IconSources }
local recipe_icon_source_map = {
    -- Ore Sorting Machine Recipes

    -- Lead
    ["angelsore-crushed-mix3-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "lead-ore", type_name = "item", shift = shift, scale = scale },
    },
    -- Tin
    ["angelsore-crushed-mix4-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "tin-ore", type_name = "item", shift = shift, scale = scale },
    },
    -- Silicon
    ["angelsore-chunk-mix1-processing"]   = {
        { icon_datum = make_sorting_icon_base() },
        { name = "quartz", type_name = "item", shift = shift, scale = scale },
        { name = "quartz", type_name = "item", shift = shift, scale = scale },
    },
    -- Nickel
    ["angelsore-chunk-mix2-processing"]   = {
        { icon_datum = make_sorting_icon_base() },
        { name = "nickel-ore", type_name = "item", shift = shift, scale = scale },
    },
    -- Aluminium
    ["angelsore-chunk-mix3-processing"]   = {
        { icon_datum = make_sorting_icon_base() },
        { name = "bauxite-ore", type_name = "item", shift = shift, scale = scale },
    },
    -- Zinc
    ["angelsore-chunk-mix4-processing"]   = {
        { icon_datum = make_sorting_icon_base() },
        { name = "zinc-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- -- Fluorite
    -- ["angelsore-chunk-mix5-processing"]   = {
    --     { icon_datum = make_sorting_icon_base() },
    --     { name = "fluorite-ore", type_name = "item", shift = shift, scale = scale },
    -- },
    -- -- Manganese?
    -- ["angelsore-chunk-mix6-processing"]   = {
    --     { icon_datum = make_sorting_icon_base() },
    --     { name = "manganese-ore", type_name = "item", shift = shift, scale = scale },
    -- },

    -- Titanium
    ["angelsore-crystal-mix1-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "rutile-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- Gold
    ["angelsore-crystal-mix2-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "gold-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- Cobalt
    ["angelsore-crystal-mix3-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "cobalt-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- Silver
    ["angelsore-crystal-mix4-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "silver-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- Uranium
    ["angelsore-crystal-mix5-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "uranium-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- Thorium
    ["angelsore-crystal-mix6-processing"] = {
        { icon_datum = make_sorting_icon_base() },
        { name = "thorium-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- Tungsten
    ["angelsore-pure-mix1-processing"]    = {
        { icon_datum = make_sorting_icon_base() },
        { name = "tungsten-ore", type_name = "item", shift = shift, scale = scale },
    },

    -- -- Platinum
    -- ["angelsore-pure-mix2-processing"]    = {
    --     { icon_datum = make_sorting_icon_base() },
    --     { name = "platinum-ore", type_name = "item", shift = shift, scale = scale },
    -- },

    -- -- Chrome?
    -- ["angelsore-pure-mix3-processing"]    = {
    --     { icon_datum = make_sorting_icon_base() },
    --     { name = "chrome-ore", type_name = "item", shift = shift, scale = scale },
    -- },
}

-- Build Crystalizer slag processing recipes
local slag_processing_recipe_names = {
    "slag-processing-2",
    "slag-processing-3",
    "slag-processing-4",
    "slag-processing-5",
    "slag-processing-6",
    "slag-processing-7",
    "slag-processing-8",
    "slag-processing-9",
}

---@type data.Vector[]
local slag_recipe_shifts = {
    { -11.5, 12 },
    { 11.5, 12 },
    { 0, 12 },
}

for _, name in pairs(slag_processing_recipe_names) do
    -- Check the recipe exists
    local recipe = data.raw.recipe[name]
    if not recipe then goto continue end

    ---@type data.ProductPrototype[]
    local recipe_results = recipe.normal and recipe.normal.results or recipe.results

    -- Build icon overlays based on recipe ingredients
    if recipe_results[1].name ~= "angels-void" then
        -- Add the base layer icon source.
        recipe_icon_source_map[name] = { { icon_data = make_slag_processing_icon_base() } }

        -- Add up to three products.
        for i, product in pairs(recipe_results) do
            -- More than 3 products is unhandled, but also not expected in the first place.
            if i > 3 then goto continue end

            ---@type PrototypeIconSource
            local icon_source = {
                name = product.name,
                type_name = "item",
                shift = slag_recipe_shifts[i],
                scale = 0.32,
            }

            table.insert(recipe_icon_source_map[name], icon_source)
        end
    end

    ::continue::
end

reskins.lib.icons.create_and_assign_combined_icons_from_sources_to_recipe(recipe_icon_source_map)
