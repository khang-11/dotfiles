-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- LSP
local opts = {buffer = bufnr, remap = false}
vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Harpoon
local mark = require("harpoon.mark")
local harpoonUi = require("harpoon.ui")
vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hm', harpoonUi.toggle_quick_menu)
vim.keymap.set('n', '<C-j>', function() harpoonUi.nav_file(1) end)
vim.keymap.set('n', '<C-l>', function() harpoonUi.nav_file(2) end)
vim.keymap.set('n', '<C-u>', function() harpoonUi.nav_file(3) end)
vim.keymap.set('n', '<C-y>', function() harpoonUi.nav_file(4) end)

-- Misc
vim.keymap.set("n", "-", require("oil").open)
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>tg", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "<leader>ng", ":Neogit<CR>")
