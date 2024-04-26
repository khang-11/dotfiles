local config = function()
	require("lualine").setup({
		sections = {
			lualine_b = { "grapple" },
		},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = config,
}
