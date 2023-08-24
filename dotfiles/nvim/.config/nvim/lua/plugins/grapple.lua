local config = function()
	require("grapple").setup({})

	vim.keymap.set("n", "<leader>ma", require("grapple").tag)
	vim.keymap.set("n", "<leader>mm", require("grapple").popup_tags)

	vim.keymap.set("n", "<leader>1", "<CMD>GrappleSelect key=1<CR>")
	vim.keymap.set("n", "<leader>2", "<CMD>GrappleSelect key=2<CR>")
	vim.keymap.set("n", "<leader>3", "<CMD>GrappleSelect key=3<CR>")
	vim.keymap.set("n", "<leader>4", "<CMD>GrappleSelect key=4<CR>")
	vim.keymap.set("n", "<leader>5", "<CMD>GrappleSelect key=5<CR>")
	vim.keymap.set("n", "<leader>6", "<CMD>GrappleSelect key=6<CR>")
end

return {
	"cbochs/grapple.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = config,
}
