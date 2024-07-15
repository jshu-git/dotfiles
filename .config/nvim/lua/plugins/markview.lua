return {
  "OXY2DEV/markview.nvim",
  ft = "markdown",
  config = function()
    require("markview").setup()
    vim.keymap.set("n", "<leader>tv", "<cmd>Markview<CR>")
  end,
}
