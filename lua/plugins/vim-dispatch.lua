-- [[ Configure Make on buffer attach ]]
local vim_dispatch_group = vim.api.nvim_create_augroup('VimDispatchGroup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd' }, {
  callback = function()
    vim.cmd [[
      compiler rspec
      set makeprg=bundle\ exec\ rspec
    ]]
  end,
  group = vim_dispatch_group,
  pattern = '*.rb',
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd' }, {
  callback = function()
    vim.cmd [[
      compiler go
      set makeprg=go\ test
    ]]
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
