-- File tree because I still need one :)
return {
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			require('config.nvim-tree')
		end,
	},
}
