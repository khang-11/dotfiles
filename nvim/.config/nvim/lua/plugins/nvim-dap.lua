local config = function()
	require("neodev").setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
	})
	require("dapui").setup()
	require("dap-go").setup()

	require("which-key").register({
		["<leader>d"] = {
			name = "+debug",
		},
	})

	vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { desc = "Toggle Breakpoint" })
	vim.keymap.set("n", "<leader>dc", require("dap").continue, { desc = "Debug - Continue" })
	vim.keymap.set("n", "<leader>do", require("dap").step_over, { desc = "Debug - Step Over" })
	vim.keymap.set("n", "<leader>di", require("dap").step_into, { desc = "Debug - Step Into" })
	vim.keymap.set("n", "<leader>dt", require("dapui").toggle, { desc = "Debug - Toggle UI" })
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"folke/neodev.nvim",
		"leoluz/nvim-dap-go",
	},
	config = config,
}
