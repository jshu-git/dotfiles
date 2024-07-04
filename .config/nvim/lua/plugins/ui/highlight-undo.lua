return {
  "tzachar/highlight-undo.nvim",
  keys = "u",
  config = function()
    require("highlight-undo").setup({
      duration = 200,
      undo = {
        hlgroup = "HighlightUndo",
        mode = "n",
        lhs = "u",
        map = "undo",
        opts = {},
      },
      redo = {
        hlgroup = "HighlightRedo",
        mode = "n",
        lhs = "U",
        map = "redo",
        opts = {},
      },
      highlight_for_count = true,
    })
  end,
}
