local config = function()
	local lsp = require("lsp-zero").preset({})
	lsp.on_attach(function(client, bufnr)
		lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
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

	require("copilot").setup()
	require("copilot_cmp").setup()

	require("luasnip.loaders.from_vscode").lazy_load()
	local cmp = require("cmp")
	cmp.setup({
		sources = {
			{ name = "buffer" },
			{ name = "copilot" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
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

		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"zbirenbaum/copilot-cmp",

		"l3mon4d3/luasnip",
		"rafamadriz/friendly-snippets",
		"zbirenbaum/copilot.lua",
	},
	event = "VeryLazy",
	config = config,
}
