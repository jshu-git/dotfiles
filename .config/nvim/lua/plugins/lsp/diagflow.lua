return {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  config = function()
    require("diagflow").setup({
      padding_right = 1,
    })
  end,

  -- "rachartier/tiny-inline-diagnostic.nvim",
  -- enabled = false,
  -- event = "VeryLazy",
  -- config = function()
  --   -- Default configuration
  --   require("tiny-inline-diagnostic").setup({
  --     signs = {
  --       left = "",
  --       right = "",
  --       diag = "●",
  --       arrow = "    ",
  --       up_arrow = "    ",
  --       vertical = " │",
  --       vertical_end = " └",
  --     },
  --     -- blend = {
  --     -- factor = 0.2,
  --     -- },
  --   })
  -- end,

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
