local config = function()
	require("formatter").setup({
		logging = false,
		filetype = {
			["*"] = require("formatter.filetypes.any").remove_trailing_whitespace,
			lua = require("formatter.filetypes.lua").stylua,
			python = {
				require("formatter.filetypes.python").black,
				require("formatter.filetypes.python").isort,
			},
		},
	})
	vim.api.nvim_exec(
		[[
      augroup fmt
        autocmd!
        autocmd BufWritePost * FormatWrite
      augroup END
    ]],
		false
	)
end

return { "mhartington/formatter.nvim", config = config }
