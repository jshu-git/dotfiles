return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup({
      signs = {
        -- add = { text = "▌" },
        -- change = { text = "▌" },
      },
      -- current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = "right_align",
        delay = 10,
        ignore_whitespace = true,
      },
      current_line_blame_formatter = "<author> (<author_time:%R>): <summary> ",
      diff_opts = {
        vertical = false,
        ignore_blank_lines = true,
      },
    })

    -- toggles
    vim.keymap.set(
      "n",
      "<leader>tb",
      gitsigns.toggle_current_line_blame,
      { desc = "Git: Toggle Blame" }
    )
    vim.keymap.set(
      "n",
      "<leader>td",
      gitsigns.toggle_deleted,
      { desc = "Git: Toggle Diff" }
    )

    -- blame
    vim.keymap.set("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame" })

    -- hunks
    vim.keymap.set(
      "n",
      "<leader>gs",
      gitsigns.preview_hunk,
      { desc = "Hover Hunk" }
    )
    vim.keymap.set(
      "n",
      "<leader>ga",
      gitsigns.stage_hunk,
      { desc = "Stage Hunk" }
    )
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
    vim.keymap.set(
      "n",
      "<leader>gu",
      gitsigns.undo_stage_hunk,
      { desc = "Undo Stage Hunk" }
    )
    -- vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff" })

    -- visual
    vim.keymap.set("v", "<leader>ga", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Stage Hunk" })
    vim.keymap.set("v", "<leader>gr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Reset Hunk" })

    -- text object
    vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk)
    vim.keymap.set({ "o", "x" }, "ah", gitsigns.select_hunk)

    -- navigate
    vim.keymap.set("n", "[h", function()
      gitsigns.nav_hunk("prev")
    end, { desc = "Previous Hunk" })
    vim.keymap.set("n", "]h", function()
      gitsigns.nav_hunk("next")
    end, { desc = "Next Hunk" })
  end,
}
