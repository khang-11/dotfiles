local config = function()
	require("fzf-lua").setup({ lsp = { async_or_timeout = 3000 } })
	vim.keymap.set("n", "<leader>ff", require("fzf-lua").git_files)
	vim.keymap.set("n", "<leader>fa", require("fzf-lua").files)
	vim.keymap.set("n", "<leader>fg", require("fzf-lua").live_grep)
	vim.keymap.set("n", "<leader>/", require("fzf-lua").buffers)
	vim.keymap.set("n", "<leader>fb", require("fzf-lua").git_branches)
end

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = config,
}
