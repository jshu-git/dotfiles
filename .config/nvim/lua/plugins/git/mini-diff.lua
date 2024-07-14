return {
  "echasnovski/mini.diff",
  config = function()
    local diff = require("mini.diff")
    diff.setup({
      view = {
        style = "sign",
        signs = {
          add = "▌",
          change = "▌",
          delete = "▌",
        },
        priority = 1,
      },
      mappings = {
        apply = "",
        reset = "gH",
        textobject = "ah",
      },
    })

    vim.keymap.set(
      "n",
      "<leader>td",
      diff.toggle_overlay,
      { desc = "Git: Toggle Diff" }
    )
    vim.keymap.set(
      "n",
      "<leader>gr",
      "gH" .. "ah",
      { desc = "Reset Hunk", remap = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gR",
      "gH" .. "iB",
      { desc = "Reset Buffer", remap = true }
    )

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
