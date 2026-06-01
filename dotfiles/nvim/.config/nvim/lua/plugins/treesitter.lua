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
	event = "VeryLazy",
	build = ":TSUpdate",
	config = config,
}
