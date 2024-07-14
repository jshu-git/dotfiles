return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      signs = {
        add = { text = "▌" },
        change = { text = "▌" },
        delete = { text = "-" },
        topdelete = { text = "-" },
      },
      signs_staged_enable = false,
      attach_to_untracked = true,
      current_line_blame_opts = {
        virt_text_pos = "right_align",
        delay = 1,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = "<author> (<author_time:%R>): <summary> ",
    })

    vim.keymap.set(
      "n",
      "<leader>td",
      gitsigns.toggle_deleted,
      { desc = "Git: Toggle Diff" }
    )

    -- blame
    vim.keymap.set(
      "n",
      "<leader>tb",
      gitsigns.toggle_current_line_blame,
      { desc = "Git: Toggle Blame" }
    )
    -- vim.keymap.set("n", "<leader>gb", function()
    --   gitsigns.blame_line({
    --     full = true,
    --     ignore_whitespace = true,
    --   })
    -- end, { desc = "Blame" })
    -- vim.keymap.set("n", "<leader>gb", function()
    --   gitsigns.blame()
    -- end, { desc = "Blame" })

    -- hunks
    vim.keymap.set(
      "n",
      "<leader>gr",
      gitsigns.reset_hunk,
      { desc = "Reset Hunk" }
    )
    vim.keymap.set(
      "n",
      "<leader>gR",
      gitsigns.reset_buffer,
      { desc = "Reset Buffer" }
    )
    vim.keymap.set("", "<leader>gr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Reset Hunk" })
    vim.keymap.set({ "o", "x" }, "ah", ":<C-U>Gitsigns select_hunk<CR>")

    -- navigate
    vim.keymap.set("n", "[h", function()
      gitsigns.nav_hunk("prev")
    end, { desc = "Previous Hunk" })
    vim.keymap.set("n", "]h", function()
      gitsigns.nav_hunk("next")
    end, { desc = "Next Hunk" })

    -- pickers
    local extra = require("mini.extra")
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
