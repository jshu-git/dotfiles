-- https://neovim.io/doc/user/lsp.html#lsp-defaults-disable
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     vim.keymap.del('n', 'K', { buffer = args.buf })
--   end,
-- })

require('lazydev').setup()

-- glance
-- local glance = require('glance')
-- local actions = glance.actions
-- glance.setup({
--   height = require('utils').popup.height,
--   border = { enable = true, top_char = '', bottom_char = '▔' },
--   list = { width = 0.2 },
--   theme = { enable = false },
--   mappings = {
--     list = {
--       ['<C-v>'] = actions.jump_vsplit,
--       ['<C-s>'] = actions.jump_split,
--       ['<C-CR>'] = actions.enter_win('preview'),
--       ['<esc>'] = actions.close,
--     },
--     preview = {
--       ['<esc>'] = actions.enter_win('list'),
--     },
--   },
--   folds = { folded = false },
-- })

-- inc-rename
require('inc_rename').setup({
  preview_empty_name = true,
  save_in_cmdline_history = false,
})

local map = function(lhs, rhs, desc, opts)
  vim.keymap.set('n', lhs, rhs, vim.tbl_deep_extend('force', { desc = 'LSP: ' .. desc }, opts or {}))
end
map('gs', vim.lsp.buf.hover, 'Hover')
map('gS', vim.lsp.buf.signature_help, 'Signature Help')
map('ga', vim.lsp.buf.code_action, 'Code Action')

-- glance
-- map('gd', '<cmd>Glance definitions<CR>', 'Goto Definition')
-- map('gr', '<cmd>Glance references<CR>', 'Goto References')
map('gd', function()
  require('mini.extra').pickers.lsp({ scope = 'definition' })
end, 'Goto Definition')
map('gr', function()
  require('mini.extra').pickers.lsp({ scope = 'references' })
end, 'Goto References')

-- inc-rename
map('cr', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, 'LSP: Rename Variable', { expr = true })
map('cR', ':IncRename ', 'Rename Variable')

-- lspinfo
map('<leader>li', '<cmd>LspInfo<CR>', 'Info')
map('<leader>lr', '<cmd>LspRestart<CR>', 'Restart')
map('<leader>ll', '<cmd>LspLog<CR>', 'Restart')

-- diagnostics
map('gl', vim.diagnostic.open_float, 'Hover Diagnostic')
map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')

-- inlay hints
map('<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, 'Toggle Inlay Hints')

local servers = {
  marksman = {},
  taplo = {},
  lua_ls = {
    settings = {
      Lua = {
        hint = { enable = true },
        diagnostics = {
          disable = { 'missing-fields' },
          globals = { 'vim' },
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
  -- ts_ls = {},
  -- pico8_ls = {},
}
if vim.env.SSH_CLIENT ~= nil then
  servers.basedpyright.settings.python = {
    pythonPath = '/u/jshu/p4/cacl3/test/tools/python/nate/rhel7-3.12/bin/python',
  }
end

-- lspconfig
local capabilities = vim.tbl_deep_extend(
  'force',
  vim.lsp.protocol.make_client_capabilities(),
  require('cmp_nvim_lsp').default_capabilities()
)
local lspconfig = require('lspconfig')
for server, config in pairs(servers) do
  config.capabilities = capabilities
  lspconfig[server].setup(config)
end

-- lspinfo
require('lspconfig.ui.windows').default_options = {
  border = 'single',
}

-- ui
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = 'single',
})
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = 'single',
})

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
  signs = {
    priority = 9999,
    text = {
      [vim.diagnostic.severity.ERROR] = require('utils').signs.Error,
      [vim.diagnostic.severity.WARN] = require('utils').signs.Warn,
      [vim.diagnostic.severity.INFO] = require('utils').signs.Info,
      [vim.diagnostic.severity.HINT] = require('utils').signs.Hint,
    },
  },
})
vim.keymap.set('n', '<leader>tD', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled(), { bufnr = 0 })
end, { desc = 'Toggle Diagnostics' })

if vim.fn.has('nvim-0.11') == 1 then
  vim.keymap.del('n', 'grr')
  vim.keymap.del('n', 'grn')
  vim.keymap.del({ 'n', 'x' }, 'gra')
end
