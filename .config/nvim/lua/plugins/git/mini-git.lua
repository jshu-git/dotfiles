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
      git.show_at_cursor({ split = "vertical" })
    end, { desc = "Show (Cursor)" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "git",
      },
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    })

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
