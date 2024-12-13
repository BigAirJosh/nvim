-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- [ FOR NVIM-TREE ]
-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.o.termguicolors = true

-- [ Install package manager ]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
require("config.lazy")

-- [[ Setting options ]]
-- See `:help vim.o`
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.cmd.colorscheme "catppuccin-macchiato"
-- vim.cmd.colorscheme "catppuccin-frappe"
-- vim.cmd.colorscheme "catppuccin-mocha"


-- set vim-test strategy to dispact
vim.g["test#strategy"] = "dispatch"

-- set background to transparent
vim.cmd.highlight({ "Normal", "guibg=NONE" })
vim.cmd.highlight({ "Normal", "ctermbg=NONE" })

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
