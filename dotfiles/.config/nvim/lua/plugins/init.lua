return {
    -- LSP
    "VonHeikemen/lsp-zero.nvim", "neovim/nvim-lspconfig",
    {"williamboman/mason.nvim", build = ":MasonUpdate"},
    "williamboman/mason-lspconfig.nvim", 'hrsh7th/nvim-cmp',
    "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip",
    "jose-elias-alvarez/null-ls.nvim", "jay-babu/mason-null-ls.nvim", -- Theme
    {
        "rebelot/kanagawa.nvim",
        opts = function() return require("plugins.config.kanagawa") end
    }, {
        "akinsho/bufferline.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = true
    }, {"nvim-lualine/lualine.nvim", config = true},
    {"nvim-treesitter/nvim-treesitter"},
    {"nvim-tree/nvim-tree.lua", config = true},
    {"kylechui/nvim-surround", config = true},
    {"nvim-telescope/telescope.nvim", dependencies = {"nvim-lua/plenary.nvim"}},
    {"lewis6991/gitsigns.nvim", config = true}
}
