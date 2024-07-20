return {
  "AndrewRadev/linediff.vim",
  init = function()
    vim.g.linediff_sign_highlight_group = "DiffChange"
    vim.keymap.set("n", "<leader>L", "<cmd>Linediff<cr>", { desc = "Linediff" })
    vim.keymap.set(
      "x",
      "<leader>L",
      ":<C-U>'<,'>Linediff<cr>",
      { desc = "Linediff (Visual)" }
    )
  end,
}
