local use_zeus = false
local verbose = false

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

vim.keymap.set('n', '<leader>mz', function() use_zeus = not use_zeus end, { desc = '[M]ake toggle [Z]eus' })
vim.keymap.set('n', '<leader>mv', function() verbose = not verbose end, { desc = '[M]ake toggle [V]erbose' })

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

-- Make using vim-dispatch
vim.keymap.set('n', '<F13>', '<Cmd>:Make %<CR>', { desc = 'Make the thing' })
vim.keymap.set('n', '<C-F13>', '<Cmd>:Make #<CR>', { desc = 'Make the alternate thing' })
vim.keymap.set('n', '<leader>mm', '<Cmd>:Make %<CR>', { desc = '[M]ake the current buffer' })
vim.keymap.set('n', '<leader>ml', '<Cmd>:Make %\\:line(\'.\')<CR>', { desc = '[M]ake the current buffer:line' })
vim.keymap.set('n', '<leader>mg', '<Cmd>:Make ./%:p:.:h/...<CR>', { desc = '[M]ake [g]o' })
vim.keymap.set('n', '<leader>mG', '<Cmd>:Make! ./%:p:.:h/...<CR>', { desc = '[M]ake [G]o Background' })
vim.keymap.set('n', '<leader>ma', '<Cmd>:Make #<CR>', { desc = '[M]ake the [A]lternate buffer' })
vim.keymap.set('n', '<leader>md', '<Cmd>:Make % --order defined<CR>', { desc = '[M]ake order [D]efined' })

vim.keymap.set('n', '<leader>mc', '<Cmd>:cclose<CR>', { desc = '[M]ake [C]lose quickfix window' })
vim.keymap.set('n', '<leader>mo', '<Cmd>:Copen<CR>', { desc = '[M]ake [o]open quickfix window (dispatch)' })
vim.keymap.set('n', '<leader>mO', '<Cmd>:copen<CR>', { desc = '[M]ake [O]open quickfix window (native)' })
