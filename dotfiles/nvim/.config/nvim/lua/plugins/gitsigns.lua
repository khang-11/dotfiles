local config = function()
	require("gitsigns").setup()

	require("which-key").add({
		{ "<leader>h", group = "git" },
	})
	vim.keymap.set("n", "<leader>hr", require("gitsigns").reset_hunk, { desc = "Reset Hunk" })
	vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { desc = "Preview Hunk" })
end

return { "lewis6991/gitsigns.nvim", event = "VeryLazy", config = config }
