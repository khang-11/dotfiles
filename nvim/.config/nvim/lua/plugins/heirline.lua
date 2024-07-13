local config = function()
	config = function()
		require("heirline").setup({})
	end
end

return {
	"rebelot/heirline.nvim",
	event = "VeryLazy",
	config = config,
}
