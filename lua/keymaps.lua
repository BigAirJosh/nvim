-- Most, but not all (see plugins) of my keymaps
-- leader = <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Configure convience keymaps
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>', { desc = '[W]rite file' })

-- execute lua
vim.keymap.set('n', '<leader>X', ':source %<CR>', { desc = 'source[X] the current file' })
vim.keymap.set('n', '<leader>x', '<Cmd>.lua<CR>', { desc = 'e[x]ecute lua on current line' })
vim.keymap.set('v', '<leader>X', ':lua<CR>', { desc = 'e[x]exute lua on visual' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<C-q>', function()
  vim.diagnostic.setloclist()
end, { desc = 'Open diagnostics list' })

-- buffer navigation keymaps
vim.keymap.set('n', '[B', '<Cmd>bprev<CR>', { desc = 'Go to previous [B]uffer' })
vim.keymap.set('n', ']B', '<Cmd>bnext<CR>', { desc = 'Go to next [B]uffer' })
vim.keymap.set('n', '<leader>c', '<Cmd>Bdelete<CR>', { desc = '[C]lose buffer' })

-- vim.keymap.set('n', '<leader>e', '<Cmd>:Neotree toggle<Cr>', { desc = 'Open file tree' })
vim.keymap.set('n', '<leader>E', '<Cmd>:Neotree git_status<Cr>', { desc = 'Open git status tree' })

vim.keymap.set('n', '[q', '<Cmd>:cprev<CR>', { desc = '[P]revious quickfix item' })
vim.keymap.set('n', ']q', '<Cmd>:cnext<CR>', { desc = '[N]ext quickfix item' })

vim.keymap.set('n', '<leader>gb', '<Cmd>:Gitsigns toggle_current_line_blame<CR>',
  { desc = '[G]it toggle current line [b]lame' })

-- Window keymaps
vim.keymap.set('n', '<leader>wb', '<Cmd>Barbecue toggle<CR>', { desc = '[W]indow [B]arbecue toggle' })


-- document existing key chains
require('which-key').add({
  { "<leader>d",   group = "[D]ebug" },
  { "<leader>d_",  hidden = true },
  { "<leader>f",   group = "[F]ile" },
  { "<leader>f_",  hidden = true },
  { "<leader>g",   group = "[G]it" },
  { "<leader>g_",  hidden = true },
  { "<leader>h",   group = "[H]unks" },
  { "<leader>h_",  hidden = true },
  { "<leader>l",   group = "[L]anguage server" },
  { "<leader>l_",  hidden = true },
  { "<leader>m",   group = "[M]ake" },
  { "<leader>m_",  hidden = true },
  { "<leader>r",   group = "[R]efactor" },
  { "<leader>r_",  hidden = true },
  { "<leader>s",   group = "[S]earch" },
  { "<leader>s_",  hidden = true },
  { "<leader>st",  group = "[T]mux" },
  { "<leader>st_", hidden = true },
  { "<leader>t",   group = "[T]est" },
  { "<leader>t_",  hidden = true },
  { "<leader>w",   group = "[W]indow" },
  { "<leader>w_",  hidden = true },
})
