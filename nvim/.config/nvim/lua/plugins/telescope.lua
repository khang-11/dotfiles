local config = function()
	require("telescope").setup()
	require("telescope").load_extension("fzf")

	require("which-key").register({
		["<leader>f"] = {
			name = "+search",
		},
	})
	vim.keymap.set("n", "<leader>ff", require("telescope.builtin").git_files, { desc = "Git Files" })
	vim.keymap.set("n", "<leader>fa", require("telescope.builtin").find_files, { desc = "All Files" })
	vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live Grep" })
	vim.keymap.set("n", "<leader>f/", require("telescope.builtin").buffers, { desc = "Buffers" })
	vim.keymap.set("n", "<leader>ft", require("telescope.builtin").git_branches, { desc = "Git Branches" })
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	event = "VeryLazy",
	config = config,
}
