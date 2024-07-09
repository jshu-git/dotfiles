return {
  "echasnovski/mini-git",
  config = function()
    local git = require("mini.git")
    git.setup()
    vim.keymap.set(
      { "n", "x" },
      "<leader>gs",
      git.show_at_cursor,
      { desc = "Git Show" }
    )
    vim.keymap.set(
      "n",
      "<leader>gd",
      git.show_diff_source,
      { desc = "Git Diff" }
    )
  end,
}
