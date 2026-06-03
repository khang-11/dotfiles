return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	init = function()
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_foreground = "material"
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_better_performance = 1
	end,
	config = function()
		vim.opt.background = "dark"
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
