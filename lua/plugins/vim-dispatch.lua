local use_zeus = false
local verbose = false
vim.keymap.set('n', '<leader>mz', function() use_zeus = not use_zeus end, { desc = '[M]ake toggle [Z]eus' })
vim.keymap.set('n', '<leader>mv', function() verbose = not verbose end, { desc = '[M]ake toggle [V]erbose' })

-- [[ Configure Make on buffer attach ]]
local vim_dispatch_group = vim.api.nvim_create_augroup('VimDispatchGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd' }, {
  callback = function()
    if use_zeus then
      vim.cmd [[
      compiler rspec
      set makeprg=zeus\ rspec
      ]]
    else
      vim.cmd [[
      compiler rspec
      set makeprg=bundle\ exec\ rspec
      ]]
    end
  end,
  group = vim_dispatch_group,
  pattern = '*.rb',
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd' }, {
  callback = function()
    if verbose then
      vim.cmd [[
      compiler go
      set makeprg=go\ test -v
      ]]
    else
      vim.cmd [[
      compiler go
      set makeprg=go\ test
      ]]
    end
  end,
  group = vim_dispatch_group,
  pattern = '*.go',
})

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd' }, {
--   callback = function()
--     vim.cmd [[
--       compiler maven
--       set makeprg=mvn\ test
--     ]]
--   end,
--   group = vim_dispatch_group,
--   pattern = '*.java',
-- })
return {
  'tpope/vim-dispatch'
}
