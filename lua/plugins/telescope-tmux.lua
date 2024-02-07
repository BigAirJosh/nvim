return {
  'camgraff/telescope-tmux.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    {
      'norcalli/nvim-terminal.lua',
      config = function()
        require 'terminal'.setup()
      end,
    },
  },
}
