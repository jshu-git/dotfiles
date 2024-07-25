return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        python = { "ruff_format" },
        sh = { "shfmt" },
        zsh = { "shfmt" },
      },
      -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
      format_on_save = function()
        if vim.g.enable_autoformat then
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
            quiet = true,
          }
        end
      end,
    })

    -- toggle autoformatting
    vim.g.enable_autoformat = true
    vim.keymap.set("n", "<leader>tf", function()
      vim.g.enable_autoformat = not vim.g.enable_autoformat
      vim.notify(
        "Toggled Autoformatting " .. (vim.g.enable_autoformat and "Off" or "On")
      )
    end, { desc = "Toggle Autoformatting" })

    -- save without formatting
    vim.keymap.set("n", "<leader>W", function()
      vim.g.enable_autoformat = false
      vim.cmd.write()
      vim.g.enable_autoformat = true
    end, { desc = "Write (No Autoformat)" })

    vim.keymap.set(
      "n",
      "<leader>lc",
      "<cmd>ConformInfo<CR>",
      { desc = "Conform: Info" }
    )
  end,
}
