-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Framework

if not (reskins.angels and reskins.angels.triggers.petrochem.items) then
	return
end

if not mods["angelspetrochem"] then
	return
end

local _assets = {
	defines = require("__reskins-assets-api__.api.defines"),
	sprites = require("__reskins-assets-api__.api.sprites"),
}
local _framework = { tiers = require("__reskins-framework__.api.tiers") }

local FuelCells = require("__reskins-assets-api__.assets.angels.items.fuel-cells")
local Isotopes = require("__reskins-assets-api__.assets.angels.items.isotopes")
local NuclearFuel = require("__reskins-assets-api__.assets.angels.items.nuclear-fuel")

---Gets the definition of the fuel cell for the given `fuel`, with the light of a fuel cell in its pictures.
---@param fuel string The fuel of the fuel cell.
---@return TieredIconDefinition
local function fuel_cell(fuel)
	return {
		composition = FuelCells.get_icon_composition({ fuel = fuel })
			:add_light(_assets.sprites.get_sprite_light_layer(_assets.defines.light.fuel_cell)),
	}
end

---Gets the definition of the given nuclear fuel `composition`, with the light of a fuel in its pictures.
---@param composition IconComposition The icon of the nuclear fuel.
---@return TieredIconDefinition
local function nuclear_fuel(composition)
	return { composition = composition:add_light(_assets.sprites.get_sprite_light_layer(_assets.defines.light.fuel)) }
end

_framework.tiers.assign_icons_with_tier_labels("item", {
	-- Nuclear fuel cells
	["angels-deuterium-fuel-cell"] = fuel_cell("deuterium"),
	["angels-mixed-oxide-cell"] = fuel_cell("mixed-oxide"),
	["angels-thorium-fuel-cell"] = fuel_cell("thorium"),
	["angels-uranium-fuel-cell"] = fuel_cell("uranium-234"),
	["uranium-fuel-cell"] = fuel_cell("uranium"),

	-- Nuclear fuel
	["angels-nuclear-fuel"] = nuclear_fuel(NuclearFuel.get_nuclear_fuel_icon_composition()),
	["angels-nuclear-fuel-2"] = nuclear_fuel(NuclearFuel.get_nuclear_fuel_2_icon_composition()),
})

---Gets the definition of the isotope for the given `name`, with pictures that draw the isotope a second time
---as a light.
---@param name string The isotope.
---@return TieredIconDefinition
local function isotope(name)
	return { composition = Isotopes.get_icon_composition({ isotope = name }) }
end

_framework.tiers.assign_icons_with_tier_labels("item", {
	-- Nuclear isotopes
	["angels-americium-241"] = isotope("americium-241"),
	["angels-curium-245"] = isotope("curium-245"),
	["angels-neptunium-240"] = isotope("neptunium-240"),
	["bob-plutonium-239"] = isotope("plutonium-240"),
	["bob-thorium-232"] = isotope("thorium-232"),
	["angels-uranium-234"] = isotope("uranium-234"),
	["uranium-235"] = isotope("uranium-235"),
})
