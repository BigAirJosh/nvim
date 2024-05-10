-- Most, but not all (see plugins) of my keymaps
-- leader = <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', '<Cmd>:NvimTreeFindFileToggle<Cr>', { desc = 'Open file tree' })
-- vim.keymap.set('n', '<leader>e', '<Cmd>:Neotree toggle<Cr>', { desc = 'Open file tree' })
vim.keymap.set('n', '<leader>E', '<Cmd>:Neotree git_status<Cr>', { desc = 'Open git status tree' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<C-q>', function()
  vim.diagnostic.setloclist()
end, { desc = 'Open diagnostics list' })

-- buffer navigation keymaps
vim.keymap.set('n', '[b', '<Cmd>bprev<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', ']b', '<Cmd>bnext<CR>', { desc = 'Go to next buffer' })
vim.keymap.set('n', '<leader>c', '<Cmd>Bdelete<CR>', { desc = '[C]lose buffer' })

-- Make using vim-dispatch
vim.keymap.set('n', '<F13>', '<Cmd>:Make %<CR>', { desc = 'Make the thing' })
vim.keymap.set('n', '<C-F13>', '<Cmd>:Make #<CR>', { desc = 'Make the alternate thing' })
vim.keymap.set('n', '<leader>mm', '<Cmd>:Make %<CR>', { desc = '[M]ake the current buffer' })
vim.keymap.set('n', '<leader>mg', '<Cmd>:Make ./%:p:.:h/...<CR>', { desc = '[M]ake [G]o' })
vim.keymap.set('n', '<leader>ma', '<Cmd>:Make #<CR>', { desc = '[M]ake the [A]lternate buffer' })
vim.keymap.set('n', '<leader>md', '<Cmd>:Make % --order defined<CR>', { desc = '[M]ake order [D]efined' })

vim.keymap.set('n', '<leader>mc', '<Cmd>:cclose<CR>', { desc = '[M]ake [C]lose quickfix window' })
vim.keymap.set('n', '<leader>mo', '<Cmd>:Copen<CR>', { desc = '[M]ake [O]open quickfix window' })

-- Window keymaps
vim.keymap.set('n', '<leader>wb', '<Cmd>Barbecue toggle<CR>', { desc = '[W]indow [B]arbecue toggle' })

-- refactor keymaps
vim.keymap.set('x', '<leader>rv', '<Cmd>Refactor extract_var<CR>', { desc = '[R]efactor extract [V]ar' })
vim.keymap.set('x', '<leader>re', '<Cmd>Refactor extract<CR>', { desc = '[R]efactor [E]xtract' })
vim.keymap.set('x', '<leader>rn', '<Cmd>Refactor refactor_names<CR>', { desc = '[R]efactor [N]ames' })
-- prompt for a refactor to apply when the remap is triggered
vim.keymap.set(
  { "n", "x" },
  "<leader>rr",
  function() require('refactoring').select_refactor() end,
  { desc = '[R]efactor' })

-- document existing key chains
require('which-key').register {
  ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  ['<leader>h'] = { name = '[H]unks', _ = 'which_key_ignore' },
  ['<leader>l'] = { name = '[L]anguage server', _ = 'which_key_ignore' },
  ['<leader>m'] = { name = '[M]ake', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]efactor', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>st'] = { name = '[T]mux', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]indow', _ = 'which_key_ignore' },
}
