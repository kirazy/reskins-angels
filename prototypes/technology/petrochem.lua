-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.petrochem.technologies) then
	return
end

local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local AdvancedGasProcessing = require("__reskins-assets-api__.assets.angels.technologies.advanced-gas-processing")
local FlareStack = require("__reskins-assets-api__.assets.angels.technologies.flare-stack")
local GasProcessing = require("__reskins-assets-api__.assets.angels.technologies.gas-processing")

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

_framework.tiers.assign_icons_with_tier_labels("technology", {
	-- Gas Processing (Gas Refinery)
	["angels-gas-processing"] = technology(GasProcessing, 1, 2),

	-- Flare stack
	["angels-flare-stack"] = { icon_data = FlareStack.get_icon() },

	-- Advanced Gas Processing
	["angels-advanced-gas-processing"] = technology(AdvancedGasProcessing, 1, 3),
})
