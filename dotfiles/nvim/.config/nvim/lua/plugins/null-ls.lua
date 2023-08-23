local config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    require("null-ls").setup({
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({async = false})
                    end
                })
            end
        end
    })
    require("mason-null-ls").setup({
        ensure_installed = nil,
        automatic_installation = false,
        handlers = {}
    })
end

return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {"jay-babu/mason-null-ls.nvim", "nvim-lua/plenary.nvim"},
    event = "VeryLazy",
    config = config
}
