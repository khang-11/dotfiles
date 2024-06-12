local config = function()
	require("dapui").setup()

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
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = config,
}
