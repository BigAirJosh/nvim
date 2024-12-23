return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			-- See `:help gitsigns.txt`
			signs      = {
				add = { text = '' }, -- +
				change = { text = '' }, -- ~
				delete = { text = '' }, --  _
				topdelete = { text = '' }, -- ‾
				changedelete = { text = '' }, -- ~
			},
			signcolumn = false, -- Toggle with `:Gitsigns toggle_signs`
			numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`

			on_attach  = function(bufnr)
				vim.keymap.set('n', '<leader>hb', require('gitsigns').blame_line, { buffer = bufnr, desc = '[B]lame line' })
				vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
					{ buffer = bufnr, desc = '[P]review git hunk' })
				vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk, { buffer = bufnr, desc = '[r]eset git hunk' })
				vim.keymap.set('n', '<leader>hR', require('gitsigns').reset_buffer,
					{ buffer = bufnr, desc = '[R]eset git buffer' })

				-- don't override the built-in and fugitive keymaps
				local gs = package.loaded.gitsigns
				vim.keymap.set({ 'n', 'v' }, ']c', function()
					if vim.wo.diff then
						return ']c'
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return '<Ignore>'
				end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
				vim.keymap.set({ 'n', 'v' }, '[c', function()
					if vim.wo.diff then
						return '[c'
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return '<Ignore>'
				end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
			end,
		},
	},
}
