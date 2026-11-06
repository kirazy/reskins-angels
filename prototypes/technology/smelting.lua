-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.smelting.technologies) then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}

local Armor = require("__reskins-assets-api__.assets.angels.technologies.armor")
local Casting = require("__reskins-assets-api__.assets.angels.technologies.casting")
local Metallurgy = require("__reskins-assets-api__.assets.angels.technologies.metallurgy")
local OreProcessingMachine = require("__reskins-assets-api__.assets.angels.technologies.ore-processing-machine")
local PelletPress = require("__reskins-assets-api__.assets.angels.technologies.pellet-press")
local Smelting = require("__reskins-assets-api__.assets.angels.technologies.smelting")
local StrandCasting = require("__reskins-assets-api__.assets.angels.technologies.strand-casting")

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

---Gets the definition of a technology with the smelting icon of the given `material`.
---@param material string The material.
---@return TieredIconDefinition
local function smelting(material)
	return { icon_data = Smelting.get_icon({ material = material }) }
end

---@type table<string, TieredIconDefinition>
local technologies = {
	-- Metallurgy
	["angels-metallurgy-1"] = technology(Metallurgy, 1),
	["angels-metallurgy-2"] = technology(Metallurgy, 2),
	["angels-metallurgy-3"] = technology(Metallurgy, 3),
	["angels-metallurgy-4"] = technology(Metallurgy, 4),
	["angels-metallurgy-5"] = technology(Metallurgy, 5),

	-- Strand Casting
	["angels-strand-casting-1"] = technology(StrandCasting, 1, 2),
	["angels-strand-casting-2"] = technology(StrandCasting, 2, 3),
	["angels-strand-casting-3"] = technology(StrandCasting, 3, 4),
	["angels-strand-casting-4"] = technology(StrandCasting, 4, 5),

	-- Ore Processing
	["angels-ore-processing-1"] = technology(OreProcessingMachine, 1, 2),
	["angels-ore-processing-2"] = technology(PelletPress, 1, 3),
	["angels-ore-processing-3"] = technology(PelletPress, 2, 4),
	["angels-ore-processing-4"] = technology(PelletPress, 3, 5),
	["angels-ore-processing-5"] = technology(PelletPress, 4, 6),

	-- Smelting
	["angels-copper-smelting-1"] = casting("copper"),
	["angels-copper-smelting-2"] = smelting("copper"),
	["angels-copper-casting-2"] = casting("copper"),
	["angels-copper-smelting-3"] = smelting("copper"),
	["angels-copper-casting-3"] = casting("copper"),

	["angels-iron-smelting-1"] = casting("iron"),
	["angels-iron-smelting-2"] = smelting("iron"),
	["angels-iron-casting-2"] = casting("iron"),
	["angels-iron-smelting-3"] = smelting("iron"),
	["angels-iron-casting-3"] = casting("iron"),
	["angels-iron-casting-4"] = casting("iron"),

	["angels-lead-smelting-1"] = casting("lead"),
	["angels-lead-smelting-2"] = smelting("lead"),
	["angels-lead-casting-2"] = casting("lead"),
	["angels-lead-smelting-3"] = smelting("lead"),
	["angels-lead-casting-3"] = casting("lead"),

	["angels-nickel-smelting-1"] = casting("nickel"),
	["angels-nickel-smelting-2"] = smelting("nickel"),
	["angels-nickel-casting-2"] = casting("nickel"),
	["angels-nickel-smelting-3"] = smelting("nickel"),
	["angels-nickel-casting-3"] = casting("nickel"),

	["angels-silicon-smelting-1"] = casting("silicon"),
	["angels-silicon-smelting-2"] = smelting("silicon"),
	["angels-silicon-casting-2"] = casting("silicon"),
	["angels-silicon-smelting-3"] = smelting("silicon"),

	["angels-solder-smelting-1"] = casting("solder"),
	["angels-solder-smelting-2"] = casting("solder"),
	["angels-solder-smelting-3"] = casting("solder"),

	["angels-tin-smelting-1"] = casting("tin"),
	["angels-tin-smelting-2"] = smelting("tin"),
	["angels-tin-casting-2"] = casting("tin"),
	["angels-tin-smelting-3"] = smelting("tin"),
	["angels-tin-casting-3"] = casting("tin"),

	["angels-aluminium-smelting-1"] = casting("aluminium"),
	["angels-aluminium-smelting-2"] = smelting("aluminium"),
	["angels-aluminium-casting-2"] = casting("aluminium"),
	["angels-aluminium-smelting-3"] = smelting("aluminium"),
	["angels-aluminium-casting-3"] = casting("aluminium"),

	["angels-cobalt-smelting-1"] = casting("cobalt"),
	["angels-cobalt-smelting-2"] = smelting("cobalt"),
	["angels-cobalt-casting-2"] = casting("cobalt"),
	["angels-cobalt-smelting-3"] = smelting("cobalt"),
	["angels-cobalt-casting-3"] = casting("cobalt"),

	["angels-gold-smelting-1"] = casting("gold"),
	["angels-gold-smelting-2"] = smelting("gold"),
	["angels-gold-casting-2"] = casting("gold"),
	["angels-gold-smelting-3"] = smelting("gold"),
	["angels-gold-casting-3"] = casting("gold"),

	["angels-glass-smelting-1"] = casting("glass"),
	["angels-glass-smelting-2"] = casting("glass"),
	["angels-glass-smelting-3"] = casting("glass"),

	["angels-manganese-smelting-1"] = casting("manganese"),
	["angels-manganese-smelting-2"] = smelting("manganese"),
	["angels-manganese-casting-2"] = casting("manganese"),
	["angels-manganese-smelting-3"] = smelting("manganese"),
	["angels-manganese-casting-3"] = casting("manganese"),

	["angels-silver-smelting-1"] = casting("silver"),
	["angels-silver-smelting-2"] = smelting("silver"),
	["angels-silver-casting-2"] = casting("silver"),
	["angels-silver-smelting-3"] = smelting("silver"),
	["angels-silver-casting-3"] = casting("silver"),

	["angels-steel-smelting-1"] = casting("steel"),
	["angels-steel-smelting-2"] = casting("steel"),
	["angels-steel-smelting-3"] = casting("steel"),
	["angels-steel-smelting-4"] = casting("steel"),

	["angels-zinc-smelting-1"] = casting("zinc"),
	["angels-zinc-smelting-2"] = smelting("zinc"),
	["angels-zinc-casting-2"] = casting("zinc"),
	["angels-zinc-smelting-3"] = smelting("zinc"),
	["angels-zinc-casting-3"] = casting("zinc"),

	["angels-chrome-smelting-1"] = casting("chrome"),
	["angels-chrome-smelting-2"] = smelting("chrome"),
	["angels-chrome-casting-2"] = casting("chrome"),
	["angels-chrome-smelting-3"] = smelting("chrome"),
	["angels-chrome-casting-3"] = casting("chrome"),

	["angels-platinum-smelting-1"] = casting("platinum"),
	["angels-platinum-smelting-2"] = smelting("platinum"),
	["angels-platinum-casting-2"] = casting("platinum"),
	["angels-platinum-smelting-3"] = smelting("platinum"),
	["angels-platinum-casting-3"] = casting("platinum"),

	["angels-titanium-smelting-1"] = casting("titanium"),
	["angels-titanium-smelting-2"] = smelting("titanium"),
	["angels-titanium-casting-2"] = casting("titanium"),
	["angels-titanium-smelting-3"] = smelting("titanium"),
	["angels-titanium-casting-3"] = casting("titanium"),
}

-- Check if we're using Angel's material colors
if _framework.settings.get_value("reskins-angels-use-angels-material-colors") then
	technologies["bob-power-armor-4"] = { icon_data = Armor.get_power_armor_4_icon() }
	technologies["bob-power-armor-5"] = { icon_data = Armor.get_power_armor_5_icon() }
end

_framework.tiers.assign_icons_with_tier_labels("technology", technologies)
