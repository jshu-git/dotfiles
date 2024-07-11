return {
  "echasnovski/mini.surround",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "sS", -- also uses visual-surround.nvim for quick surrounds
        delete = "sd",
        replace = "sR",

        update_n_lines = "",
        highlight = "",
        find = "",
        find_left = "",
        suffix_last = "",
        suffix_next = "",
      },
      n_lines = 200,
      respect_selection_type = true,
    })
  end,
}
