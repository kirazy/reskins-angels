-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.refining.items) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Icons = require("__reskins-assets-api__.assets.angels.items.icons")

---Gets the numeral of the given `tier`, in the style of Angel's refining.
---@param tier integer The number of the numeral.
---@return IconData[]
local function numeral(tier)
	return reskins.angels.num_tier(tier, "refining")
end

---Gets the definition of a recipe with the icon of the given `fluid` and the numeral of the given `tier`.
---@param fluid string The name of the fluid.
---@param tier integer The number of the numeral.
---@return TieredIconDefinition
local function mud_water(fluid, tier)
	return { sources = { { name = fluid, type_name = "fluid" } }, label = numeral(tier) }
end

_framework.tiers.assign_icons_with_tier_labels("item", {
	["angels-slag"] = { composition = Icons.get_slag_icon_composition() },
	["angels-solid-limestone"] = { composition = Icons.get_solid_limestone_icon_composition() },
})

_framework.tiers.assign_icons_with_tier_labels("recipe", {
	-- Mud water progression
	["angels-water-heavy-mud"] = mud_water("angels-water-heavy-mud", 1),
	["angels-water-concentrated-mud"] = mud_water("angels-water-concentrated-mud", 2),
	["angels-water-light-mud"] = mud_water("angels-water-light-mud", 3),
	["angels-water-thin-mud"] = mud_water("angels-water-thin-mud", 4),
	["angels-water-saline"] = mud_water("angels-water-saline", 5),
})
