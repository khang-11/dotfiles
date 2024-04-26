local config = function()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
	config = config,
}
