-- customize the picker window to display file then path
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "TelescopeResults",
--   callback = function(ctx)
--     vim.api.nvim_buf_call(ctx.buf, function()
--       vim.fn.matchadd("TelescopeParent", "\t\t.*$")
--       vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
--     end)
--   end,
-- })
--
-- local function filenameFirst(_, path)
--   local tail = vim.fs.basename(path)
--   local parent = vim.fs.dirname(path)
--   if parent == "." then return tail end
--   return string.format("%s\t\t%s", tail, parent)
-- end

-- Setup Telescope
require('telescope').setup {
  defaults = {
    theme = "ivy",
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    file_ignore_patterns = { "vendor/.*", "node_modules/.*", ".git/*" },
    -- path_display = filenameFirst,
    path_display = {
      filename_first = {
        reverse_directories = false
      },
    },
  },
  pickers = {
    buffers = {
      theme = "ivy"
    },
    find_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    },
    grep_string = {
      theme = "ivy"
    },
    git_files = {
      theme = "ivy"
    },
    git_status = {
      theme = "ivy"
    },
    help_tags = {
      theme = "ivy"
    },
    tmux = {
      theme = "ivy"
    },
  },
  extensions = {
    fzf = {},
  },
  -- pickers = {
  --   find_files = { path_display = filenameFirst },
  --   git_status = { path_display = filenameFirst },
  -- },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'search_dir_picker')
pcall(require('telescope').load_extension, 'tmux')
pcall(require('telescope').load_extension, 'rest')

-- pcall(require('telescope').load_extension, 'circleci')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>go', require('telescope.builtin').git_status, { desc = 'Search [G]it [O]pen' })
vim.keymap.set('n', '<leader>sf', function() require('telescope.builtin').find_files({ hidden = true }) end,
  { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sg',
--   function() require('telescope').extensions.live_grep_args.live_grep_args() end,
--   { desc = '[S]earch code by [G]rep' })
vim.keymap.set('n', '<leader>sc',
  function() require('telescope.builtin').live_grep({ glob_pattern = "!{spec,test,mocks}" }) end,
  { desc = '[S]earch code by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>sp', function() require('search_dir_picker').search_dir() end,
  { desc = '[S]earch [P]ick directory' })
vim.keymap.set('n', '<leader>sn', function()
    require('telescope.builtin').find_files {
      cwd = vim.fn.stdpath('config')
    }
  end,
  { desc = '[S]earch [N]eovim config' })
vim.keymap.set('n', '<leader>sl', function()
    require('telescope.builtin').find_files {
      cwd = vim.fn.stdpath('data')
    }
  end,
  { desc = '[S]earch neovim [L]ibraries' })

-- telescope tmux navigation keymaps
vim.keymap.set('n', '<leader>sts', '<Cmd>:Telescope tmux sessions<CR>', { desc = '[S]earch [T]mux [S]essons' })
vim.keymap.set('n', '<leader>stw', '<Cmd>:Telescope tmux windows<CR>', { desc = '[S]earch [T]mux [W]indows' })
vim.keymap.set('n', '<leader>stp', '<Cmd>:Telescope tmux pane_contents<CR>', { desc = '[S]earch [T]mux [P]ane contents' })
