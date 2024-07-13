return {
  "smjonas/inc-rename.nvim",
  event = "LspAttach",
  config = function()
    require("inc_rename").setup({
      save_in_cmdline_history = false,
    })
  end,
}
