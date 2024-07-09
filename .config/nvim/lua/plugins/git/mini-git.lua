return {
  "echasnovski/mini-git",
  config = function()
    local git = require("mini.git")
    git.setup()

    vim.keymap.set({ "n", "x" }, "<leader>gs", function()
      if vim.bo.filetype ~= "git" then
        git.show_at_cursor({ split = "horizontal" })
      else
        git.show_at_cursor({ split = "vertical" })
      end
    end, { desc = "Git Show" })
  end,
}
