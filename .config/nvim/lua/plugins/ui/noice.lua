return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local noice = require("noice")
    noice.setup({
      cmdline = {
        format = {
          cmdline = false,
          search_down = false,
          search_up = false,
          filter = false,
          lua = false,
          help = false,
          input = false,
        },
      },
      messages = {
        view_history = "popup",
      },
      popupmenu = { enabled = false },
      commands = {
        history = { view = "popup", filter_opts = { reverse = true } },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        signature = { enabled = false },
      },
      presets = {
        lsp_doc_border = true,
      },
      views = {
        virtualtext = {
          hl_group = "CodeiumSuggestion",
        },
        split = {
          size = "50%",
          close = {
            keys = { "<esc>" },
          },
        },
        popup = {
          close = {
            keys = { "<esc>" },
          },
          border = {
            style = "single",
          },
          size = {
            width = math.floor(0.75 * vim.o.columns),
            height = math.floor(0.6 * vim.o.lines),
          },
        },
        hover = {
          scrollbar = false,
          size = {
            max_height = math.floor(0.25 * vim.o.lines),
            max_width = math.floor(0.5 * vim.o.columns),
          },
          border = {
            style = "single",
            padding = { 0, 0 },
          },
        },
        mini = {
          timeout = 1000,
        },
        cmdline_popup = {
          border = {
            style = "single",
            padding = { 0, 0 },
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoicePopupBorder",
            },
          },
        },
        confirm = {
          position = {
            row = "50%",
            col = "50%",
          },
          border = {
            style = "single",
            padding = { 0, 0 },
          },
          win_options = {
            winhighlight = {
              FloatBorder = "NoicePopupBorder",
            },
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>nn", function()
      noice.cmd("Noice")
    end, { desc = "Messages (Noice)" })
    vim.keymap.set("n", "<leader>nN", function()
      vim.cmd("messages")
    end, { desc = "Messages" })
    vim.keymap.set("n", "<leader>nl", function()
      noice.cmd("last")
    end, { desc = "Last" })
    vim.keymap.set("n", "<leader>nd", function()
      noice.cmd("errors")
    end, { desc = "Errors" })

    -- toggle
    vim.keymap.set("n", "<leader>tt", function()
      noice.cmd("dismiss")
    end, { desc = "Noice (Clear)" })
    vim.keymap.set("n", "<leader>tn", function()
      noice.cmd("disable")
    end, { desc = "Noice (Disable)" })
    vim.keymap.set("n", "<leader>tN", function()
      noice.cmd("enable")
    end, { desc = "Noice (Enable)" })
  end,
}
