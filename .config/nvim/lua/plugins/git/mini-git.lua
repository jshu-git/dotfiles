return {
  "echasnovski/mini-git",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local git = require("mini.git")
    local extra = require("mini.extra")
    git.setup({
      command = {
        split = "vertical",
      },
    })

    vim.keymap.set({ "n", "x" }, "<leader>gs", function()
      if vim.bo.filetype ~= "git" then
        git.show_at_cursor({ split = "horizontal" })
      else
        git.show_at_cursor({ split = "vertical" })
      end
    end, { desc = "Show" })

    vim.keymap.set(
      { "n", "x" },
      "<leader>gb",
      "<cmd>Git blame -- %<CR>",
      { desc = "Blame" }
    )

    -- pickers
    -- vim.keymap.set(
    --   "n",
    --   "<leader>gf",
    --   extra.pickers.git_files,
    --   { desc = "Git Files (Tracked)" }
    -- )
    -- vim.keymap.set("n", "<leader>gm", function()
    --   extra.pickers.git_files({ scope = "modified" })
    -- end, { desc = "Git Files (Modified)" })
    vim.keymap.set(
      "n",
      "<leader>gc",
      extra.pickers.git_commits,
      { desc = "Commits" }
    )
  end,
}
