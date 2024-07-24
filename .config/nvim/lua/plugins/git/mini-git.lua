return {
  "echasnovski/mini-git",
  keys = {
    { "<leader>gs", mode = { "n", "x" } },
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
