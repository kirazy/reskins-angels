-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = {
	belt_animation_sets = require("__reskins-sprite-utils__.belt-animation-sets"),
	icons = require("__reskins-sprite-utils__.icons"),
}

local _defines = require("__reskins-assets-api__.api.defines")
local Applicators = require("__reskins-assets-api__.api.applicators")
local Splitter = require("__reskins-assets-api__.assets.base.entities.splitter")
local TransportBelt = require("__reskins-assets-api__.assets.base.entities.transport-belt")
local UndergroundBelt = require("__reskins-assets-api__.assets.base.entities.underground-belt")

-- Artisanal Reskins: Bob's Mods reskins the belt entities of the base game when it is loaded.
if mods["reskins-bobs"] then
	return
end

local reskin_entities = _framework.settings.get_value("reskins-framework-use-custom-tier-colors") == true

-- The transport belt, underground belt, and splitter of each tier. The entities are reskinned when the tier colors are
-- customized, and are otherwise given tier labels.
local belt_tiers = {
	{
		transport_belt = "transport-belt",
		underground_belt = "underground-belt",
		splitter = "splitter",
		tier = 1,
	},
	{
		transport_belt = "fast-transport-belt",
		underground_belt = "fast-underground-belt",
		splitter = "fast-splitter",
		tier = 2,
	},
	{
		transport_belt = "express-transport-belt",
		underground_belt = "express-underground-belt",
		splitter = "express-splitter",
		tier = 3,
	},
	{
		transport_belt = "turbo-transport-belt",
		underground_belt = "turbo-underground-belt",
		splitter = "turbo-splitter",
		tier = 4,
	},
}

for _, belt_tier in pairs(belt_tiers) do
	local belt = data.raw["transport-belt"][belt_tier.transport_belt]
	if not belt then
		goto continue
	end

	local underground = data.raw["underground-belt"][belt_tier.underground_belt]
	local splitter = data.raw["splitter"][belt_tier.splitter]

	if not reskin_entities then
		for _, entity in pairs({ belt, underground, splitter }) do
			_framework.tiers.add_tier_labels_to_prototype(belt_tier.tier, entity)
		end

		goto continue
	end

	local tint = _framework.tiers.get_tint(belt_tier.tier)
	local params = { tint = tint, belt_sprite = _defines.get_belt_sprites(belt.speed) }

	-- Find the entities that use the belt animation set of the belt before it is replaced.
	local users = _sprite_utils.belt_animation_sets.find_belt_animation_set_users(belt)

	Applicators.apply_sprite_set(belt, TransportBelt.get_sprite_set(params))
	_sprite_utils.belt_animation_sets.set_belt_animation_set(
		users,
		belt.belt_animation_set --[[@as data.TransportBeltAnimationSet]]
	)

	local entities = {
		{ belt, TransportBelt },
		{ underground, UndergroundBelt },
		{ splitter, Splitter },
	}

	for _, pair in pairs(entities) do
		local entity, module = pair[1], pair[2]
		if entity then
			if entity ~= belt then
				Applicators.apply_sprite_set(entity, module.get_sprite_set(params))
			end

			local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
				tier = belt_tier.tier,
				name = entity.name,
				type_name = entity.type,
				icon_data = module.get_icon({ tint = tint }),
			})
			_sprite_utils.icons.apply_icon_assignment(icon_assignment)
		end
	end

	::continue::
end
