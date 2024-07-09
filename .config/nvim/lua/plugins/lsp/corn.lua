return {
  "RaafatTurki/corn.nvim",
  config = function()
    local corn = require("corn")
    corn.setup({
      icons = { error = "󰅚", warn = "󰀪", hint = "󰌶", info = "󰋽" },
      item_preprocess_func = function(item)
        return item
      end,
    })
    vim.keymap.set("n", "<leader>tc", corn.toggle, { desc = "Toggle Corn" })
  end,
}
