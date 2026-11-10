-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework
---@using Reskins.SpriteUtils

if not mods["angelssmelting"] then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local AngelsOres = require("__reskins-assets-api__.assets.angels.items.ores")
local BobsOres = require("__reskins-assets-api__.assets.bobs.items.ores")
local SpaceAgeIcons = require("__reskins-assets-api__.assets.base.items.space-age-icons")

---Gets the definition of the given `ore` in the Angel's assets, with its picture variations.
---@param ore string The ore.
---@return TieredIconDefinition
local function angels_ore(ore)
	return { composition = AngelsOres.get_icon_composition({ ore = ore }) }
end

---Gets the definition of the given `ore` in the Bob's assets, with its picture variations.
---@param ore string The ore.
---@return TieredIconDefinition
local function bobs_ore(ore)
	return { composition = BobsOres.get_icon_composition({ ore = ore }) }
end

---@type table<string, TieredIconDefinition>
local items = {
	["angels-lead-ore"] = angels_ore("lead-ore"), -- A cooler black than Bob's
	["bob-lead-ore"] = angels_ore("lead-ore"),
	["angels-rutile-ore"] = angels_ore("rutile-ore"), -- Titanium (dark purple)
	["bob-rutile-ore"] = angels_ore("rutile-ore"),
	["angels-tin-ore"] = angels_ore("tin-ore"), -- (green)
	["bob-tin-ore"] = angels_ore("tin-ore"),

	-- These ores use the artwork of Bob's mods.
	["angels-bauxite-ore"] = bobs_ore("bauxite-ore"),
	["bob-bauxite-ore"] = bobs_ore("bauxite-ore"),
	["angels-cobalt-ore"] = bobs_ore("cobalt-ore"),
	["bob-cobalt-ore"] = bobs_ore("cobalt-ore"),
	["angels-gold-ore"] = bobs_ore("gold-ore"),
	["bob-gold-ore"] = bobs_ore("gold-ore"),
	["angels-nickel-ore"] = bobs_ore("nickel-ore"),
	["bob-nickel-ore"] = bobs_ore("nickel-ore"),
	["angels-quartz"] = bobs_ore("quartz"),
	["bob-quartz"] = bobs_ore("quartz"),
	["angels-silver-ore"] = bobs_ore("silver-ore"),
	["bob-silver-ore"] = bobs_ore("silver-ore"),
	["angels-tungsten-ore"] = bobs_ore("tungsten-ore"),
	["angels-zinc-ore"] = bobs_ore("zinc-ore"),
	["bob-zinc-ore"] = bobs_ore("zinc-ore"),
}

-- Bob's mods use the name of the tungsten ore from Space Age. When Space Age is loaded, the ore uses the icon from
-- Space Age.
if mods["bobores"] and mods["space-age"] then
	items["tungsten-ore"] = { composition = SpaceAgeIcons.get_tungsten_ore_icon_composition() }
elseif mods["bobores"] then
	items["tungsten-ore"] = bobs_ore("tungsten-ore")
end

items["angels-thorium-ore"] = { composition = AngelsOres.get_thorium_ore_icon_composition() }
items["bob-thorium-ore"] = { composition = AngelsOres.get_thorium_ore_icon_composition() }

_framework.tiers.assign_icons_with_tier_labels("item", items)

---The base layer of the ore sorting recipes for the ore sorting facility.
---@type IconDatumSource
local sorting_base = {
	icon_datum = {
		icon = "__angelsrefininggraphics__/graphics/icons/sort-icon.png",
		icon_size = 32,
	},
}

---The placement of the ore on an ore sorting recipe.
---@type Transform
local ore_placement = { scale = 0.5, shift = { 10, 10 } }

---Gets the definition of an ore sorting recipe that makes the ore of the given `name` in Angel's mods.
---@param name string The name of the ore in Angel's mods, which `angelsmods.functions.get_ore_name` converts.
---@return TieredIconDefinition
local function sorting(name)
	return {
		sources = {
			sorting_base,
			{ name = angelsmods.functions.get_ore_name(name), type_name = "item", transform = ore_placement },
		},
	}
end

---@type table<string, TieredIconDefinition>
local recipes = {
	-- Ore Sorting Machine Recipes
	["angels-ore-crushed-mix3-processing"] = sorting("angels-lead-ore"),
	["angels-ore-crushed-mix4-processing"] = sorting("angels-tin-ore"),
	["angels-ore-chunk-mix1-processing"] = sorting("angels-quartz"),
	["angels-ore-chunk-mix2-processing"] = sorting("angels-nickel-ore"),
	["angels-ore-chunk-mix3-processing"] = sorting("angels-bauxite-ore"),
	["angels-ore-chunk-mix4-processing"] = sorting("angels-zinc-ore"),
	["angels-ore-crystal-mix1-processing"] = sorting("angels-rutile-ore"),
	["angels-ore-crystal-mix2-processing"] = sorting("angels-gold-ore"),
	["angels-ore-crystal-mix3-processing"] = sorting("angels-cobalt-ore"),
	["angels-ore-crystal-mix4-processing"] = sorting("angels-silver-ore"),
	["angels-ore-crystal-mix5-processing"] = sorting("uranium-ore"),
	["angels-ore-crystal-mix6-processing"] = sorting("angels-thorium-ore"),
	["angels-ore-pure-mix1-processing"] = sorting("angels-tungsten-ore"),
}

---The base layers of the slag processing recipes for the crystallizer.
---@type IconDataSource
local slag_processing_base = {
	icon_data = {
		{
			icon = "__angelsrefininggraphics__/graphics/icons/angels-liquid/liquid-recipe-base.png",
			icon_size = 600,
			tint = util.color("#404040b2"),
		},
		{
			icon = "__angelsrefininggraphics__/graphics/icons/angels-liquid/liquid-recipe-top.png",
			icon_size = 600,
			tint = util.color("#ca6311"),
		},
		{
			icon = "__angelsrefininggraphics__/graphics/icons/angels-liquid/liquid-recipe-mid.png",
			icon_size = 600,
			tint = util.color("#613414"),
		},
		{
			icon = "__angelsrefininggraphics__/graphics/icons/angels-liquid/liquid-recipe-bot.png",
			icon_size = 600,
			tint = util.color("#613414"),
		},
	},
}

---The placements of the first 3 products on a slag processing recipe, in the order of the products.
---@type Transform[]
local product_placements = {
	{ scale = 0.32, shift = { -11.5, 12 } },
	{ scale = 0.32, shift = { 11.5, 12 } },
	{ scale = 0.32, shift = { 0, 12 } },
}

-- Build Crystallizer slag processing recipes
for _, name in pairs({
	"angels-slag-processing-2",
	"angels-slag-processing-3",
	"angels-slag-processing-4",
	"angels-slag-processing-5",
	"angels-slag-processing-6",
}) do
	local recipe = data.raw["recipe"][name]

	if recipe and recipe.results[1].name ~= "angels-void" then
		---@type IconSource[]
		local sources = { slag_processing_base }

		for index = 1, math.min(#recipe.results, #product_placements) do
			local product = recipe.results[index]
			sources[#sources + 1] = { name = product.name, type_name = product.type, transform = product_placements[index] }
		end

		recipes[name] = { sources = sources }
	end
end

-- Assign the recipes after the items. A composite recipe reads the icons of the items.
_framework.tiers.assign_icons_with_tier_labels("recipe", recipes)
