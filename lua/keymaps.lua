-- Most, but not all (see plugins) of my keymaps
-- leader = <Space>
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- execute lua
vim.keymap.set('n', '<leader>X', ':source %<CR>', { desc = 'source the current file' })
vim.keymap.set('n', '<leader>x', '<Cmd>.lua<CR>', { desc = 'e[x]exute lua on current line' })
vim.keymap.set('v', '<leader>X', ':lua<CR>', { desc = 'e[x]exute lua on visual' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', '<Cmd>:NvimTreeFindFileToggle<Cr>', { desc = 'Open file tr[e]e' })
-- vim.keymap.set('n', '<leader>e', '<Cmd>:Neotree toggle<Cr>', { desc = 'Open file tree' })
vim.keymap.set('n', '<leader>E', '<Cmd>:Neotree git_status<Cr>', { desc = 'Open git status tree' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<C-q>', function()
  vim.diagnostic.setloclist()
end, { desc = 'Open diagnostics list' })

-- buffer navigation keymaps
vim.keymap.set('n', '[B', '<Cmd>bprev<CR>', { desc = 'Go to previous [B]uffer' })
vim.keymap.set('n', ']B', '<Cmd>bnext<CR>', { desc = 'Go to next [B]uffer' })
vim.keymap.set('n', '<leader>c', '<Cmd>Bdelete<CR>', { desc = '[C]lose buffer' })

-- Make using vim-dispatch
vim.keymap.set('n', '<F13>', '<Cmd>:Make %<CR>', { desc = 'Make the thing' })
vim.keymap.set('n', '<C-F13>', '<Cmd>:Make #<CR>', { desc = 'Make the alternate thing' })
vim.keymap.set('n', '<leader>mm', '<Cmd>:Make %<CR>', { desc = '[M]ake the current buffer' })
vim.keymap.set('n', '<leader>ml', '<Cmd>:Make %\\:line(\'.\')<CR>', { desc = '[M]ake the current buffer:line' })
vim.keymap.set('n', '<leader>mg', '<Cmd>:Make ./%:p:.:h/...<CR>', { desc = '[M]ake [g]o' })
vim.keymap.set('n', '<leader>mG', '<Cmd>:Make! ./%:p:.:h/...<CR>', { desc = '[M]ake [G]o Background' })
vim.keymap.set('n', '<leader>ma', '<Cmd>:Make #<CR>', { desc = '[M]ake the [A]lternate buffer' })
vim.keymap.set('n', '<leader>md', '<Cmd>:Make % --order defined<CR>', { desc = '[M]ake order [D]efined' })

vim.keymap.set('n', '<leader>mc', '<Cmd>:cclose<CR>', { desc = '[M]ake [C]lose quickfix window' })
vim.keymap.set('n', '<leader>mo', '<Cmd>:Copen<CR>', { desc = '[M]ake [o]open quickfix window (dispatch)' })
vim.keymap.set('n', '<leader>mO', '<Cmd>:copen<CR>', { desc = '[M]ake [O]open quickfix window (native)' })
vim.keymap.set('n', '[q', '<Cmd>:cprev<CR>', { desc = '[P]revious quickfix item' })
vim.keymap.set('n', ']q', '<Cmd>:cnext<CR>', { desc = '[N]ext quickfix item' })

-- vim-test
vim.keymap.set('n', '<leader>tn', '<Cmd>:TestNearest<CR>', { desc = '[T]est the [N]earest test' })
vim.keymap.set('n', '<leader>ts', '<Cmd>:TestSuite<CR>', { desc = '[T]est the entire [S]uite' })
vim.keymap.set('n', '<leader>tf', '<Cmd>:TestFile<CR>', { desc = '[T]est the entire [F]ile' })
vim.keymap.set('n', '<leader>tl', '<Cmd>:TestLast<CR>', { desc = '[T]est the [L]ast test' })
vim.keymap.set('n', '<S-F3>', '<Cmd>:TestFile<CR>')
vim.keymap.set('n', '<S-F13>', '<Cmd>:TestLast<CR>')
vim.keymap.set('n', '<C-F13>', '<Cmd>:TestNearest<CR>')

-- Git specific keymaps
vim.keymap.set('n', '<leader>gB', '<Cmd>:Git blame<CR>', { desc = '[G]it [B]lame file' })
vim.keymap.set('n', '<leader>gb', '<Cmd>:Gitsigns toggle_current_line_blame<CR>',
  { desc = '[G]it toggle current line [b]lame' })

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
-- require('which-key').register {
--   ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
--   ['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
--   ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
--   ['<leader>h'] = { name = '[H]unks', _ = 'which_key_ignore' },
--   ['<leader>l'] = { name = '[L]anguage server', _ = 'which_key_ignore' },
--   ['<leader>m'] = { name = '[M]ake', _ = 'which_key_ignore' },
--   ['<leader>r'] = { name = '[R]efactor', _ = 'which_key_ignore' },
--   ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
--   ['<leader>st'] = { name = '[T]mux', _ = 'which_key_ignore' },
--   ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
--   ['<leader>w'] = { name = '[W]indow', _ = 'which_key_ignore' },
-- }
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

-- treesitter keymaps
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)


local ts_move = require "nvim-treesitter.textobjects.move"

vim.keymap.set('n', ']b', function() ts_move.goto_next_start("@block.inner", "textobjects") end,
  { desc = 'Go to next [b]lock' })
vim.keymap.set('n', '[b', function() ts_move.goto_previous_start("@block.inner", "textobjects") end,
  { desc = 'Go to previous [b]lock' })
