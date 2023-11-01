return {
  "tpope/vim-projectionist",
  config = function()
    vim.g.projectionist_heuristics = {
      -- go file test alternates
      ["*.go"] = {
        ["*_test.go"] = {
          alternate = "{}.go",
          type = "source",
        },
        ["*.go"] = {
          alternate = "{}_test.go",
          type = "test",
        },
      },
      -- ruby file test alternates, this is a little hacky
      ["*.rb"] = {
        ["spec/*_spec.rb"] = {
          alternate = "app/{}.rb",
          type = "source",
        },
        ["app/*.rb"] = {
          alternate = "spec/{}_spec.rb",
          type = "test",
        },
      },
    }
    vim.keymap.set('n', '<leader>a', '<Cmd>A<CR>', { desc = '[A]lternate' })
  end,
}
