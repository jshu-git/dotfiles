return {
  "chentoast/marks.nvim",
  config = function()
    require("marks").setup({
      default_mappings = false,
      cyclic = false,
    })

    vim.keymap.set("n", "mm", "<Plug>(Marks-toggle)", { desc = "Toggle" })
    vim.keymap.set("n", "mn", "<Plug>(Marks-next)", { desc = "Next" })
    vim.keymap.set("n", "mp", "<Plug>(Marks-prev)", { desc = "Previous" })
    vim.keymap.set("n", "md", "<Plug>(Marks-delete)", { desc = "Delete" })
    vim.keymap.set(
      "n",
      "mD",
      "<Plug>(Marks-deletebuf)",
      { desc = "Delete (Buffer)" }
    )
  end,
}
