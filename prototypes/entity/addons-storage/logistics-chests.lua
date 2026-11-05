-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local BigChest = require("__reskins-assets-api__.assets.angels.entities.assorted.big-chest")
local Warehouse = require("__reskins-assets-api__.assets.angels.entities.assorted.warehouse")

local TYPE = "logistic-container"

-- Reskin Warehouses
if reskins.angels and reskins.angels.triggers.storage.entities then
	local entities = {
		["angels-warehouse-active-provider"] = { logistic_mode = "active-provider" },
		["angels-warehouse-buffer"] = { logistic_mode = "buffer" },
		["angels-warehouse-passive-provider"] = { logistic_mode = "passive-provider" },
		["angels-warehouse-requester"] = { logistic_mode = "requester" },
		["angels-warehouse-storage"] = { logistic_mode = "storage" },
	}

	for name, options in pairs(entities) do
		---@type data.LogisticContainerPrototype
		local entity = data.raw[TYPE][name]
		if not entity then
			goto continue
		end

		local sprite_set = Warehouse.get_logistic_sprite_set({ logistic_mode = options.logistic_mode })
		Applicators.apply_sprite_set(entity, sprite_set)

		local composition = Warehouse.get_logistic_icon_composition({ logistic_mode = options.logistic_mode })
		local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = 0,
			name = entity.name,
			type_name = entity.type,
			composition = composition,
		})
		_sprite_utils.icons.apply_icon_assignment(icon_assignment)

		::continue::
	end
end

-- Reskin Big Chests from Angel's Addons - Robot Logistics
if reskins.angels and reskins.angels.triggers.bots.entities then
	local entities = {
		["angels-logistic-chest-active-provider"] = { logistic_mode = "active-provider" },
		["angels-logistic-chest-buffer"] = { logistic_mode = "buffer" },
		["angels-logistic-chest-passive-provider"] = { logistic_mode = "passive-provider" },
		["angels-logistic-chest-requester"] = { logistic_mode = "requester" },
		["angels-logistic-chest-storage"] = { logistic_mode = "storage" },
	}

	for name, options in pairs(entities) do
		---@type data.LogisticContainerPrototype
		local entity = data.raw[TYPE][name]
		if not entity then
			goto continue
		end

		local sprite_set = BigChest.get_logistic_sprite_set({ logistic_mode = options.logistic_mode })
		Applicators.apply_sprite_set(entity, sprite_set)

		local icon_data = BigChest.get_logistic_icon({ logistic_mode = options.logistic_mode })
		local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
			tier = 0,
			name = entity.name,
			type_name = entity.type,
			icon_data = icon_data,
		})
		_sprite_utils.icons.apply_icon_assignment(icon_assignment)

		::continue::
	end
end
