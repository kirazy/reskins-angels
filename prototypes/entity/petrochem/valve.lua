-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = { tiers = require("__reskins-framework__.api.tiers") }
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local PipeValve = require("__reskins-assets-api__.assets.angels.entities.petrochem.pipe-valve")

if not mods["angelspetrochem"] then
	return
end

local valves = {
	["angels-valve-inspector"] = { tint = util.color("#8dd24e"), type = "storage-tank", use_inspector_set = true },
	["angels-valve-overflow"] = { tint = util.color("#689ed3"), type = "valve" },
	["angels-valve-one-way"] = { tint = util.color("#d4933f"), type = "valve" },
	["angels-valve-top-up"] = { tint = util.color("#fcfcfc"), type = "valve" },
}

for name, options in pairs(valves) do
	---@type data.ValvePrototype|data.StorageTankPrototype
	local entity = data.raw[options.type][name]
	if not entity then
		goto continue
	end

	local sprite_set = PipeValve.get_sprite_set({ tint = options.tint, use_inspector_set = options.use_inspector_set })
	Applicators.apply_sprite_set(entity, sprite_set)

	local composition = options.use_inspector_set and PipeValve.get_inspector_icon_composition({ tint = options.tint })
		or PipeValve.get_icon_composition({ tint = options.tint })
	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = 0,
		name = entity.name,
		type_name = entity.type,
		composition = composition,
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)

	::continue::
end
