-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local Casting = require("__reskins-assets-api__.assets.angels.technologies.casting")
local PowderMetallurgy = require("__reskins-assets-api__.assets.angels.technologies.powder-metallurgy")
local PowderMetallurgySpecialVanilla =
	require("__reskins-assets-api__.assets.angels.technologies.powder-metallurgy-special-vanilla")

---Gets the definition of a technology with the icon of the given `module`, in the tint of the tier given by `tier` and
---`prog_tier`.
---@param module { get_icon: fun(params: { tint: Color }): SafeIconData[] } The catalog module of the icon.
---@param tier Tier The traditional tier.
---@param prog_tier? Tier The progression tier, if any.
---@return TieredIconDefinition
local function technology(module, tier, prog_tier)
	local tint = _framework.tiers.get_tint(_framework.tiers.get_tier(tier, prog_tier))

	return { icon_data = module.get_icon({ tint = tint }) }
end

---Gets the definition of a technology with the casting icon of the given `material`.
---@param material string The material.
---@return TieredIconDefinition
local function casting(material)
	return { icon_data = Casting.get_icon({ material = material }) }
end

---@type table<string, TieredIconDefinition>
local technologies = {
	["angels-brass-smelting-1"] = casting("brass"),
	["angels-brass-smelting-2"] = casting("brass"),
	["angels-brass-smelting-3"] = casting("brass"),

	["angels-nitinol-smelting-1"] = casting("nitinol"),

	["angels-gunmetal-smelting-1"] = casting("gunmetal"),

	["angels-invar-smelting-1"] = casting("invar"),

	["angels-cobalt-steel-smelting-1"] = casting("cobalt-steel"),

	["angels-bronze-smelting-1"] = casting("bronze"),
	["angels-bronze-smelting-2"] = casting("bronze"),
	["angels-bronze-smelting-3"] = casting("bronze"),

	["angels-tungsten-smelting-1"] = casting("tungsten"),
	["angels-tungsten-smelting-2"] = casting("tungsten"),
	["angels-tungsten-smelting-3"] = casting("tungsten"),
}

-- Powder Metallurgy
-- Powder metallurgy 1 is reskinned when it is hidden as well.
technologies["angels-powder-metallurgy-1"] = technology(PowderMetallurgy, 1, 1)

if angelsmods.trigger.early_sintering_oven then
	technologies["angels-powder-metallurgy-2"] = technology(PowderMetallurgy, 2, 2)
	technologies["angels-powder-metallurgy-3"] = technology(PowderMetallurgy, 3, 3)
	technologies["angels-powder-metallurgy-4"] = technology(PowderMetallurgy, 4, 4)
	technologies["angels-powder-metallurgy-5"] = technology(PowderMetallurgy, 5, 5)
else
	technologies["angels-powder-metallurgy-2"] = technology(PowderMetallurgySpecialVanilla, 1, 2)
	technologies["angels-powder-metallurgy-3"] = technology(PowderMetallurgySpecialVanilla, 2, 3)
	technologies["angels-powder-metallurgy-4"] = technology(PowderMetallurgy, 3, 4)
	technologies["angels-powder-metallurgy-5"] = technology(PowderMetallurgy, 4, 5)
end

-- Check for special vanilla and override the powder metallurgy technology icons
if angelsmods and angelsmods.functions.is_special_vanilla() then
	technologies["angels-powder-metallurgy-2"] = technology(PowderMetallurgySpecialVanilla, 1, 2)
	technologies["angels-powder-metallurgy-3"] = technology(PowderMetallurgySpecialVanilla, 2, 3)
	technologies["angels-powder-metallurgy-4"] = technology(PowderMetallurgySpecialVanilla, 3, 4)
	technologies["angels-powder-metallurgy-5"] = technology(PowderMetallurgySpecialVanilla, 4, 5)
end

_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
