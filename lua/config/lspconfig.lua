--  This function gets run when an LSP connects to a particular buffer.
-- local on_attach = function(_, bufnr)
--   -- NOTE: Remember that lua is a real programming language, and as such it is possible
--   -- to define small helper and utility functions so you don't have to repeat yourself
--   -- many times.
--   --
--   -- In this case, we create a function that lets us more easily define mappings specific
--   -- for LSP related items. It sets the mode, buffer and description for us each time.
--   local nmap = function(keys, func, desc)
--     if desc then
--       desc = 'LSP: ' .. desc
--     end
--
--     vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
--   end
--
--   nmap('<leader>ln', vim.lsp.buf.rename, '[L]anguage server re[N]ame')
--   nmap('<leader>la', vim.lsp.buf.code_action, '[L]anguage server code [A]ction')
--   nmap('<leader>lr', '<Cmd>LspRestart<CR>', '[L]anguage server code [R]estart')
--   nmap('<leader>lt', '<Cmd>TroubleToggle<CR>', '[L]anguage server [T]rouble toggle')
--   nmap('<leader>lD', function() vim.diagnostic.enable(false) end, '[L]anguage server [D]isable diagnostics')
--   nmap('<leader>le', vim.diagnostic.enable, '[L]anguage server [E]nable diagnostics')
--
--   nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
--   nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
--   nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
--   -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--   nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[L]anguage server document [S]ymbols')
--   -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
--
--   -- See `:help K` for why this keymap
--   nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
--   nmap('<leader>ld', vim.lsp.buf.signature_help, '[L]anguage server Signature [D]ocumentation')
--   -- TODO: I need to remap this because it's cool
--   -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') disabled because it clashes with tmux window navigation
--
--   -- Lesser used LSP functionality
--   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
--   nmap('gR', vim.lsp.buf.references, '[G]oto [R]eferences')
--
--   -- Create a command `:Format` local to the LSP buffer
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--     vim.lsp.buf.format()
--   end, { desc = 'Format current buffer with LSP' })
-- end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- vim.notify('LSP client attached: ' .. (client and client.name or 'unknown'), vim.log.levels.INFO)
    if not client then return end
    local bufnr = ev.buf
    local server_name = client.name

    -- Call your existing on_attach if you have one:
    -- if servers[server_name] and servers[server_name].on_attach then
    --   servers[server_name].on_attach(client, bufnr)
    -- end

    -- or move config here:
    if server_name == "graphql" then
      -- on_attach for graphql here
    else
      -- NOTE: Remember that lua is a real programming language, and as such it is possible
      -- to define small helper and utility functions so you don't have to repeat yourself
      -- many times.
      --
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>ln', vim.lsp.buf.rename, '[L]anguage server re[N]ame')
      nmap('<leader>la', vim.lsp.buf.code_action, '[L]anguage server code [A]ction')
      nmap('<leader>lr', '<Cmd>LspRestart<CR>', '[L]anguage server code [R]estart')
      nmap('<leader>lt', '<Cmd>TroubleToggle<CR>', '[L]anguage server [T]rouble toggle')
      nmap('<leader>lD', function() vim.diagnostic.enable(false) end, '[L]anguage server [D]isable diagnostics')
      nmap('<leader>le', vim.diagnostic.enable, '[L]anguage server [E]nable diagnostics')

      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, '[L]anguage server document [S]ymbols')
      -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<leader>ld', vim.lsp.buf.signature_help, '[L]anguage server Signature [D]ocumentation')
      -- TODO: I need to remap this because it's cool
      -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') disabled because it clashes with tmux window navigation

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('gR', vim.lsp.buf.references, '[G]oto [R]eferences')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end
  end
})

-- setup Java before LSP configuration
-- require('java').setup()


-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
-- require('mason').setup()
-- require('mason-lspconfig').setup()
-- require('lspconfig').jdtls.setup({})

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  -- clangd = {},
  gopls = {
    gopls = {
      staticcheck = true,
      -- Disalbing linksInHover may not be working as expected:
      linksInHover = true,
      usePlaceholders = true,
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        unusedwrite = true,
        unusedresult = true,
        nilness = true,
      },
      buildFlags = { "-tags=e2e acceptance contract integration tools" },
    }
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
-- detect workspace changes
capabilities = vim.tbl_extend(
  "error",
  capabilities,
  {
    workspace = {
      fileOperations = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  })

-- Ensure the servers and tools above are installed
--
-- To check the current status of installed tools and/or manually install
-- other tools, you can run
--    :Mason
--
-- You can press `g?` for help in this menu.
--
-- `mason` had to be setup earlier: to configure its options see the
-- `dependencies` table for `nvim-lspconfig` above.
--
-- You can add other tools here that you want Mason to install
-- for you, so that they are available from within Neovim.
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
  'stylua', -- Used to format Lua code
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
  automatic_installation = false,
  automatic_enable = true,
  -- handlers = {
  --   function(server_name)
  --     local server = servers[server_name] or {}
  --     -- vim.notify('Setting up LSP server: ' .. server_name, vim.log.levels.INFO)
  --     -- This handles overriding only values explicitly passed
  --     -- by the server configuration above. Useful when disabling
  --     -- certain features of an LSP (for example, turning off formatting for ts_ls)
  --     server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
  --     require('lspconfig')[server_name].setup(server)
  --   end,
  -- },
}

-- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'
--
-- mason_lspconfig.setup {
--   -- ensure_installed = vim.tbl_keys(servers),
--   ensure_installed = {},
--   automatic_installation = false,
--   automatic_enable = true,
--   handlers = {
--     function(server_name)
--       local server = servers[server_name] or {}
--       -- This handles overriding only values explicitly passed
--       -- by the server configuration above. Useful when disabling
--       -- certain features of an LSP (for example, turning off formatting for ts_ls)
--       server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--       require('lspconfig')[server_name].setup(server)
--     end,
--     -- function(server_name)
--     --   local server = servers[server_name] or {}
--     --   vim.notify('Setting up LSP server: ' .. server, vim.log.levels.INFO)
--     --   -- This handles overriding only values explicitly passed
--     --   -- by the server configuration above. Useful when disabling
--     --   -- certain features of an LSP (for example, turning off formatting for ts_ls)
--     --   server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
--     --   -- require('lspconfig')[server_name].setup(server)
--     --   require('lspconfig')[server_name].setup {
--     --     capabilities = capabilities,
--     --     -- on_attach = on_attach,
--     --     settings = servers[server_name],
--     --     filetypes = (servers[server_name] or {}).filetypes,
--     --   }
--     -- end,
--   },
-- }

-- mason_lspconfig.setup_handlers {
--   function(server_name)
--     require('lspconfig')[server_name].setup {
--       capabilities = capabilities,
--       on_attach = on_attach,
--       settings = servers[server_name],
--       filetypes = (servers[server_name] or {}).filetypes,
--     }
--   end,
-- }

-- Diagnostic signs
local signs = {
  Error = " ",
  Warn = "",
  Hint = "",
  Info = " "
}

local diagnostic_config = {
  signs = {
    active = true,
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
vim.diagnostic.config(diagnostic_config)

-- additional functions

-- Set keybinding for organize imports
vim.keymap.set('n', '<leader>lo', function()
  vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true })
end, { desc = '[L]anguage server [O]rganize imports' })
