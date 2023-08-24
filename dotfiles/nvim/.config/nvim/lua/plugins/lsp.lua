local config = function()
	local lsp = require("lsp-zero").preset({})
	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr })
		-- Use Treesitter syntax highlighting
		client.server_capabilities.semanticTokensProvider = nil
	end)

	lsp.extend_cmp()
	require("mason").setup({})
	require("mason-lspconfig").setup({
		ensure_installed = {},
		handlers = {
			lsp.default_setup,
			lua_ls = function()
				require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
			end,
		},
	})
end

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "dev-v3",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"l3mon4d3/luasnip",
	},
	event = "VeryLazy",
	config = config,
}
