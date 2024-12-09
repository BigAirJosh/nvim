-- File tree because I still need one :)
return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('nvim-tree').setup({
				sort_by = "case_sensitive",
				view = {
					width = 50,
				},
				renderer = {
					group_empty = true,
					icons = {
						glyphs = {
							git = {
								unstaged = "", --= "✗",
								staged = "", --= "✓",
								unmerged = "", --= "",
								renamed = "", --= "➜",
								untracked = "", --= "★",
								deleted = "", --= "",
								ignored = "", --= "◌",
							}
						}
					}
				},
				diagnostics = {
					enable = true,
					show_on_dirs = false,
					show_on_open_dirs = true,
					debounce_delay = 50,
					severity = {
						min = vim.diagnostic.severity.HINT,
						max = vim.diagnostic.severity.ERROR,
					},
					icons = {
						hint = "",
						info = "",
						warning = "",
						error = "",
					},
				},
				filters = {
					dotfiles = false,
				},
			})
		end,
	},
}
