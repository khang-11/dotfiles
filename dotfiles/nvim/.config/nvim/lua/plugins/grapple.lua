local config = function(_, opts)
	require("grapple").setup({})

	vim.keymap.set("n", "<leader>ma", require("grapple").tag)
	vim.keymap.set("n", "<leader>mm", require("grapple").popup_tags)

	vim.keymap.set("n", "<C-l>", "<CMD>GrappleSelect key=1<CR>")
	vim.keymap.set("n", "<C-u>", "<CMD>GrappleSelect key=2<CR>")
	vim.keymap.set("n", "<C-y>", "<CMD>GrappleSelect key=3<CR>")
	vim.keymap.set("n", "<C-p>", "<CMD>GrappleSelect key=4<CR>")
	vim.keymap.set("n", "<C-f>", "<CMD>GrappleSelect key=5<CR>")
	vim.keymap.set("n", "<C-w>", "<CMD>GrappleSelect key=6<CR>")
end

return {
	"cbochs/grapple.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = config,
}
