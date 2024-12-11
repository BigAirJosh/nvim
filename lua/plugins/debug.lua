-- debug.lua
-- configured for GO

return {
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			-- debugger UI
			'rcarriga/nvim-dap-ui',
			'nvim-neotest/nvim-nio',

			-- Installs the debug adapters
			'williamboman/mason.nvim',
			'jay-babu/mason-nvim-dap.nvim',

			-- Add your own debuggers here
			'leoluz/nvim-dap-go',
		},
		event = "VeryLazy",
		config = function()
			require('config.debug')
		end,
	},
}
