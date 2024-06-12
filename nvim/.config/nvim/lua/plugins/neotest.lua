local config = function()
	require("neotest").setup({
		adapters = {
			require("neotest-go"),
		},
	})

	require("which-key").register({
		["<leader>t"] = {
			name = "+test",
		},
	})
	vim.keymap.set("n", "<leader>tt", require("neotest").run.run, { desc = "Run Test" })
	vim.keymap.set("n", "<leader>tf", function()
		require("neotest").run.run(vim.fn.expand("%"))
	end, { desc = "Run All Tests (Buffer)" })
	vim.keymap.set("n", "<leader>td", function()
		require("neotest").run.run({ strategy = "dap" })
	end, { desc = "Debug Test" })
end

return {
	"nvim-neotest/neotest",
	event = "VeryLazy",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
	},
	config = config,
}
