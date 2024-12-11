require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
    icons = {
      glyphs = {
        git = {
          unstaged = "", --= "✗",
          staged = "", --= "✓",
          unmerged = "", --= "",
          renamed = "", --= "➜",
          untracked = "", --= "★",
          deleted = "", --= "",
          ignored = "", --= "◌",
        }
      }
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
  },
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

-- [[ Keymaps ]]
vim.keymap.set('n', '<leader>e', '<Cmd>:NvimTreeFindFileToggle<Cr>', { desc = 'Open file tr[e]e' })
