local config = function()
	vim.g.gruvbox_material_background = "hard"
	vim.cmd.colorscheme("gruvbox-material")
end

return { "sainnhe/gruvbox-material", config = config }
