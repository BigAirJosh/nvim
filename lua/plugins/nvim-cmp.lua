return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    -- TODO: add buffersource completion and path source completion (also in the source config)
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',

    -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',

    -- Adds Copilot with completion support
    {
      "zbirenbaum/copilot-cmp",
      config = function()
        require("copilot_cmp").setup()
      end,
      dependencies = {
        {
          'zbirenbaum/copilot.lua',
          config = function()
            require("copilot").setup({
              suggestion = { enabled = false },
              panel = { enabled = false },
            })
          end,
        },
      },
    },
  },
}
