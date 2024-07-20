return {
  "echasnovski/mini-git",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local git = require("mini.git")
    git.setup({
      command = {
        split = "vertical",
      },
    })

    vim.keymap.set({ "n", "x" }, "<leader>gs", function()
      git.show_at_cursor({ split = "vertical" })
    end, { desc = "Show (Cursor)" })
  end,
}
