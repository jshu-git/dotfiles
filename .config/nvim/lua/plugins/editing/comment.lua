return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      mappings = {
        basic = false,
        extra = false,
      },
    })

    vim.keymap.set("n", "<C-c>", "<Plug>(comment_toggle_linewise_current)")
    vim.keymap.set("x", "<C-c>", "<Plug>(comment_toggle_linewise_visual)")
    vim.keymap.set(
      "n",
      "<leader><C-c>",
      "gcgc",
      { remap = true, desc = "Uncomment" }
    )
    vim.keymap.set("n", "<C-S-c>", "<Plug>(comment_toggle_blockwise_current)")
    vim.keymap.set("x", "<C-S-c>", "<Plug>(comment_toggle_blockwise_visual)")
    vim.keymap.set("x", "agc", require("vim._comment").textobject)
  end,
}
