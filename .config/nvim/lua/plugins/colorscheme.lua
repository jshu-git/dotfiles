return {
  {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        diff = { mode = "fg" },
        search = { theme = "vscode" },
        styles = {
          comments = { italic = false },
        },
      })
      vim.cmd.colorscheme("nord")
    end,
  },
}
