return {
  "2kabhishek/nerdy.nvim",
  keys = { "<leader>fi" },
  config = function()
    vim.keymap.set(
      "n",
      "<leader>fi",
      "<cmd>Nerdy<cr>",
      { desc = "Icons (Nerd Font)" }
    )
  end,
}
