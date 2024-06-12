local config = function()
	vim.keymap.set("n", "<leader>hd", "<CMD>DiffviewOpen<CR>", { desc = "Diffview" })
end

return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	config = config,
}
