-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

---@using data
---@using Reskins.Assets.Angels.Items
---@using Reskins.Framework

if not mods["angelssmelting"] then
	return
end

local _framework = {
	settings = require("__reskins-framework__.api.settings"),
	tiers = require("__reskins-framework__.api.tiers"),
}
local _sprite_utils = { defines = require("__reskins-sprite-utils__.defines") }

local Armor = require("__reskins-assets-api__.assets.angels.items.armor")
local BearingBalls = require("__reskins-assets-api__.assets.bobs.items.bearing-balls")
local Bearings = require("__reskins-assets-api__.assets.bobs.items.bearings")
local Gears = require("__reskins-assets-api__.assets.angels.items.gears")
local Icons = require("__reskins-assets-api__.assets.angels.items.icons")
local Ingots = require("__reskins-assets-api__.assets.angels.items.ingots")
local Numerals = require("__reskins-assets-api__.assets.angels.items.numerals")
local Plates = require("__reskins-assets-api__.assets.angels.items.plates")
local Powders = require("__reskins-assets-api__.assets.angels.items.powders")
local Wires = require("__reskins-assets-api__.assets.angels.items.wires")

local corner = _sprite_utils.defines.icon_transforms.compass.northwest

---Gets the numeral of the given `tier`, in the style of Angel's smelting.
---@param tier NumeralNumber The number of the numeral.
---@return IconData[]
local function numeral(tier)
	return Numerals.get_icon({
		number = tier,
		tint = angelsmods.smelting.number_tint --[[@as data.Color]],
	})
end

---Gets the definition of an icon from the base game.
---@param name string The name of the file in `__base__/graphics/icons`, without its extension.
---@return TieredIconDefinition
local function base_icon(name)
	return { icon_datum = { icon = "__base__/graphics/icons/" .. name .. ".png", icon_size = 64 } }
end

---Gets the definition of the plate for the given `material`.
---@param material string
---@return TieredIconDefinition
local function plate(material)
	return { composition = Plates.get_icon_composition({ material = material }) }
end

---Gets the definition of the alloy for the given `alloy`.
---@param alloy string
---@return TieredIconDefinition
local function alloy(alloy)
	return { composition = Plates.get_alloy_icon_composition({ alloy = alloy }) }
end

---Gets the definition of the wire for the given `material`.
---@param material string
---@return TieredIconDefinition
local function wire(material)
	return { composition = Wires.get_icon_composition({ material = material }) }
end

if not mods["angelssmelting"] then
	return
end

