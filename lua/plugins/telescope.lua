-- Fuzzy Finder (files, lsp, etc)
return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		-- branch = 'master',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'smilovanovic/telescope-search-dir-picker.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
		config = function()
			require('config.telescope')
		end,
	},
}
