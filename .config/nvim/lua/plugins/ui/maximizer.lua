return {
  "0x00-ketsu/maximizer.nvim",
  config = function()
    local maximizer = require("maximizer")
    maximizer.setup()
    vim.keymap.set(
      "n",
      "<leader>tm",
      maximizer.toggle,
      { desc = "Toggle Maximize" }
    )
  end,
}
