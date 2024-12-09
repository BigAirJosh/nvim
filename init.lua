-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- [[ Focus current file in nvim-tree ]]
local find_file_group = vim.api.nvim_create_augroup('NvimTreeFindFile', { clear = true })
local tree_api = require "nvim-tree.api"
vim.api.nvim_create_autocmd('BufEnter', {
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

-- setup refactoring
require('refactoring').setup {}

vim.cmd.colorscheme "catppuccin-macchiato"
-- vim.cmd.colorscheme "catppuccin-frappe"
-- vim.cmd.colorscheme "catppuccin-mocha"

-- Configure convience keymaps
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>', { desc = '[W]rite file' })
vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it' })

-- [[ Configure aerial ]]
require("aerial").setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- set vim-test strategy to dispact
vim.g["test#strategy"] = "dispatch"

-- set background to transparent
vim.cmd.highlight({ "Normal", "guibg=NONE" })
vim.cmd.highlight({ "Normal", "ctermbg=NONE" })

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
