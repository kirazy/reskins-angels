-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not (reskins.angels and reskins.angels.triggers.industries.technologies) then return end

---@type CreateIconsFromListInputs
local inputs = {
    mod = "angels",
    group = "industries",
    type = "technology",
    technology_icon_size = 256,
    flat_icon = true,
}

---@type CreateIconsFromListTable
local technologies = {
    -- Nuclear
    ["angels-thorium-power"] = { subgroup = "nuclear" },

}

reskins.internal.create_icons_from_list(technologies, inputs)
