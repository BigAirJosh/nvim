local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ED8796" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#EED49F" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#8AADF4" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#F5A97F" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6DA95" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C6A0F6" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#91D7E3" })
end)

local M = {
  default_char = '┆',
  bold_char = '▏',
  default_highlight = 'IblIndent',
  rainbow_highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  },
  enabled = true,
}

M.char = M.default_char
M.highlight = M.default_highlight

require("ibl").setup {
  enabled = M.enabled,
  indent = {
    char = M.char,
    highlight = M.highlight,
  },
}

function M.overwrite()
  require("ibl").overwrite {
    enabled = M.enabled,
    indent = {
      char = M.char,
      highlight = M.highlight,
    },
  }
end

vim.keymap.set('n', '<leader>wid', function()
  M.highlight = M.default_highlight
  M.char = M.default_char
  M.overwrite()
end, { desc = '[Window] [I]ndent [D]efault' })

vim.keymap.set('n', '<leader>wir', function()
  M.highlight = M.rainbow_highlight
  M.overwrite()
end, { desc = '[Window] [I]ndent [R]ainbow' })

vim.keymap.set('n', '<leader>wit', function()
  M.enabled = not M.enabled
  M.overwrite()
end, { desc = '[Window] [I]ndent [T]oggle' })
