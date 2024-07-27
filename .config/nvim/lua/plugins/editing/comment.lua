return {
  "numToStr/Comment.nvim",
  keys = {
    { "<C-c>", mode = { "n", "x" } },
    { "<leader><C-c>", mode = { "n" } },
  },
  config = function()
    require("Comment").setup({
      mappings = {
        basic = false,
        extra = false,
      },
    })

    vim.keymap.set("n", "<C-c>", "<Plug>(comment_toggle_linewise_current)")
    vim.keymap.set("x", "<C-c>", "<Plug>(comment_toggle_linewise_visual)")

    -- block
    vim.keymap.set("n", "<C-S-c>", "<Plug>(comment_toggle_blockwise_current)")
    vim.keymap.set("x", "<C-S-c>", "<Plug>(comment_toggle_blockwise_visual)")

    vim.keymap.set(
      "n",
      "<leader><C-c>",
      "gcgc",
      { remap = true, desc = "Uncomment" }
    )

    -- textobject
    -- for _, k in ipairs({ "a", "i" }) do
    --   vim.keymap.set("x", k .. "gc", require("vim._comment").textobject)
    -- end
  end,
}
