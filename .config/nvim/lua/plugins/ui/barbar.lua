return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("barbar").setup({
      animation = false,
      icons = {
        button = "",
        separator = { left = "▏", right = "" },
        separator_at_end = false,
        pinned = { button = "", filename = false },
        inactive = {
          separator = { left = "▏", right = "" },
        },
      },
      insert_at_end = true,
      maximum_padding = 0,
    })

    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferPrevious<CR>")
    vim.keymap.set("n", "<Tab>", "<cmd>BufferNext<CR>")
    vim.keymap.set(
      "n",
      "<leader><S-Tab>",
      "<cmd>BufferMovePrevious<CR>",
      { desc = "Buffer: Move Previous" }
    )
    vim.keymap.set(
      "n",
      "<leader><Tab>",
      "<cmd>BufferMoveNext<CR>",
      { desc = "Buffer: Move Next" }
    )
    for i = 1, 5 do
      vim.keymap.set(
        "n",
        "<leader>" .. i,
        "<cmd>BufferGoto " .. i .. "<CR>",
        { desc = "Buffer " .. i }
      )
    end
    vim.keymap.set(
      "n",
      "<leader>0",
      "<cmd>BufferLast<CR>",
      { desc = "Buffer: Last" }
    )
    vim.keymap.set("n", "gp", "<cmd>BufferPin<CR>", { desc = "Buffer: Pin" })
    -- vim.keymap.set("n", "gb", "<cmd>BufferPick<CR>", { desc = "Buffer: Pick" })
    vim.keymap.set(
      "n",
      "<leader>x",
      "<cmd>BufferClose<CR>",
      { desc = "Close Buffer" }
    )
    vim.keymap.set(
      "n",
      "<leader>X",
      "<cmd>BufferCloseAllButCurrentOrPinned<CR>",
      { desc = "Delete Other Buffers" }
    )
  end,
}
