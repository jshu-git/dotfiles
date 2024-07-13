return {
  "chentoast/marks.nvim",
  dependencies = {
    "echasnovski/mini.extra",
  },
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

    -- pickers
    local extra = require("mini.extra")
    vim.keymap.set("n", "mf", function()
      extra.pickers.marks({ scope = "buf" })
    end, { desc = "Marks (Buffer)" })
    vim.keymap.set("n", "mF", function()
      extra.pickers.marks({ scope = "global" })
    end, { desc = "Marks (Global)" })
  end,
}
