-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE in the project directory for license information.

-- Check to see if reskinning needs to be done.
if reskins.lib.settings.get_value("cp-override-modules") == false then --[[ Do nothing ]]
elseif mods["CircuitProcessing"] then
	return
end
if not (reskins.bobs and reskins.bobs.triggers.modules.technologies) then return end
if not (reskins.angels and reskins.angels.triggers.bioprocessing.technologies) then return end

-- Modules
local modules_map = {
	["angels-bio-yield"] = { color = "orange", is_exception = true },
}

for class, map in pairs(modules_map) do
	---@type ConstructTechnologyIconInputsOld
	local inputs = {
		directory = reskins.bobs.directory,
		mod = "bobs",
		group = "modules",
		type = "technology",
		technology_icon_size = 256,
	}

	-- Setup input defaults
	reskins.lib.set_inputs_defaults(inputs)

	-- Do all tiers
	for tier = 1, 8 do
		-- Naming convention exception handling
		local name = class .. "-module-" .. tier
		if tier == 1 and map.is_exception then name = class .. "-module" end

		-- Fetch technology
		local technology = data.raw[inputs.type][name]

		-- Check if technology exists, if not, skip this iteration
		if not technology then goto continue end

		-- Setup icon path
		inputs.technology_icon_filename = "__reskins-bobs__/graphics/technology/modules/module/" .. map.color .. "/" .. map.color .. "_" .. tier .. ".png"

		reskins.lib.construct_technology_icon(name, inputs)

		-- Label to skip to next iteration
		::continue::
	end
end

---@type CreateIconsFromListInputs
local inputs = {
	mod = "angels",
	group = "bioprocessing",
	type = "technology",
	technology_icon_size = 256,
	flat_icon = true,
}

---@type CreateIconsFromListTable
local technologies = {
	["modules-2"] = {},
	["modules-3"] = {},
}

reskins.internal.create_icons_from_list(technologies, inputs)
