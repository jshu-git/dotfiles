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

    -- pickers
    local extra = require("mini.extra")
    vim.keymap.set("n", "<leader>gf", function()
      extra.pickers.git_files({ scope = "tracked" })
    end, { desc = "Files (Tracked)" })
    vim.keymap.set("n", "<leader>gF", function()
      extra.pickers.git_files({ scope = "untracked" })
    end, { desc = "Files (Untracked)" })
    vim.keymap.set("n", "<leader>gm", function()
      extra.pickers.git_files({ scope = "modified" })
    end, { desc = "Files (Modified)" })
    vim.keymap.set("n", "<leader>gi", function()
      extra.pickers.git_files({ scope = "ignored" })
    end, { desc = "Files (Ignored)" })
    vim.keymap.set("n", "<leader>gh", function()
      extra.pickers.git_hunks({ n_context = 5 })
    end, { desc = "Hunks" })
    vim.keymap.set(
      "n",
      "<leader>gc",
      extra.pickers.git_commits,
      { desc = "Commits" }
    )
  end,
}
