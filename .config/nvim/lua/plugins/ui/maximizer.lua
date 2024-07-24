return {
  "0x00-ketsu/maximizer.nvim",
  keys = { "<leader>tm" },
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
