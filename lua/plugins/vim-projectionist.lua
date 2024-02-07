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
      -- java file test alternates, this is a little hacky
      ['pom.xml|build.gradle|settings.gradle'] = {

        -- projections for java
        ['src/main/java/*.java'] = {
          type = "source",
          alternate = { "src/test/java/{}Test.java", "src/test/java/{}ITCase.java", "src/test/java/{}Tests.java",
            "src/test/java/{}IT.java" },
        },
        ['src/test/java/*Test.java'] = {
          type = "test",
          alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*IT.java'] = {
          type = "test",
          alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*Tests.java'] = {
          type = "test",
          alternate = "src/main/java/{}.java"
        },
        ['src/test/java/*ITCase.java'] = {
          type = "test",
          alternate = "src/main/java/{}.java"
        }
      },
    }
    vim.keymap.set('n', '<leader>a', '<Cmd>A<CR>', { desc = '[A]lternate' })
  end,
}
