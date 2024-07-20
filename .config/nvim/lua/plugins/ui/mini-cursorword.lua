return {
  "echasnovski/mini.cursorword",
  config = function()
    require("mini.cursorword").setup({
      delay = 0,
    })
    vim.g.minicursorword_disable = true

    vim.keymap.set("n", "<leader>c", function()
      vim.g.minicursorword_disable = not vim.g.minicursorword_disable
      -- hack
      vim.api.nvim_command("normal! l")
      vim.defer_fn(function()
        vim.api.nvim_command("normal! h")
      end, 1)
    end, { desc = "mini.cursorword" })

    -- amend esc
    require("keymap-amend")("n", "<esc>", function(original)
      if not vim.g.minicursorword_disable then
        vim.g.minicursorword_disable = true
      end
      original()
    end)
  end,
}
