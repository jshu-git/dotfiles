return {
  "gabrielpoca/replacer.nvim",
  config = function()
    local replacer = require("replacer")
    replacer.setup()
    vim.keymap.set("n", "<leader>r", replacer.run)
  end,
}
