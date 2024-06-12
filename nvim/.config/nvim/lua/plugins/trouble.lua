local config = function()
	vim.keymap.set("n", "<leader>xx", function()
		require("trouble").toggle()
	end)
end

return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = config,
}
