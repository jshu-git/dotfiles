return {
  "sindrets/diffview.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  config = function()
    local actions = require("diffview.actions")
    require("diffview").setup({
      enhanced_diff_hl = true,
      show_help_hints = false,
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
        file_history = {
          winbar_info = true,
        },
      },
      file_history_panel = {
        win_config = { height = math.floor(0.2 * vim.o.lines) },
      },
      keymaps = {
        view = {
          ["<esc>"] = actions.close,
        },
        file_history_panel = {
          ["g!"] = false,
        },
      },
    })

    vim.opt.fillchars:append({ diff = "╱" })

    -- file history
    vim.keymap.set(
      "n",
      "<leader>gd",
      "<cmd>DiffviewFileHistory %<cr>",
      { desc = "Diff (File)" }
    )
    vim.keymap.set(
      "n",
      "<leader>gD",
      "<cmd>DiffviewFileHistory<cr>",
      { desc = "Diff (Branch)" }
    )
    vim.keymap.set(
      "x",
      "<leader>gd",
      ":<C-U>'<,'>DiffviewFileHistory<cr>",
      { desc = "Diff (File)" }
    )

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "DiffviewFileHistory",
      },
      callback = function(event)
        vim.keymap.set(
          "n",
          "<esc>",
          "<cmd>tabclose<cr>",
          { buffer = event.buf, silent = true }
        )
      end,
    })
  end,
}
