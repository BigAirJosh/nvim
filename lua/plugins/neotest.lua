-- disabled for now
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
    "olimorris/neotest-rspec",
  },
  event = "VeryLazy",
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require('neotest').setup({
      adapters = {
        require('neotest-go')({
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s" }
        }),
        require("neotest-rspec"),
      },
    })
    -- Configure Neotest keymaps
    vim.keymap.set('n', '<leader>tl', require('neotest').run.run_last, { desc = '[T]est run [L]ast' })
    -- vim.keymap.set('n', '<leader>tf', require("neotest").run.run(vim.fn.expand("%")), { desc = '[T]est run [F]ile' })
    vim.keymap.set('n', '<leader>tc', require('neotest').run.run, { desc = '[T]est run [C]urrent under cursor' })
    vim.keymap.set('n', '<leader>to', require('neotest').output.open, { desc = '[T]est viw [O]utput' })
    vim.keymap.set('n', '<leader>tp', require('neotest').output_panel.toggle, { desc = '[T]est toggle output [P]anel' })
    vim.keymap.set('n', '<leader>ts', require('neotest').summary.toggle, { desc = '[T]est toggle [S]ummary' })
    vim.keymap.set('n', ']t', require('neotest').jump.next, { desc = 'next test' })
    vim.keymap.set('n', ']f', function() require('neotest').jump.next({ status = "failed" }) end,
      { desc = 'next failed test' })
    vim.keymap.set('n', '[t', require('neotest').jump.prev, { desc = 'previous test' })
    vim.keymap.set('n', ']f', function() require('neotest').jump.prev({ status = "failed" }) end,
      { desc = 'previous failed test' })
  end,
}
