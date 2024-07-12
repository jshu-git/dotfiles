return {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  config = function()
    -- default ui
    local signs = {
      error = "󰅚 ",
      warn = "󰀪 ",
      hint = "󰌶 ",
      info = "󰋽 ",
    }
    vim.diagnostic.config({
      virtual_text = false,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.error,
          [vim.diagnostic.severity.WARN] = signs.warn,
          [vim.diagnostic.severity.INFO] = signs.info,
          [vim.diagnostic.severity.HINT] = signs.hint,
        },
      },
      float = {
        border = "single",
      },
      severity_sort = true,
    })

    require("diagflow").setup({
      padding_right = 1,
    })
  end,
  -- {
  --   "RaafatTurki/corn.nvim",
  --   config = function()
  --     local corn = require("corn")
  --     corn.setup({
  --       icons = {
  --         error = signs.error,
  --         warn = signs.warn,
  --         hint = signs.hint,
  --         info = signs.info,
  --       },
  --       item_preprocess_func = function(item)
  --         return item
  --       end,
  --     })
  --     vim.keymap.set("n", "<leader>tc", corn.toggle, { desc = "Toggle Corn" })
  --   end,
  -- },
}
