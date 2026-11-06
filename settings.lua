-- Copyright (c) 2024 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Core settings
data:extend({
	-- {
	--     type = "bool-setting",
	--     name = "reskins-angels-use-angels-tier-colors",
	--     setting_type = "startup",
	--     order = "b",
	--     default_value = false,
	--     -- hidden = true,
	-- },
	-- {
	--     type = "bool-setting",
	--     name = "reskins-angels-belts-use-angels-tier-colors",
	--     setting_type = "startup",
	--     order = "bb",
	--     default_value = false,
	--     localised_description = {"mod-setting-description.reskins-angels-belts-use-angels-tier-colors", {"mod-setting-name.reskins-angels-use-angels-tier-colors"}},
	--     -- hidden = true,
	-- },
	{
		type = "bool-setting",
		name = "reskins-angels-use-item-variations",
		setting_type = "startup",
		order = "c",
		default_value = true,
	},
})

if mods["angelspetrochem"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-angels-use-vanilla-chemical-plant-sprites",
			setting_type = "startup",
			default_value = false,
		},
	})
end

if mods["angelsrefining"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-angels-use-vanilla-style-ores",
			setting_type = "startup",
			default_value = false,
			order = "a",
			hidden = true,
		},
	})
end

if mods["angelssmelting"] then
	data:extend({
		{
			type = "bool-setting",
			name = "reskins-angels-use-angels-material-colors",
			setting_type = "startup",
			default_value = true,
			order = "a",
		},
		{
			type = "bool-setting",
			name = "reskins-angels-use-angels-material-colors-pipes",
			setting_type = "startup",
			default_value = true,
			order = "a",
		},
	})
end
