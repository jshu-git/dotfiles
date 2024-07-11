return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspConfig", { clear = true }),
      callback = function(event)
        local bufnr = event.buf
        local map = function(keys, func, desc)
          vim.keymap.set(
            "n",
            keys,
            func,
            { buffer = bufnr, desc = "LSP: " .. desc }
          )
        end
        local extra = require("mini.extra")

        map("gs", require("pretty_hover").hover, "Hover")
        map("gS", vim.lsp.buf.signature_help, "Signature Help")
        map("ga", vim.lsp.buf.code_action, "Code Action")
        map("gd", "<cmd>Glance definitions<CR>", "Goto Definition")
        map("gr", "<cmd>Glance references<CR>", "Goto References")

        -- inc-rename
        vim.keymap.set("n", "cr", function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end, {
          buffer = bufnr,
          desc = "LSP: Rename Variable",
          expr = true,
        })
        map("cR", ":IncRename ", "Rename Variable")

        -- diagnostics
        map("gl", vim.diagnostic.open_float, "Hover Diagnostic")
        map("<leader>fd", function()
          extra.pickers.diagnostic({ scope = "current" })
        end, "Diagnostics (Buffer)")
        map("<leader>fD", function()
          extra.pickers.diagnostic({ scope = "all" })
        end, "Diagnostics (All)")
        map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
        map("]d", vim.diagnostic.goto_next, "Next Diagnostic")

        -- lsp menu
        map("<leader>li", "<cmd>LspInfo<CR>", "Info")
        map("<leader>lr", "<cmd>LspRestart<CR>", "Restart")

        -- inlay hints
        map("<leader>th", function()
          ---@diagnostic disable-next-line: missing-parameter
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, "Toggle Inlay Hints")
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
              disable = { "missing-fields" },
              globals = { "vim" },
            },
          },
        },
      },

      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticMode = "openFilesOnly",
            },
          },
          python = {},
        },
      },
    }
    if vim.env.SSH_CLIENT ~= nil then
      servers.basedpyright.settings.python.pythonPath =
        "/u/jshu/p4/cacl3/test/tools/python/nate/rhel7-3.12/bin/python"
    end

    -- lspconfig
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("cmp_nvim_lsp").default_capabilities()
    )
    local lspconfig = require("lspconfig")
    for server, config in pairs(servers) do
      config.capabilities =
        vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
      lspconfig[server].setup(config)
    end

    -- ui
    require("lspconfig.ui.windows").default_options.border = "single"
    vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
  end,
}
