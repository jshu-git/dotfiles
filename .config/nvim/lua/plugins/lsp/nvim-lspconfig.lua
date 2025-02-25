require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    -- https://github.com/Hammerspoon/Spoons/pull/240
    -- https://github.com/gnudad/dotfiles/blob/main/neovim.lua#L301
    { path = vim.env.HOME .. '/.config/hammerspoon/Spoons/EmmyLua.spoon/annotations' },
  },
})

-- lsp
vim.keymap.set('n', 'gs', function()
  vim.lsp.buf.hover({ border = 'single' })
end, { desc = 'LSP: Hover' })
vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = 'LSP: Rename Variable' })

-- diagnostics
vim.keymap.set('n', 'gD', vim.diagnostic.open_float, { desc = 'LSP: Hover Diagnostic' })
vim.diagnostic.config({
  signs = false,
  float = { border = 'single' },
})
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled(), { bufnr = 0 })
end, { desc = 'LSP: Toggle Diagnostics' })

-- inlay hints
vim.keymap.set('n', '<leader>ti', function()
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
          typeCheckingMode = 'basic',
          diagnosticMode = 'openFilesOnly',
        },
      },
    },
  },
  gopls = {},
}
if vim.env.SSH_CLIENT ~= nil then
  servers.basedpyright.settings.python = {
    pythonPath = '/u/jshu/p4/cacl3/test/tools/python/nate/rhel7-3.12/bin/python',
  }
end

-- lspconfig
local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require('lspconfig')
for server, config in pairs(servers) do
  config.capabilities =
    vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities(config.capabilities))
  lspconfig[server].setup(config)
end

-- lspinfo
require('lspconfig.ui.windows').default_options = { border = 'single' }
vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<CR>', { desc = 'LSP: Info' })
vim.keymap.set('n', '<leader>lr', function()
  vim.notify('LSP: Restarting...')
  vim.cmd('LspRestart')
end, { desc = 'LSP: Restart' })
vim.keymap.set('n', '<leader>ll', '<cmd>LspLog<CR><cmd>norm! G<cr>', { desc = 'LSP: Log' })

-- delete bad defaults
if vim.fn.has('nvim-0.11') == 1 then
  -- vim.keymap.del('n', 'grr')
  -- vim.keymap.del('n', 'grn')
  -- vim.keymap.del('n', 'gri')
  -- vim.keymap.del({ 'n', 'x' }, 'gra')
  pcall(vim.keymap.del, 'n', 'grr')
  pcall(vim.keymap.del, 'n', 'gra')
  pcall(vim.keymap.del, 'n', 'gri')
  pcall(vim.keymap.del, 'n', 'grn')
  pcall(vim.keymap.del, { 'n', 'x' }, 'grr')
end
