-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.smelting.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "assembling-machine",
	icon_name = "casting-machine",
	base_entity_name = "chemical-plant",
	mod = "angels",
	particles = { ["big"] = 1, ["medium"] = 2 },
	group = "smelting",
	make_remnants = false,
}

local tier_map = {
	["angels-casting-machine"] = { tier = 1 },
	["angels-casting-machine-2"] = { tier = 2 },
	["angels-casting-machine-3"] = { tier = 3 },
	["angels-casting-machine-4"] = { tier = 4 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
	---@type data.AssemblingMachinePrototype
	local entity = data.raw[inputs.type][name]
	if not entity then
		goto continue
	end

	local tier = reskins.lib.tiers.get_tier(map)
	inputs.tint = map.tint or reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Reskin entities
	entity.graphics_set.animation = {
		layers = {
			-- Base
			{
				filename = "__angelssmeltinggraphics__/graphics/entity/casting-machine/casting-machine-base.png",
				priority = "extra-high",
				width = 205,
				height = 244,
				line_length = 7,
				frame_count = 49,
				animation_speed = 0.5,
				shift = util.by_pixel(0, -2),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-angels__/graphics/entity/smelting/casting-machine/casting-machine-mask.png",
				priority = "extra-high",
				width = 205,
				height = 244,
				line_length = 7,
				frame_count = 49,
				animation_speed = 0.5,
				shift = util.by_pixel(0, -2),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-angels__/graphics/entity/smelting/casting-machine/casting-machine-highlights.png",
				priority = "extra-high",
				width = 205,
				height = 244,
				line_length = 7,
				frame_count = 49,
				animation_speed = 0.5,
				shift = util.by_pixel(0, -2),
				blend_mode = reskins.lib.settings.blend_mode,
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__angelssmeltinggraphics__/graphics/entity/casting-machine/casting-machine-shadow.png",
				priority = "extra-high",
				width = 248,
				height = 206,
				line_length = 7,
				frame_count = 49,
				animation_speed = 0.5,
				draw_as_shadow = true,
				shift = util.by_pixel(11.5, 8.5),
				scale = 0.5,
			},
		},
	}

	::continue::
end