---@type table<string, TieredIconDefinition>
local items = {
	-- Plates of the base game.
	["copper-plate"] = base_icon("copper-plate"),
	["iron-plate"] = plate("iron"),
	["steel-plate"] = base_icon("steel-plate"),

	-- Angel's plates.
	["angels-plate-aluminium"] = plate("aluminium"),
	["angels-plate-chrome"] = plate("chrome"),
	["angels-plate-cobalt"] = plate("cobalt"),
	["angels-plate-glass"] = { composition = Icons.get_glass_icon_composition() },
	["angels-plate-gold"] = plate("gold"),
	["angels-plate-lead"] = plate("lead"),
	["angels-plate-manganese"] = plate("manganese"),
	["angels-plate-nickel"] = plate("nickel"),
	["angels-plate-platinum"] = plate("platinum"),
	["angels-plate-silver"] = plate("silver"),
	["angels-plate-steel"] = base_icon("steel-plate"),
	["angels-plate-tin"] = plate("tin"),
	["angels-plate-titanium"] = plate("titanium"),
	["angels-plate-tungsten"] = plate("tungsten"),
	["angels-plate-zinc"] = plate("zinc"),

	-- Bob's plates.
	["bob-aluminium-plate"] = plate("aluminium"),
	["bob-brass-alloy"] = alloy("brass"),
	["bob-bronze-alloy"] = alloy("bronze"),
	["bob-cobalt-plate"] = plate("cobalt"),
	["bob-cobalt-steel-alloy"] = alloy("cobalt-steel"),
	["bob-glass"] = { composition = Icons.get_glass_icon_composition() },
	["bob-gold-plate"] = plate("gold"),
	["bob-gunmetal-alloy"] = alloy("gunmetal"),
	["bob-invar-alloy"] = alloy("invar"),
	["bob-lead-plate"] = plate("lead"),
	["bob-nickel-plate"] = plate("nickel"),
	["bob-nitinol-alloy"] = alloy("nitinol"),
	["bob-silver-plate"] = plate("silver"),
	["bob-tin-plate"] = plate("tin"),
	["bob-titanium-plate"] = plate("titanium"),
	["bob-zinc-plate"] = plate("zinc"),

	-- Wires.
	["angels-wire-gold"] = wire("gilded-copper"),
	["angels-wire-platinum"] = wire("platinum"),
	["angels-wire-silver"] = wire("silver"),
	["angels-wire-tin"] = wire("tin"),
	["copper-cable"] = base_icon("copper-cable"),
	["bob-gilded-copper-cable"] = wire("gilded-copper"),
	["bob-tinned-copper-cable"] = wire("tin"),

	-- Intermediates.
	["bob-solder"] = { composition = Icons.get_solder_icon_composition() },
	["angels-solder"] = { composition = Icons.get_solder_icon_composition() },
	["angels-silicon-wafer"] = { composition = Icons.get_silicon_wafer_icon_composition() },
	["angels-solid-lime"] = { composition = Icons.get_solid_lime_icon_composition() },
	["angels-quartz-crucible"] = { composition = Icons.get_quartz_crucible_icon_composition() },

	-- Rods.
	["iron-stick"] = base_icon("iron-stick"),
}

-- Bob's mods use the name of the tungsten plate from Space Age.
if mods["boblibrary"] then
	items["tungsten-plate"] = plate("tungsten")
end

