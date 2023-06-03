local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local opts = {buffer = bufnr, remap = false}
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>ft', ':NvimTreeFocus<CR>')

vim.keymap.set('n', '<leader>bb', '<cmd>BufferLineCyclePrev<cr>')
vim.keymap.set('n', '<leader>bn', '<cmd>BufferLineCycleNext<cr>')
vim.keymap.set('n', '<leader>bj', '<cmd>BufferLinePick<cr>')
vim.keymap.set('n', '<leader>bf', '<cmd>Telescope buffers previewer=false<cr>')

vim.keymap.set('n', '<leader>bx', '<cmd>bd<cr>')
require('leap').add_default_mappings()
