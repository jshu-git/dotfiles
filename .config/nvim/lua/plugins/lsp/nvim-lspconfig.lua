require('lazydev').setup({
  library = {
    -- https://github.com/Hammerspoon/Spoons/pull/240
    -- https://github.com/gnudad/dotfiles/blob/main/neovim.lua#L301
    { path = vim.env.HOME .. '/.config/hammerspoon/Spoons/EmmyLua.spoon/annotations' },
  },
})

-- lsp
vim.keymap.set('n', 'gs', vim.lsp.buf.hover, { desc = 'LSP: Hover' })
vim.keymap.set('n', 'gS', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Help' })
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { desc = 'LSP: Code Action' })
vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = 'LSP: Rename Variable' })

-- diagnostics
vim.diagnostic.config({
  virtual_text = {
    -- prefix = ' 󰧞',
    prefix = '',
    suffix = ' ',
    -- virt_text_pos = 'inline',
    -- virt_text_win_col = 80,
    update_in_insert = false,
  },
  float = {
    border = 'single',
  },
  severity_sort = true,
  signs = false,
  -- signs = {
  --   priority = 9999,
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = require('utils').signs.Error,
  --     [vim.diagnostic.severity.WARN] = require('utils').signs.Warn,
  --     [vim.diagnostic.severity.INFO] = require('utils').signs.Info,
  --     [vim.diagnostic.severity.HINT] = require('utils').signs.Hint,
  --   },
  -- },
})
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled(), { bufnr = 0 })
end, { desc = 'LSP: Toggle Diagnostics' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'LSP: Hover Diagnostic' })
vim.keymap.set('n', '[d', vim.diagnostic.get_next, { desc = 'LSP: Previous Diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.get_prev, { desc = 'LSP: Next Diagnostic' })

-- inlay hints
vim.keymap.set('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'LSP: Toggle Inlay Hints' })

local servers = {
  marksman = {},
  taplo = {},
  lua_ls = {
    settings = {
      Lua = {
        hint = { enable = true },
        diagnostics = {
          disable = { 'missing-fields' },
          globals = { 'vim', 'hs' },
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        checkOnSave = {
          command = 'clippy',
        },
      },
    },
  },
  basedpyright = {
    settings = {
      basedpyright = {
        analysis = {
          typeCheckingMode = 'off',
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
  },
  zls = {
    settings = {
      -- https://github.com/zigtools/zls/blob/master/src/Config.zig
      warn_style = true,
      highlight_global_var_declarations = true,
      zig_exe_path = '/usr/local/bin/zig/zig',
    },
  },
}
if vim.env.SSH_CLIENT ~= nil then
  servers.basedpyright.settings.python = {
    pythonPath = '/u/jshu/p4/cacl3/test/tools/python/nate/rhel7-3.12/bin/python',
  }
end

-- lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = vim.tbl_deep_extend(
--   'force',
--   vim.lsp.protocol.make_client_capabilities(),
--   require('cmp_nvim_lsp').default_capabilities()
-- )
local lspconfig = require('lspconfig')
for server, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end

-- lspinfo
require('lspconfig.ui.windows').default_options = { border = 'single' }
vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<CR>', { desc = 'Info' })
vim.keymap.set('n', '<leader>lr', '<cmd>LspRestart<CR>', { desc = 'Restart' })
vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<CR>', { desc = 'Log' })

-- ui
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'single',
})

-- delete bad defaults
if vim.fn.has('nvim-0.11') == 1 then
  vim.keymap.del('n', 'grr')
  vim.keymap.del('n', 'grn')
  vim.keymap.del({ 'n', 'x' }, 'gra')
  -- pcall(vim.keymap.del, 'n', 'grr')
  -- pcall(vim.keymap.del, 'n', 'gra')
  -- pcall(vim.keymap.del, { 'n', 'x' }, 'grr')
end
