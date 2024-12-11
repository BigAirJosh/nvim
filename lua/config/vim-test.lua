-- vim-test
vim.keymap.set('n', '<leader>tn', '<Cmd>:TestNearest<CR>', { desc = '[T]est the [N]earest test' })
vim.keymap.set('n', '<leader>ts', '<Cmd>:TestSuite<CR>', { desc = '[T]est the entire [S]uite' })
vim.keymap.set('n', '<leader>tf', '<Cmd>:TestFile<CR>', { desc = '[T]est the entire [F]ile' })
vim.keymap.set('n', '<leader>tl', '<Cmd>:TestLast<CR>', { desc = '[T]est the [L]ast test' })
