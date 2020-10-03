-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelspetrochem"] then return end

local inputs = {
    directory = reskins.angels.directory,
    mod = "angels",
}

reskins.lib.parse_inputs(inputs)

local ores = {
    "sulfer",
}

for _, name in pairs(ores) do
    -- Fetch entity
    local item = data.raw.item[name]

    -- Check if item exists, if not, skip this iteration
    if not item then goto continue end

    inputs.icon = "__base__/graphics/icons/sulfur.png"
    inputs.icon_picture = nil

    reskins.lib.assign_icons(name, inputs)

    -- Label to skip to next iteration
    ::continue::
end