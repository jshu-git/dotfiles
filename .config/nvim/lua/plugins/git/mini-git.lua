return {
  "echasnovski/mini-git",
  config = function()
    local git = require("mini.git")
    git.setup()
    -- vim.keymap.set("n", "<leader>gg", git.diff.get, { desc = "Git Diff" })
  end,
}
