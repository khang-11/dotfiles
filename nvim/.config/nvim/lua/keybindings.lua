vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

vim.keymap.set("n", "<S-Left>", "<cmd>wincmd h<cr>", { desc = "Move to left window" })
vim.keymap.set("n", "<S-Down>", "<cmd>wincmd j<cr>", { desc = "Move to below window" })
vim.keymap.set("n", "<S-Up>", "<cmd>wincmd k<cr>", { desc = "Move to above window" })
vim.keymap.set("n", "<S-Right>", "<cmd>wincmd l<cr>", { desc = "Move to right window" })

vim.keymap.set("n", "<C-Down>", "<cmd>cn<cr>", { desc = "Move to next quickfix item" })
vim.keymap.set("n", "<C-Up>", "<cmd>cp<cr>", { desc = "Move to previous quickfix item" })
