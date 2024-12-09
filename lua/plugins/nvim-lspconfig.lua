-- LSP Configuration & Plugins
-- mason is used to install language servers
return {
	-- LSP Configuration & Plugins
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			-- Autocompletion
			{
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
				opts = function(_, opts)
					opts.sources = opts.sources or {}
					table.insert(opts.sources, {
						name = "lazydev",
						group_index = 0, -- set group index to 0 to skip loading LuaLS completions
					})
				end,
			},
		},
	},
}
