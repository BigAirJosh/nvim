return {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedwrite = true,
        unusedresult = true,
        nilness = true,
      },
      staticcheck = true,
      linksInHover = true,
      usePlaceholders = true,
      -- completeUnimported = true,
      experimentalPostfixCompletions = true,
      -- matcher = "fuzzy",
      -- codelenses = {
      --   gc_details = true,
      --   generate = true,
      --   regenerate_cgo = true,
      --   test = true,
      --   tidy = true,
      -- },
      -- semanticTokens = true,
      buildFlags = { "-tags=e2e acceptance contract integration tools" },
    },
  },
}
