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
  -- Tmux navigation care of telescope
  require 'plugins.telescope-tmux',
  require 'plugins.alpha-nvim',
  -- Window navigation
  'christoomey/vim-tmux-navigator',
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = { "BufEnter" },
    config = function()
      -- Turn on LSP, formatting, and linting status and progress information
      require("fidget").setup({
        text = {
          spinner = "dots_negative",
        },
      })
    end,
  },
  -- More useful plugins
  'ThePrimeagen/vim-be-good',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'mg979/vim-visual-multi',
  'famiu/bufdelete.nvim',
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")

      local filtered_message = { "No information available" }

      -- Override notify function to filter out messages
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(message, level, opts)
        local merged_opts = vim.tbl_extend("force", {
          on_open = function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
          end,
        }, opts or {})

        for _, msg in ipairs(filtered_message) do
          if message == msg then
            return
          end
        end
        return notify(message, level, merged_opts)
      end

      -- Update colors to use catpuccino colors
      vim.cmd([[
        highlight NotifyERRORBorder guifg=#ed8796
        highlight NotifyERRORIcon guifg=#ed8796
        highlight NotifyERRORTitle  guifg=#ed8796
        highlight NotifyINFOBorder guifg=#8aadf4
        highlight NotifyINFOIcon guifg=#8aadf4
        highlight NotifyINFOTitle guifg=#8aadf4
        highlight NotifyWARNBorder guifg=#f5a97f
        highlight NotifyWARNIcon guifg=#f5a97f
        highlight NotifyWARNTitle guifg=#f5a97f
      ]])
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  { "AndrewRadev/splitjoin.vim" },
  "ggandor/leap.nvim",
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup {}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
  },
  -- "tomoakley/circleci.nvim",
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
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    tree_api.tree.find_file()
    -- require('neo-tree.command').execute({
    --   action = "show",
    --   -- source = "filesystem",     -- OPTIONAL, this is the default value
    --   -- position = "left",         -- OPTIONAL, this is the default value
    --   reveal = true,
    --   toggle = false,
    --   -- reveal_file = reveal_file, -- path to file or folder to reveal
    --   reveal_force_cwd = true, -- change cwd without asking if needed
    -- })
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

-- [[ Configure Harpoon ]]
-- See `:help harpoon`
require 'setup-harpoon'

-- -- [[ Configure noice ]]
-- -- See `:help noice`
-- require("noice").setup({
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true,
--     },
--   },
--   -- you can enable a preset for easier configuration
--   presets = {
--     bottom_search = true,         -- use a classic bottom cmdline for search
--     command_palette = true,       -- position the cmdline and popupmenu together
--     long_message_to_split = true, -- long messages will be sent to a split
--     inc_rename = false,           -- enables an input dialog for inc-rename.nvim
--     lsp_doc_border = true,        -- add a border to hover docs and signature help
--   },
-- })

-- setup leap
require('leap').add_default_mappings()

-- setup refactoring
require('refactoring').setup {}

-- [[ Configure Alpha ]]
require 'setup-alpha-nvim'

-- [[ configure circleci ]]
-- require('nvim-circleci').setup {
--   -- TODO set this from the base directory
--   project_slug = 'github/deliveroo/orderweb'
-- }

vim.cmd.colorscheme "catppuccin-macchiato"

-- Configure NvimTree keymaps
vim.keymap.set('n', '<leader>ft', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = '[F]ile [T]ree' })

-- Configure convience keymaps
vim.keymap.set('n', '<leader>w', '<Cmd>write<CR>', { desc = '[W]rite file' })
vim.keymap.set('n', '<leader>gg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[G]it' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
