return {
  "lukas-reineke/virt-column.nvim",
  config = function()
    vim.opt.colorcolumn = "80"
    require("virt-column").setup({
      char = "│",
      highlight = { "Whitespace" },
    })
  end,
}
