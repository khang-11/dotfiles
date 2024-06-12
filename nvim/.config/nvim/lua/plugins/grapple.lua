local config = function()
	require("grapple").setup({})

	require("which-key").register({
		["<leader>m"] = {
			name = "+grapple",
		},
	})
	vim.keymap.set("n", "<leader>mt", require("grapple").toggle, { desc = "Grapple Toggle Mark" })
	vim.keymap.set("n", "<leader>ml", require("grapple").toggle_tags, { desc = "Grapple List Marks" })

	vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>", { desc = "Grapple Select 1" })
	vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>", { desc = "Grapple Select 2" })
	vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>", { desc = "Grapple Select 3" })
	vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>", { desc = "Grapple Select 4" })
	vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<cr>", { desc = "Grapple Select 5" })
	vim.keymap.set("n", "<leader>6", "<cmd>Grapple select index=6<cr>", { desc = "Grapple Select 6" })
	vim.keymap.set("n", "<leader>7", "<cmd>Grapple select index=6<cr>", { desc = "Grapple Select 7" })
	vim.keymap.set("n", "<leader>8", "<cmd>Grapple select index=6<cr>", { desc = "Grapple Select 8" })
	vim.keymap.set("n", "<leader>9", "<cmd>Grapple select index=6<cr>", { desc = "Grapple Select 9" })
	vim.keymap.set("n", "<leader>0", "<cmd>Grapple select index=6<cr>", { desc = "Grapple Select 0" })
end

return {
	"cbochs/grapple.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = config,
}
