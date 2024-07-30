return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('LspConfig', { clear = true }),
      callback = function(event)
        local bufnr = event.buf
        local map = function(keys, func, desc)
          vim.keymap.set(
            'n',
            keys,
            func,
            { buffer = bufnr, desc = 'LSP: ' .. desc }
          )
        end

        map('gs', vim.lsp.buf.hover, 'Hover')
        map('gS', vim.lsp.buf.signature_help, 'Signature Help')
        map('ga', vim.lsp.buf.code_action, 'Code Action')
        map('gd', '<cmd>Glance definitions<CR>', 'Goto Definition')
        map('gr', '<cmd>Glance references<CR>', 'Goto References')

        -- inc-rename
        vim.keymap.set('n', 'cr', function()
          return ':IncRename ' .. vim.fn.expand('<cword>')
        end, {
          buffer = bufnr,
          desc = 'LSP: Rename Variable',
          expr = true,
        })
        map('cR', ':IncRename ', 'Rename Variable')

        -- diagnostics
        map('gl', vim.diagnostic.open_float, 'Hover Diagnostic')
        map('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
        map(']d', vim.diagnostic.goto_next, 'Next Diagnostic')

        -- lsp menu
        map('<leader>li', '<cmd>LspInfo<CR>', 'Info')
        map('<leader>lr', '<cmd>LspRestart<CR>', 'Restart')

        -- inlay hints
        map('<leader>th', function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
            { bufnr = bufnr }
          )
        end, 'Toggle Inlay Hints')
      end,
    })

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
          python = {},
        },
      },
    }
    if vim.env.SSH_CLIENT ~= nil then
      servers.basedpyright.settings.python.pythonPath =
        '/u/jshu/p4/cacl3/test/tools/python/nate/rhel7-3.12/bin/python'
    end

    -- lspconfig
    local capabilities = vim.tbl_deep_extend(
      'force',
      vim.lsp.protocol.make_client_capabilities(),
      require('cmp_nvim_lsp').default_capabilities()
    )
    local lspconfig = require('lspconfig')
    for server, config in pairs(servers) do
      config.capabilities =
        vim.tbl_deep_extend('force', capabilities, config.capabilities or {})
      lspconfig[server].setup(config)
    end

    -- lspinfo
    require('lspconfig.ui.windows').default_options = {
      border = 'single',
    }

    -- diagnostics
    vim.diagnostic.config({
      virtual_text = {
        -- prefix = ' 󰧞',
        prefix = '',
        suffix = ' ',
        severity_sort = true,
        -- virt_text_pos = 'inline',
        -- virt_text_win_col = 80,
      },
      float = {
        border = 'single',
        severity_sort = true,
      },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = require('config.utils').signs.Error,
          [vim.diagnostic.severity.WARN] = require('config.utils').signs.Warn,
          [vim.diagnostic.severity.INFO] = require('config.utils').signs.Info,
          [vim.diagnostic.severity.HINT] = require('config.utils').signs.Hint,
        },
      },
    })
    vim.keymap.set('n', '<leader>tD', function()
      vim.diagnostic.enable(not vim.diagnostic.is_enabled(), { bufnr = 0 })
    end, { desc = 'Toggle Diagnostics' })
  end,
}
