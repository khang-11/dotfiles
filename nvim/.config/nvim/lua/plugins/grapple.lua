local config = function()
	require("grapple").setup({})

	vim.keymap.set("n", "<leader>m", require("grapple").toggle)
	vim.keymap.set("n", "<leader>M", require("grapple").toggle_tags)

	vim.keymap.set("n", "<leader>1", "<cmd>Grapple select index=1<cr>")
	vim.keymap.set("n", "<leader>2", "<cmd>Grapple select index=2<cr>")
	vim.keymap.set("n", "<leader>3", "<cmd>Grapple select index=3<cr>")
	vim.keymap.set("n", "<leader>4", "<cmd>Grapple select index=4<cr>")
	vim.keymap.set("n", "<leader>5", "<cmd>Grapple select index=5<cr>")
	vim.keymap.set("n", "<leader>6", "<cmd>Grapple select index=6<cr>")
end

return {
	"cbochs/grapple.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = config,
}
