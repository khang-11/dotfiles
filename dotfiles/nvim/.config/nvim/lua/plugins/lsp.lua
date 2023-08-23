local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
            return client.name == "null-ls"
        end,
        bufnr = bufnr
    })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local config = function()
    local lsp = require("lsp-zero").preset({})
    lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
        -- Use Treesitter syntax highlighting
        client.server_capabilities.semanticTokensProvider = nil
        -- Use null-ls
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function() lsp_formatting(bufnr) end
            })
        end
    end)

    lsp.extend_cmp()
    require("mason").setup({})
    require("mason-lspconfig").setup({
        ensure_installed = {},
        handlers = {
            lsp.default_setup,
            lua_ls = function()
                require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
            end
        }
    })
end

return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "dev-v3",
    dependencies = {
        "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp",
        "l3mon4d3/luasnip"
    },
    event = "VeryLazy",
    config = config
}
