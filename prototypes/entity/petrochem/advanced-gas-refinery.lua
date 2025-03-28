-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.petrochem.entities) then
	return
end

-- Set input parameters
local inputs = {
	type = "assembling-machine",
	icon_name = "advanced-gas-refinery",
	base_entity_name = "oil-refinery",
	mod = "angels",
	particles = { ["big-tint"] = 5, ["medium"] = 2 },
	group = "petrochem",
	make_remnants = false,
}

local tier_map = {
	["gas-refinery"] = { tier = 1, prog_tier = 3 },
	["gas-refinery-2"] = { tier = 2, prog_tier = 4 },
	["gas-refinery-3"] = { tier = 3, prog_tier = 5 },
	["gas-refinery-4"] = { tier = 4, prog_tier = 6 },
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
	---@type data.AssemblingMachinePrototype
	local entity = data.raw[inputs.type][name]

	-- Check if entity exists, if not, skip this iteration
	if not entity then
		goto continue
	end

	-- Handle tier
	local tier = map.tier
	if reskins.lib.settings.get_value("reskins-lib-tier-mapping") == "progression-map" then
		tier = map.prog_tier or map.tier
	end

	-- Determine what tint we're using
	inputs.tint = map.tint or reskins.lib.tiers.get_tint(tier)

	reskins.lib.setup_standard_entity(name, tier, inputs)

	-- Reskin entities
	entity.graphics_set.animation = reskins.lib.sprites.make_4way_animation_from_spritesheet({
		layers = {
			-- Base
			{
				filename = "__angelspetrochemgraphics__/graphics/entity/advanced-gas-refinery/advanced-gas-refinery-base.png",
				priority = "extra-high",
				width = 462,
				height = 657,
				shift = util.by_pixel(0, -42),
				scale = 0.5,
			},
			-- Mask
			{
				filename = "__reskins-angels__/graphics/entity/petrochem/advanced-gas-refinery/advanced-gas-refinery-mask.png",
				priority = "extra-high",
				width = 462,
				height = 657,
				shift = util.by_pixel(0, -42),
				tint = inputs.tint,
				scale = 0.5,
			},
			-- Highlights
			{
				filename = "__reskins-angels__/graphics/entity/petrochem/advanced-gas-refinery/advanced-gas-refinery-highlights.png",
				priority = "extra-high",
				width = 462,
				height = 657,
				shift = util.by_pixel(0, -42),
				blend_mode = reskins.lib.settings.blend_mode,
				scale = 0.5,
			},
			-- Shadow
			{
				filename = "__angelspetrochemgraphics__/graphics/entity/advanced-gas-refinery/advanced-gas-refinery-shadow.png",
				priority = "extra-high",
				vertically_oriented = true,
				width = 655,
				height = 454,
				shift = util.by_pixel(48.5, 9.5),
				draw_as_shadow = true,
				scale = 0.5,
			},
		},
	})

	-- Label to skip to next iteration
	::continue::
end
