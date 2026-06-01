local config = function()
	require("lualine").setup({
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filetype", icon_only = true }, { "filename", path = 1, shorting_target = 10 } },
			lualine_x = { "grapple" },
			lualine_y = { "branch" },
			lualine_z = { "progress" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { { "filetype", icon_only = true }, { "filename", path = 1, shorting_target = 10 } },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = config,
}