if _framework.settings.get_value("reskins-angels-use-angels-material-colors") then
	-- Gears.
	items["bob-nitinol-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "nitinol" }) }
	items["bob-titanium-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "titanium" }) }
	items["bob-tungsten-gear-wheel"] = { composition = Gears.get_icon_composition({ material = "tungsten" }) }

	-- Bearing balls.
	items["bob-brass-bearing-ball"] = { composition = BearingBalls.get_angels_icon_composition({ material = "brass" }) }
	items["bob-nitinol-bearing-ball"] =
		{ composition = BearingBalls.get_angels_icon_composition({ material = "nitinol" }) }
	items["bob-titanium-bearing-ball"] =
		{ composition = BearingBalls.get_angels_icon_composition({ material = "titanium" }) }

	-- Bearings.
	items["bob-brass-bearing"] = { composition = Bearings.get_angels_icon_composition({ material = "brass" }) }
	items["bob-nitinol-bearing"] = { composition = Bearings.get_angels_icon_composition({ material = "nitinol" }) }
	items["bob-titanium-bearing"] = { composition = Bearings.get_angels_icon_composition({ material = "titanium" }) }
end

-- Add the powders and their picture variations.
local powders = {
	["angels-powder-aluminium"] = "aluminium",
	["angels-casting-powder-tungsten"] = "tungsten-mixture",
	["angels-powder-chrome"] = "chrome",
	["angels-powder-cobalt"] = "cobalt",
	["angels-powder-copper"] = "copper",
	["angels-powder-gold"] = "gold",
	["angels-powder-iron"] = "iron",
	["angels-powder-steel"] = "steel",
	["angels-powder-lead"] = "lead",
	["angels-powder-manganese"] = "manganese",
	["angels-powder-nickel"] = "nickel",
	["angels-powder-platinum"] = "platinum",
	["bob-silicon-powder"] = "silicon",
	["angels-powder-silicon"] = "silicon",
	["angels-powder-silver"] = "silver",
	["angels-powder-tin"] = "tin",
	["angels-powder-titanium"] = "titanium",
	["bob-powdered-tungsten"] = "tungsten",
	["angels-powder-zinc"] = "zinc",
}

for name, material in pairs(powders) do
	items[name] = { composition = Powders.get_icon_composition({ material = material }) }
end

if _framework.settings.get_value("reskins-angels-use-item-variations") then
	for _, material in pairs({
		"aluminium",
		"chrome",
		"cobalt",
		"copper",
		"gold",
		"iron",
		"lead",
		"manganese",
		"nickel",
		"platinum",
		"silicon",
		"silver",
		"steel",
		"tin",
		"titanium",
		"zinc",
	}) do
		-- The recipes of the ingots keep the numerals of Angel's mods.
		items["angels-ingot-" .. material] = {
			composition = Ingots.get_icon_composition({ material = material }),
			options = { infer_recipe = false },
		}
	end
end

_framework.tiers.assign_icons_with_tier_labels("item", items)

-- Assign Bob's armor in the colors of Angel's materials.
if _framework.settings.get_value("reskins-angels-use-angels-material-colors") then
	_framework.tiers.assign_icons_with_tier_labels("armor", {
		["bob-power-armor-mk4"] = { composition = Armor.get_power_armor_mk4_icon_composition() },
		["bob-power-armor-mk5"] = { composition = Armor.get_power_armor_mk5_icon_composition() },
	})
end

-- Assign the recipes after the items. A composite recipe reads the icons of the items, and the assignment of an item
-- sets the icon of the recipe with the same name.
---@type table<string, TieredIconDefinition>
local recipes = {
	-- Glass.
	["angels-plate-glass"] = { composition = Icons.get_glass_icon_composition(), label = numeral(1) },
	["angels-plate-glass-2"] = { composition = Icons.get_glass_icon_composition(), label = numeral(2) },
	["angels-plate-glass-3"] = { composition = Icons.get_glass_icon_composition(), label = numeral(3) },

	-- Tungsten casting powder.
	["angels-casting-powder-tungsten"] = {
		composition = Powders.get_icon_composition({ material = "tungsten-mixture" }),
		label = numeral(1),
	},
	["angels-casting-powder-tungsten-2"] = {
		composition = Powders.get_icon_composition({ material = "tungsten-mixture" }),
		label = numeral(2),
	},
	["angels-casting-powder-tungsten-3"] = {
		composition = Powders.get_icon_composition({ material = "tungsten-mixture" }),
		label = numeral(3),
	},

	-- Composite recipes.
	-- Aluminium
	["angels-plate-aluminium"] = {
		sources = {
			{ names = { "bob-aluminium-plate", "angels-plate-aluminium" }, type_name = "item" },
			{ name = "angels-liquid-molten-aluminium", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-aluminium-2"] = {
		sources = {
			{ names = { "bob-aluminium-plate", "angels-plate-aluminium" }, type_name = "item" },
			{ name = "angels-roll-aluminium", type_name = "item", transform = corner },
		},
	},

	-- Chrome
	["angels-plate-chrome"] = {
		sources = {
			{ name = "angels-plate-chrome", type_name = "item" },
			{ name = "angels-liquid-molten-chrome", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-chrome-2"] = {
		sources = {
			{ name = "angels-plate-chrome", type_name = "item" },
			{ name = "angels-roll-chrome", type_name = "item", transform = corner },
		},
	},

	-- Cobalt
	["angels-plate-cobalt"] = {
		sources = {
			{ names = { "bob-cobalt-plate", "angels-plate-cobalt" }, type_name = "item" },
			{ name = "angels-liquid-molten-cobalt", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-cobalt-2"] = {
		sources = {
			{ names = { "bob-cobalt-plate", "angels-plate-cobalt" }, type_name = "item" },
			{ name = "angels-roll-cobalt", type_name = "item", transform = corner },
		},
	},

	-- Copper
	["copper-plate"] = {
		sources = {
			{ name = "copper-plate", type_name = "item" },
			{ name = "angels-ore3-crushed", type_name = "item", transform = corner },
		},
	},
	["angels-plate-copper"] = {
		sources = {
			{ name = "copper-plate", type_name = "item" },
			{ name = "angels-liquid-molten-copper", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-copper-2"] = {
		sources = {
			{ name = "copper-plate", type_name = "item" },
			{ name = "angels-roll-copper", type_name = "item", transform = corner },
		},
	},
	["angels-copper-pebbles-smelting"] = {
		sources = {
			{ name = "copper-plate", type_name = "item" },
			{ name = "angels-copper-pebbles", type_name = "item", transform = corner },
		},
	},
	["angels-copper-nugget-smelting"] = {
		sources = {
			{ name = "copper-plate", type_name = "item" },
			{ name = "angels-copper-nugget", type_name = "item", transform = corner },
		},
	},

	-- Gold
	["angels-plate-gold"] = {
		sources = {
			{ names = { "bob-gold-plate", "angels-plate-gold" }, type_name = "item" },
			{ name = "angels-liquid-molten-gold", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-gold-2"] = {
		sources = {
			{ names = { "bob-gold-plate", "angels-plate-gold" }, type_name = "item" },
			{ name = "angels-roll-gold", type_name = "item", transform = corner },
		},
	},

	-- Invar
	["angels-plate-invar"] = {
		sources = {
			{ name = "bob-invar-alloy", type_name = "item" },
			{ name = "angels-liquid-molten-invar", type_name = "fluid", transform = corner },
		},
	},
	["bob-invar-alloy"] = {
		sources = {
			{ name = "bob-invar-alloy", type_name = "item" },
			{
				names = { "bob-nickel-plate", "angels-plate-nickel" },
				type_name = "item",
				transform = { scale = corner.scale, shift = { -6, -10 } },
			},
			{ name = "iron-plate", type_name = "item", transform = corner },
		},
	},

	-- Iron
	["iron-plate"] = {
		sources = {
			{ name = "iron-plate", type_name = "item" },
			{ name = "angels-ore1-crushed", type_name = "item", transform = corner },
		},
	},
	["angels-plate-iron"] = {
		sources = {
			{ name = "iron-plate", type_name = "item" },
			{ name = "angels-liquid-molten-iron", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-iron-2"] = {
		sources = {
			{ name = "iron-plate", type_name = "item" },
			{ name = "angels-roll-iron", type_name = "item", transform = corner },
		},
	},
	["angels-iron-pebbles-smelting"] = {
		sources = {
			{ name = "iron-plate", type_name = "item" },
			{ name = "angels-iron-pebbles", type_name = "item", transform = corner },
		},
	},
	["angels-iron-nugget-smelting"] = {
		sources = {
			{ name = "iron-plate", type_name = "item" },
			{ name = "angels-iron-nugget", type_name = "item", transform = corner },
		},
	},

	-- Lead
	["bob-lead-plate"] = {
		sources = {
			{ names = { "bob-lead-plate", "angels-plate-lead" }, type_name = "item" },
			{ name = "bob-lead-ore", type_name = "item", transform = corner },
		},
	},
	["angels-plate-lead"] = {
		sources = {
			{ names = { "bob-lead-plate", "angels-plate-lead" }, type_name = "item" },
			{ name = "angels-liquid-molten-lead", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-lead-2"] = {
		sources = {
			{ names = { "bob-lead-plate", "angels-plate-lead" }, type_name = "item" },
			{ name = "angels-roll-lead", type_name = "item", transform = corner },
		},
	},

	-- Manganese
	["angels-plate-manganese"] = {
		sources = {
			{ name = "angels-plate-manganese", type_name = "item" },
			{ name = "angels-liquid-molten-manganese", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-manganese-2"] = {
		sources = {
			{ name = "angels-plate-manganese", type_name = "item" },
			{ name = "angels-roll-manganese", type_name = "item", transform = corner },
		},
	},

	-- Nickel
	["angels-plate-nickel"] = {
		sources = {
			{ names = { "bob-nickel-plate", "angels-plate-nickel" }, type_name = "item" },
			{ name = "angels-liquid-molten-nickel", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-nickel-2"] = {
		sources = {
			{ names = { "bob-nickel-plate", "angels-plate-nickel" }, type_name = "item" },
			{ name = "angels-roll-nickel", type_name = "item", transform = corner },
		},
	},

	-- Nitinol
	["angels-plate-nitinol"] = {
		sources = {
			{ name = "bob-nitinol-alloy", type_name = "item" },
			{ name = "angels-liquid-molten-nitinol", type_name = "fluid", transform = corner },
		},
	},

	-- Platinum
	["angels-plate-platinum"] = {
		sources = {
			{ name = "angels-plate-platinum", type_name = "item" },
			{ name = "angels-liquid-molten-platinum", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-platinum-2"] = {
		sources = {
			{ name = "angels-plate-platinum", type_name = "item" },
			{ name = "angels-roll-platinum", type_name = "item", transform = corner },
		},
	},

	-- Silver
	["angels-plate-silver"] = {
		sources = {
			{ names = { "bob-silver-plate", "angels-plate-silver" }, type_name = "item" },
			{ name = "angels-liquid-molten-silver", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-silver-2"] = {
		sources = {
			{ names = { "bob-silver-plate", "angels-plate-silver" }, type_name = "item" },
			{ name = "angels-roll-silver", type_name = "item", transform = corner },
		},
	},

	-- Steel plate
	["steel-plate"] = {
		sources = {
			{ name = "steel-plate", type_name = "item" },
			{ name = "iron-plate", type_name = "item", transform = corner },
		},
	},
	["angels-plate-steel"] = {
		sources = {
			{ name = "steel-plate", type_name = "item" },
			{ name = "angels-liquid-molten-steel", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-steel-2"] = {
		sources = {
			{ name = "steel-plate", type_name = "item" },
			{ name = "angels-roll-steel", type_name = "item", transform = corner },
		},
	},

	-- Tin
	["angels-plate-tin"] = {
		sources = {
			{ names = { "bob-tin-plate", "angels-plate-tin" }, type_name = "item" },
			{ name = "angels-liquid-molten-tin", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-tin-2"] = {
		sources = {
			{ names = { "bob-tin-plate", "angels-plate-tin" }, type_name = "item" },
			{ name = "angels-roll-tin", type_name = "item", transform = corner },
		},
	},

	-- Titanium
	["angels-plate-titanium"] = {
		sources = {
			{ names = { "bob-titanium-plate", "angels-plate-titanium" }, type_name = "item" },
			{ name = "angels-liquid-molten-titanium", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-titanium-2"] = {
		sources = {
			{ names = { "bob-titanium-plate", "angels-plate-titanium" }, type_name = "item" },
			{ name = "angels-roll-titanium", type_name = "item", transform = corner },
		},
	},

	-- Zinc
	["angels-plate-zinc"] = {
		sources = {
			{ names = { "bob-zinc-plate", "angels-plate-zinc" }, type_name = "item" },
			{ name = "angels-liquid-molten-zinc", type_name = "fluid", transform = corner },
		},
	},
	["angels-plate-zinc-2"] = {
		sources = {
			{ names = { "bob-zinc-plate", "angels-plate-zinc" }, type_name = "item" },
			{ name = "angels-roll-zinc", type_name = "item", transform = corner },
		},
	},

	-- Brass
	["angels-plate-brass"] = {
		sources = {
			{ name = "bob-brass-alloy", type_name = "item" },
			{ name = "angels-liquid-molten-brass", type_name = "fluid", transform = corner },
		},
	},

	-- Bronze
	["angels-plate-bronze"] = {
		sources = {
			{ name = "bob-bronze-alloy", type_name = "item" },
			{ name = "angels-liquid-molten-bronze", type_name = "fluid", transform = corner },
		},
	},

	-- Gunmetal
	["angels-plate-gunmetal"] = {
		sources = {
			{ name = "bob-gunmetal-alloy", type_name = "item" },
			{ name = "angels-liquid-molten-gunmetal", type_name = "fluid", transform = corner },
		},
	},

	-- Cobalt Steel
	["angels-plate-cobalt-steel"] = {
		sources = {
			{ name = "bob-cobalt-steel-alloy", type_name = "item" },
			{ name = "angels-liquid-molten-cobalt-steel", type_name = "fluid", transform = corner },
		},
	},

	-- Copper cable
	["copper-cable"] = {
		sources = {
			{ name = "copper-cable", type_name = "item" },
			{ name = "copper-plate", type_name = "item", transform = corner },
		},
	},
	["angels-wire-copper-2"] = {
		sources = {
			{ name = "copper-cable", type_name = "item" },
			{ name = "angels-wire-coil-copper", type_name = "item", transform = corner },
		},
	},

	-- Gold cable
	["angels-wire-gold"] = {
		sources = {
			{ names = { "bob-gilded-copper-cable", "angels-wire-gold" }, type_name = "item" },
			{ names = { "bob-gold-plate", "angels-plate-gold" }, type_name = "item", transform = corner },
		},
	},
	["angels-wire-gold-2"] = {
		sources = {
			{ names = { "bob-gilded-copper-cable", "angels-wire-gold" }, type_name = "item" },
			{ name = "angels-wire-coil-gold", type_name = "item", transform = corner },
		},
	},

	-- Silver cable
	["angels-wire-silver"] = {
		sources = {
			{ name = "angels-wire-silver", type_name = "item" },
			{ names = { "bob-silver-plate", "angels-plate-silver" }, type_name = "item", transform = corner },
		},
	},
	["angels-wire-silver-2"] = {
		sources = {
			{ name = "angels-wire-silver", type_name = "item" },
			{ name = "angels-wire-coil-silver", type_name = "item", transform = corner },
		},
	},

	-- Platinum cable
	["angels-wire-platinum"] = {
		sources = {
			{ name = "angels-wire-platinum", type_name = "item" },
			{ name = "angels-plate-platinum", type_name = "item", transform = corner },
		},
	},
	["angels-wire-platinum-2"] = {
		sources = {
			{ name = "angels-wire-platinum", type_name = "item" },
			{ name = "angels-wire-coil-platinum", type_name = "item", transform = corner },
		},
	},

	-- Tin cable
	["angels-wire-tin"] = {
		sources = {
			{ names = { "bob-tinned-copper-cable", "angels-wire-tin" }, type_name = "item" },
			{ names = { "bob-tin-plate", "angels-plate-tin" }, type_name = "item", transform = corner },
		},
	},
	["angels-wire-tin-2"] = {
		sources = {
			{ names = { "bob-tinned-copper-cable", "angels-wire-tin" }, type_name = "item" },
			{ name = "angels-wire-coil-tin", type_name = "item", transform = corner },
		},
	},

	-- Solder
	["angels-solder"] = {
		sources = {
			{ names = { "bob-solder", "angels-solder" }, type_name = "item" },
			{ name = "angels-liquid-molten-solder", type_name = "fluid", transform = corner },
		},
	},
	["angels-solder-2"] = {
		sources = {
			{ names = { "bob-solder", "angels-solder" }, type_name = "item" },
			{ name = "angels-roll-solder", type_name = "item", transform = corner },
		},
	},
}

-- Bob's glass is the first of the glass recipes, unless Angel's Smelting hides it.
local bob_glass = data.raw["recipe"]["bob-glass"]
if bob_glass and not bob_glass.hidden then
	recipes["bob-glass"] = { composition = Icons.get_glass_icon_composition(), label = numeral(1) }
	recipes["angels-plate-glass"].label = numeral(2)
	recipes["angels-plate-glass-2"].label = numeral(3)
	recipes["angels-plate-glass-3"].label = numeral(4)
end

if mods["reskins-bobs"] then
	recipes["tungsten-carbide"] = {
		icon_datum = { icon = "__reskins-assets-bobs__/graphics/icons/plates/tungsten-carbide-plate.png", icon_size = 64 },
	}
end

_framework.tiers.assign_icons_with_tier_labels("recipe", recipes)
