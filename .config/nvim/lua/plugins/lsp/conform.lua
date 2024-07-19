return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        python = { "ruff_format" },
      },
      -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
      format_on_save = function()
        if vim.g.disable_autoformat then
          ---@diagnostic disable-next-line: missing-return-value
          return
        end
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
          quiet = true,
        }
      end,
    })

    -- toggle autoformatting
    vim.g.disable_autoformat = false
    vim.keymap.set("n", "<leader>tf", function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      vim.notify(
        "Toggled Autoformatting "
          .. (vim.g.disable_autoformat and "Off" or "On")
      )
    end, { desc = "Toggle Autoformatting" })

    -- save without formatting
    vim.keymap.set("n", "<leader>W", function()
      vim.g.disable_autoformat = true
      vim.cmd.write()
      vim.g.disable_autoformat = false
    end, { desc = "Save (No Autoformat)" })
  end,
}
