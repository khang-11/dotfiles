-- Bootstrap Lazy vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup("plugins", opts)

-- LSP Setup
local lsp = require("lsp-zero").preset({})
lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})
    lsp.buffer_autoformat()
end)
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

local null_ls = require("null-ls")
null_ls.setup()
require("mason-null-ls").setup({
    ensure_installed = nil,
    automatic_installation = false, -- You can still set this to `true`
    handlers = {}
})

require("core")
