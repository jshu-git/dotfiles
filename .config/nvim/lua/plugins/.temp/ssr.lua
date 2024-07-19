return {
  "cshuaimin/ssr.nvim",
  config = function()
    local ssr = require("ssr")
    ssr.setup({
      border = "single",
      -- min_width = 50,
      -- min_height = 5,
      -- max_width = 120,
      -- max_height = 25,
      -- adjust_window = true,
      keymaps = {
        close = "<esc>",
        next_match = "n",
        prev_match = "N",
        replace_confirm = "<cr>",
        replace_all = "<leader>w",
      },
    })

    vim.keymap.set({ "n", "x" }, "sR", ssr.open, { desc = "SSR" })
  end,
}
