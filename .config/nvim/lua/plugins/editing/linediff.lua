return {
  "AndrewRadev/linediff.vim",
  init = function()
    vim.keymap.set(
      "x",
      "<leader>l",
      ":<C-U>'<,'>Linediff<cr>",
      { desc = "Diff Line(s)" }
    )
  end,
}
