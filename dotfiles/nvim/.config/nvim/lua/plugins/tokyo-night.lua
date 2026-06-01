local config = function()
	require("tokyonight").setup()
	vim.cmd.colorscheme("tokyonight-storm")
end

return { "folke/tokyonight.nvim", config = config }
