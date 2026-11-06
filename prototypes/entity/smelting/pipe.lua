-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = { icons = require("__reskins-sprite-utils__.icons") }

local Applicators = require("__reskins-assets-api__.api.applicators")
local Pipe = require("__reskins-assets-api__.assets.base.entities.pipe")
local PipeToGround = require("__reskins-assets-api__.assets.base.entities.pipe-to-ground")

if _framework.settings.get_value("reskins-angels-use-angels-material-colors-pipes") == false then
	return
end
if not (reskins.angels and reskins.angels.triggers.smelting.entities) then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.logistics.entities) then
	return
end

-- Set trigger
reskins.angels.triggers.smelting.pipes_use_material_colors = true

local pipe_material_map = {
	["bob-titanium-pipe"] = {
		tier = 4,
		pipe_material = "angels-titanium",
	},
	["bob-ceramic-pipe"] = {
		tier = 4,
		pipe_material = "angels-ceramic",
	},
	["bob-tungsten-pipe"] = {
		tier = 5,
		pipe_material = "angels-tungsten",
	},
	-- Brass is tier 3 in Angel's, but became tier 4 in Bob's.
	["bob-brass-pipe"] = {
		tier = 3,
		pipe_material = "brass",
	},
}

local function do_pipe(name, options)
	local entity = data.raw["pipe"][name]
	if not entity then
		return
	end

	local tier = _framework.tiers.get_tier(options)
	local sprite_set = Pipe.get_sprite_set({ pipe_material = options.pipe_material })

	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = name,
		type_name = "pipe",
		icon_data = Pipe.get_icon({ material = options.pipe_material }),
	})
	_sprite_utils.icons.apply_icon_assignment(icon_assignment)
end

local function do_pipe_to_ground(name, options)
	local entity = data.raw["pipe-to-ground"][name]
	if not entity then
		return
	end

	local tier = _framework.tiers.get_tier(options)
	local sprite_set = PipeToGround.get_sprite_set({ pipe_material = options.pipe_material })

	Applicators.apply_sprite_set(entity, sprite_set)

	local icon_assignment = _framework.tiers.icon_assignment_with_tier_labels({
		tier = tier,
		name = name,
		type_name = "pipe-to-ground",
		icon_data = PipeToGround.get_icon({ material = options.pipe_material }),
	})

	_sprite_utils.icons.apply_icon_assignment(icon_assignment)
end

-- Reskin pipes, create and assign extra details
for name, options in pairs(pipe_material_map) do
	do_pipe(name, options)
	do_pipe_to_ground(name .. "-to-ground", options)
end
