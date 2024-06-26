return {
  "echasnovski/mini.ai",
  config = function()
    require("mini.ai").setup()
    vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
    vim.keymap.set("n", "<C-CR>", "cib", { remap = true })
  end,
}
