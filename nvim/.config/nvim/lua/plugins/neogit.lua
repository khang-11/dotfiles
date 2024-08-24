local config = function()
	require("neogit").setup({
		mappings = {
			popup = {
				["p"] = "PushPopup",
				["P"] = "PullPopup",
			},
		},
	})
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
