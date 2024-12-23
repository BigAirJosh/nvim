return {
	-- Set lualine as statusline
	{
		'nvim-lualine/lualine.nvim',
		-- See `:help lualine.txt`
		opts = {
			options = {
				icons_enabled = true,
				theme = 'catppuccin-macchiato',
				-- theme = 'catppuccin-frappe',
				-- theme = 'catppuccin-mocha',
				component_separators = '|',
				section_separators = '',
			},
			extensions = { 'nvim-tree', 'trouble', 'fugitive', 'lazy', 'nvim-dap-ui', 'quickfix', 'neo-tree', 'aerial' },
		},
	},
}
