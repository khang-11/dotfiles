local config = function()
	require("neogit").setup()

	vim.keymap.set("n", "<leader>g", function()
		require("neogit").open({ kind = "split_above" })
	end, { desc = "Git" })
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
