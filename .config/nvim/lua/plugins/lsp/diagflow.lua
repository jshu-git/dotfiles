return {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  config = function()
    -- default ui
    vim.diagnostic.config({
      virtual_text = false,
      float = { border = "single" },
      severity_sort = true,
    })
    local signs = require("config.utils").signs
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end

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
