return {
  "dstein64/nvim-scrollview",
  config = function()
    require("scrollview").setup({
      signs_on_startup = { "marks", "search" },
      search_symbol = "—",
    })
  end,
}