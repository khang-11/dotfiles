local config = function()
	require("nvim-treesitter.configs").setup({
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["sp"] = { query = "@parameter.inner", desc = "Select parameter" },
					["ss"] = { query = "@statement.outer", desc = "Select statement" },

					["aa"] = { query = "@assignment.rhs", desc = "Select LHS of assignment" },
					["ia"] = { query = "@assignment.lhs", desc = "Select RHS of assignment" },
					["ac"] = { query = "@call.outer", desc = "Select outer call" },
					["ic"] = { query = "@call.inner", desc = "Select inner call" },
					["ai"] = { query = "@conditional.outer", desc = "Select outer conditional" },
					["ii"] = { query = "@conditional.inner", desc = "Select inner conditional" },
					["ao"] = { query = "@class.outer", desc = "Select outer class" },
					["io"] = { query = "@class.inner", desc = "Select inner class" },
					["af"] = { query = "@function.outer", desc = "Select outer function" },
					["if"] = { query = "@function.inner", desc = "Select inner function" },
					["al"] = { query = "@loop.outer", desc = "Select outer loop" },
					["il"] = { query = "@loop.inner", desc = "Select inner loop" },
				},
				selection_modes = {
					["@parameter.outer"] = "v",
					["@function.outer"] = "V",
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]f"] = { query = "@function.outer", desc = "Go to next function" },
					["]p"] = { query = "@parameter.inner", desc = "Go to next parameter" },
				},
				goto_previous_start = {
					["[f"] = { query = "@function.outer", desc = "Go to previous function" },
					["[p"] = { query = "@parameter.inner", desc = "Go to previous parameter" },
				},
			},
		},
	})
end

return { "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy", config = config }
