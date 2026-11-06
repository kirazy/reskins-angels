-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.refining.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local AdvancedOreRefining = require("__reskins-assets-api__.assets.angels.technologies.advanced-ore-refining")
local OreCrushing = require("__reskins-assets-api__.assets.angels.technologies.ore-crushing")
local OreFlotation = require("__reskins-assets-api__.assets.angels.technologies.ore-flotation")
local OreRefining = require("__reskins-assets-api__.assets.angels.technologies.ore-refining")
local WaterTreatment = require("__reskins-assets-api__.assets.angels.technologies.water-treatment")

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

---@type table<string, TieredIconDefinition>
local technologies = {
	-- Advanced ore refinining (Ore sorting facility)
	["angels-advanced-ore-refining-1"] = technology(AdvancedOreRefining, 2),
	["angels-advanced-ore-refining-2"] = technology(AdvancedOreRefining, 3),
	["angels-advanced-ore-refining-3"] = technology(AdvancedOreRefining, 4),
	["angels-advanced-ore-refining-4"] = technology(AdvancedOreRefining, 5),
	["angels-advanced-ore-refining-5"] = technology(AdvancedOreRefining, 6),

	-- Water treatment (Hydro plant)
	["angels-water-treatment"] = technology(WaterTreatment, 1),
	["angels-water-treatment-2"] = technology(WaterTreatment, 2),
	["angels-water-treatment-3"] = technology(WaterTreatment, 3),
	["angels-water-treatment-4"] = technology(WaterTreatment, 4),
	["angels-water-treatment-5"] = technology(WaterTreatment, 5),

	-- Mechanical refining (Ore crusher)
	["angels-ore-crushing"] = technology(OreCrushing, 1),

	-- Thermal refining (Ore refining)
	["angels-ore-refining"] = technology(OreRefining, 1, 4),

	-- Hydro-refining (Ore flotation cell)
	["angels-ore-floatation"] = technology(OreFlotation, 1, 2),

	-- The technologies of Mad Clown's mods take the base layer of the icon only.
	["clowns-ore-crushing"] = { icon_data = OreCrushing.get_icon() },
	["clowns-ore-floatation"] = { icon_data = OreFlotation.get_icon() },
	["clowns-ore-refining"] = { icon_data = OreRefining.get_icon() },
}

-- Sea Block compatibility
if mods["SeaBlock"] then
	technologies["angels-ore-crushing"] = technology(AdvancedOreRefining, 1)
end

_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
