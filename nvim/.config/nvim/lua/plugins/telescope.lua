local config = function()
	require("telescope").setup()
	require("telescope").load_extension("fzf")

	vim.keymap.set("n", "<leader>ff", require("telescope.builtin").git_files, {})
	vim.keymap.set("n", "<leader>fa", require("telescope.builtin").find_files, {})
	vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
	vim.keymap.set("n", "<leader>f/", require("telescope.builtin").buffers, {})
	vim.keymap.set("n", "<leader>ft", require("telescope.builtin").git_branches, {})
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
