-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [ FOR NVIM-TREE ]
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- [ Install package manager ]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins (ideally from the lua/plugins directory
require('lazy').setup({
  -- *********** CODING ***********
  -- Git integration
  require 'plugins.vim-fugitive',
  require 'plugins.lazygit',
  -- Github integration
  require 'plugins.vim-rhubarb',
  -- Gitsigns
  require 'plugins.gitsigns',
  -- Visual
  require 'plugins.indent-blankline',
  -- Code Commenting
  require 'plugins.comment',
  -- LSP Configuration & Plugins
  require 'plugins.nvim-lspconfig',
  -- Autocompletion
  require 'plugins.nvim-cmp',
  -- Detect tabstop and shiftwidth automatically
  require 'plugins.vim-sleuth',
  -- Treesitter
  require 'plugins.nvim-treesitter',
  -- Neotest for go
  require 'plugins.neotest',
  -- tpopes projectionist
  require 'plugins.vim-projectionist',
  -- Autoformat code on save
  require 'plugins.autoformat',
  -- DAP integration
  require 'plugins.debug',
  -- Build system integration
  require 'plugins.vim-dispatch',

  -- *********** VISUAL ***********
  -- Themes
  require 'themes.catppuccin',
  -- Statusline (Lualine)
  require 'plugins.lualine',
  -- Pretty dialogs
  require 'plugins.dressing',

  -- *********** TOOLS ***********
  -- Which key
  require 'plugins.which-key',
  -- Telescope
  require 'plugins.telescope',
  -- File tree
  require 'plugins.nvim-tree',
  -- Window navigation
  'christoomey/vim-tmux-navigator',

  -- More useful plugins
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'mg979/vim-visual-multi'
}, {})

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

-- [[ Focus current file in nvim-tree ]]
local find_file_group = vim.api.nvim_create_augroup('NvimTreeFindFile', { clear = true })
local tree_api = require "nvim-tree.api"
vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    tree_api.tree.find_file()
  end,
  group = find_file_group,
  pattern = '*',
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require 'setup-telescope'

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require 'setup-treesitter'

-- [[ Configure LSP and Mason ]]
require 'setup-lsp'

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
require 'setup-nvim-cmp'

-- Configure NvimTree keymaps
vim.keymap.set('n', '<leader>ft', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = '[F]ile [T]ree' })

-- Configure convience keymaps
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>', { desc = '[W]rite file' })
vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
