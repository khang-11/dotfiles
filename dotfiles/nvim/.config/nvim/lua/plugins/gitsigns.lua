local config = function()
    require("gitsigns").setup()
    vim.keymap.set("n", "<leader>hr", require("gitsigns").reset_hunk)
    vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk)
    vim.keymap.set("n", "<leader>hd", require("gitsigns").diffthis)
end

return {"lewis6991/gitsigns.nvim", event = "VeryLazy", config = config}
