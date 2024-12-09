local M = {}
M.window_memory = {}
function M.memorize_windows()
	local current = vim.api.nvim_win_get_number(0)
	vim.print('current ' .. current)
	local windows = vim.api.nvim_list_wins()
	for key, value in pairs(windows) do
		vim.print('window ' .. key .. ' ' .. value)
		local window = vim.api.nvim_win_get_config(value)
		vim.print(window)
		local buffer = vim.api.nvim_win_get_buf(value)
		vim.print(buffer)
		M.window_memory[key] = { window = window, buffer = buffer, current = key == current }
	end
end

-- vim.cmd('wincmd o')

function M.restore_windows()
	vim.cmd('wincmd o')
	-- handle the active window
	for key, value in pairs(M.window_memory) do
		if value.current then
			vim.api.nvim_win_set_buf(0, value.buffer)
		else
			vim.api.nvim_open_win(value.buffer, false, value.window)
		end
	end
end

vim.keymap.set('n', '<leader>wm', M.memorize_windows, { desc = '[W]indows [M]emorize' })
vim.keymap.set('n', '<leader>wr', M.restore_windows, { desc = '[W]indows [R]estore' })
print('loaded windows')
