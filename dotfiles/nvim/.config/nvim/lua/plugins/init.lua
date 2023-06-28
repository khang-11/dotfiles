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
    }, {"nvim-lualine/lualine.nvim", config = true},
    {"nvim-treesitter/nvim-treesitter"},
    {"kylechui/nvim-surround", config = true}, {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim"
        },
        config = function()
            require("telescope").load_extension("undo")
            require("telescope").setup({
                extensions = {
                    undo = {
                        side_by_side = true,
                        layout_strategy = "horizontal",
                        layout_config = {preview_height = 0.8},
                        mappings = {
                            i = {
                                ["<CR>"] = require("telescope-undo.actions").yank_additions,
                                ["<C-d>"] = require("telescope-undo.actions").yank_deletions,
                                ["<C-h>"] = require("telescope-undo.actions").restore
                            }
                        }
                    }
                }
            })
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        end
    }, {"ThePrimeagen/harpoon", dependencies = {"nvim-lua/plenary.nvim"}},
    {"lewis6991/gitsigns.nvim", config = true},
    {"windwp/nvim-autopairs", config = true},
    {"numToStr/Comment.nvim", config = true}, {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        keys = {
            {
                "s",
                mode = {"n", "x", "o"},
                function()
                    -- default options: exact mode, multi window, all directions, with a backdrop
                    require("flash").jump()
                end,
                desc = "Flash"
            }, {
                "S",
                mode = {"n", "o", "x"},
                function()
                    -- show labeled treesitter nodes around the cursor
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter"
            }, {
                "r",
                mode = "o",
                function()
                    -- jump to a remote location to execute the operator
                    require("flash").remote()
                end,
                desc = "Remote Flash"
            }, {
                "R",
                mode = {"n", "o", "x"},
                function()
                    -- show labeled treesitter nodes around the search matches
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search"
            }
        }
    }, {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {"nvim-tree/nvim-web-devicons"}
    }
}
