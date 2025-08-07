local config = function()
	require("lint").linters_by_ft = {
		kotlin = { "ktlint" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end

return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = config,
}
