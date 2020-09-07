-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Add this mod to the reskins function host.
if not reskins.angels then reskins.angels = {} end
reskins.angels.directory = "__reskins-angels__"
reskins.angels.constants = {
    recipe_corner_shift = {-20, -20},
    recipe_corner_scale = 0.4375,
}

-- Maybe we'll use this one day?...
local function copy_icon(destination_name, destination_type, source_name, source_type)
    -- Fetch source and desination pointers
    local source = data.raw[source_type]
    local destination = data.raw[destination_type]

    -- Validate pointers
    if not (source and destination) then return end

    -- Duplicate the icon
    if source.icons then
        destination.icons = util.copy(source.icons)
    elseif source.icon then
        destination.icon = util.copy(source.icon)
    else
        return -- Fundamentally broken source definitions
    end

    -- Copy root-level properties
    destination.icon_size = source.icon_size
    destination.icon_mipmaps = source.icon_mipmaps
end