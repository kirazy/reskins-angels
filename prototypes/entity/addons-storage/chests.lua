-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local BigChest = require("__reskins-assets-api__.assets.angels.entities.assorted.big-chest")
local Warehouse = require("__reskins-assets-api__.assets.angels.entities.assorted.warehouse")

local TYPE = "container"

-- Reskin Warehouses
if reskins.angels and reskins.angels.triggers.storage.entities then
	---@type data.ContainerPrototype
	local entity = data.raw[TYPE]["angels-warehouse"]
	if entity then
		local sprite_set = Warehouse.get_sprite_set()
		Applicators.apply_sprite_set(entity, sprite_set)

		local composition = Warehouse.get_icon_composition()
		local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = 0,
			name = entity.name,
			type_name = entity.type,
			composition = composition,
		})
		_sprite_utils.icons.apply_icon_assignment(icon_assignment)
	end
end

-- Reskin Big Chests
if reskins.angels and reskins.angels.triggers.bots.entities then
	---@type data.ContainerPrototype
	local entity = data.raw[TYPE]["angels-big-chest"]
	if entity then
		local sprite_set = BigChest.get_sprite_set()
		Applicators.apply_sprite_set(entity, sprite_set)

		local composition = BigChest.get_icon_composition()
		local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = 0,
			name = entity.name,
			type_name = entity.type,
			composition = composition,
		})
		_sprite_utils.icons.apply_icon_assignment(icon_assignment)
	end
end
