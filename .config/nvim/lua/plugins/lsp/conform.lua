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
        sh = { "shfmt" },
        zsh = { "shfmt" },
        python = { "ruff_format" },
        ["_"] = { "trim_whitespace" },
      },
      -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
        quiet = true,
      },
    })

    -- save without formatting
    vim.keymap.set("n", "<leader>W", function()
      vim.g.disable_autoformat = true
      vim.cmd.write()
      vim.g.disable_autoformat = false
    end, { desc = "Save Without Formatting" })
  end,
}
