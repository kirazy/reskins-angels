-- Copyright (c) 2026 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data

if not mods["angelspetrochem"] then
	return
end

---The folder of the numerals from Angel's mods.
local NUMERALS_FOLDER = "__angelsrefininggraphics__/graphics/icons/numerals/"

-- Angel's Petrochem adds its numeral to the reskinned icon of the oil refinery in its data-updates stage. The entity
-- and the recycling recipe of the oil refinery are given the same icon.
local prototypes = {
	data.raw["item"]["oil-refinery"],
	data.raw["assembling-machine"]["oil-refinery"],
	data.raw["recipe"]["oil-refinery-recycling"],
}

for _, prototype in pairs(prototypes) do
	if not prototype.icons then
		goto continue
	end

	---@type data.IconData[]
	local icons = {}
	for _, icon_datum in pairs(prototype.icons) do
		if icon_datum.icon:sub(1, #NUMERALS_FOLDER) ~= NUMERALS_FOLDER then
			icons[#icons + 1] = icon_datum
		end
	end

	prototype.icons = icons

	::continue::
end
