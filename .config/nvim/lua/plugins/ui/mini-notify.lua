return {
  "echasnovski/mini.notify",
  config = function()
    local notify = require("mini.notify")
    vim.notify = notify.make_notify()

    notify.setup({
      window = { winblend = 0 },
    })

    vim.keymap.set(
      "n",
      "<leader>tt",
      notify.clear,
      { desc = "Clear Notifications" }
    )
    vim.keymap.set("n", "<leader>tn", function()
      vim.cmd("split")
      notify.show_history()
    end, { desc = "Show Notifications History" })
  end,
}
