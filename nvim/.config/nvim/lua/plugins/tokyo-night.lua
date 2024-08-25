local config = function()
	require("tokyonight").setup({
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
	})
	vim.cmd.colorscheme("tokyonight-storm")
end

return { "folke/tokyonight.nvim", config = config }
