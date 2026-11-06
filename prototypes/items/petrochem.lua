-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.petrochem.items) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { defines = require("__reskins-sprite-utils__.defines") }

local BobsIcons = require("__reskins-assets-api__.assets.bobs.items.icons")
local Icons = require("__reskins-assets-api__.assets.angels.items.icons")
local Pellets = require("__reskins-assets-api__.assets.angels.items.pellets")

---Gets the numeral of the given `tier`, in the style of Angel's petrochemistry.
---@param tier integer The number of the numeral.
---@return IconData[]
local function numeral(tier)
	return reskins.angels.num_tier(tier, "petrochem")
end

---@type table<string, TieredIconDefinition>
local items = {
	["angels-pellet-coke"] = { composition = Pellets.get_icon_composition({ material = "coke" }) },
}

---@type table<string, TieredIconDefinition>
local recipes = {}

-- Bob's rubber is the first of the rubber recipes.
if data.raw["recipe"]["bob-rubber"] then
	recipes["bob-rubber"] = { composition = Icons.get_rubber_icon_composition(), label = numeral(1) }
	recipes["angels-solid-rubber"] = { composition = Icons.get_rubber_icon_composition(), label = numeral(2) }
else
	items["angels-solid-rubber"] = { composition = Icons.get_rubber_icon_composition() }
end

-- Angel's resin uses the icon of Bob's resin.
if mods["reskins-bobs"] then
	items["angels-solid-resin"] = { composition = BobsIcons.get_resin_icon_composition() }
	recipes["bob-resin-wood"] = { composition = BobsIcons.get_resin_icon_composition(), label = numeral(1) }
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Assign the recipes after the items. A composite recipe reads the icons of the items.
recipes["angels-bio-resin-wood-reprocessing"] = {
	sources = {
		{ names = { "bob-resin", "angels-solid-resin" }, type_name = "item" },
		{ name = "wood", type_name = "item", transform = _sprite_utils.defines.icon_transforms.corners.northwest },
	},
}

_framework.tiers.assign_icons_with_tier_labels("recipe", recipes)
