-- setup refactoring
require('refactoring').setup {}

-- refactor keymaps
vim.keymap.set('x', '<leader>rv', '<Cmd>Refactor extract_var<CR>', { desc = '[R]efactor extract [V]ar' })
vim.keymap.set('x', '<leader>re', '<Cmd>Refactor extract<CR>', { desc = '[R]efactor [E]xtract' })
vim.keymap.set('x', '<leader>rn', '<Cmd>Refactor refactor_names<CR>', { desc = '[R]efactor [N]ames' })
-- prompt for a refactor to apply when the remap is triggered
vim.keymap.set(
  { "n", "x" },
  "<leader>rr",
  function() require('refactoring').select_refactor({}) end,
  { desc = '[R]efactor' })
