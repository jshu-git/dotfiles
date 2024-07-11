return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  config = function()
    local actions = require("yanky.picker").actions
    require("yanky").setup({
      picker = {
        select = {
          action = actions.set_register("+"),
        },
      },
      highlight = {
        timer = 200,
      },
    })

    -- overrides
    vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
    vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
    vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
    -- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
    -- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
    -- vim.keymap.set("n", "<c-n>", "<Plug>(YankyPreviousEntry)")
    -- vim.keymap.set("n", "<c-p>", "<Plug>(YankyNextEntry)")

    -- yank picker
    vim.keymap.set(
      "n",
      "<leader>y",
      "<cmd>YankyRingHistory<CR>",
      { desc = "Yank History" }
    )
    -- text object
    -- vim.keymap.set({ "o", "x" }, "lp", function()
    --   require("yanky.textobj").last_put()
    -- end, {})
  end,
}
