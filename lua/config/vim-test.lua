-- vim-test
vim.keymap.set("n", "<leader>tn", "<Cmd>:TestNearest<CR>", { desc = "[T]est the [N]earest test" })
vim.keymap.set("n", "<leader>ts", "<Cmd>:TestSuite<CR>", { desc = "[T]est the entire [S]uite" })
vim.keymap.set("n", "<leader>tf", "<Cmd>:TestFile<CR>", { desc = "[T]est the entire [F]ile" })
vim.keymap.set("n", "<leader>tl", "<Cmd>:TestLast<CR>", { desc = "[T]est the [L]ast test" })

-- set vim-test strategy to dispact
vim.g["test#strategy"] = "dispatch"

vim.cmd([[
function! GoTransform(cmd) abort
  if a:cmd =~ 'e2e'
    return 'dotenvx run -- ' . a:cmd . ' -v -count=1'
  endif

  if a:cmd =~ 'go test'
    return a:cmd . ' -v -count=1 -cover'
  endif

  return a:cmd
endfunction

let g:test#custom_transformations = { 'go': function('GoTransform') }
let g:test#transformation = 'go'
]])
