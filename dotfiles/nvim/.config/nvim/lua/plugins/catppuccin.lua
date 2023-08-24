local opts = { flavour = "mocha" }

local config = function()
	require("catppuccin").setup(opts)
	vim.cmd.colorscheme("catppuccin")
end

return { "catppuccin/nvim", name = "catppuccin", config = config }
