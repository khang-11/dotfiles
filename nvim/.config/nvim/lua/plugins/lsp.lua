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

	require("luasnip.loaders.from_vscode").lazy_load()
	local cmp = require("cmp")
	cmp.setup({
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "copilot" },
		},
		mapping = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = false }),
			["<C-Space"] = cmp.mapping.complete(),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
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
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"l3mon4d3/luasnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"zbirenbaum/copilot.lua",
		"zbirenbaum/copilot-cmp",
	},
	event = "VeryLazy",
	config = config,
}
