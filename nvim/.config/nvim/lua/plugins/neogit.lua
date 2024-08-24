local config = function()
	require("neogit").setup()
	vim.keymap.set("n", "<leader>g", require("neogit").open, { desc = "Git" })
end

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = config,
}
