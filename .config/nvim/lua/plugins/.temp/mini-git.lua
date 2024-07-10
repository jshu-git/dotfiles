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

    vim.keymap.set(
      { "n", "x" },
      "<leader>gb",
      "<cmd>Git blame -- %<CR>",
      { desc = "Blame" }
    )

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "git",
      },
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    })
  end,
}
