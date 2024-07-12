return {
  "echasnovski/mini.surround",
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "sS",
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

    -- quick surround in visual mode
    for _, key in pairs({ "{", "}", "[", "]", "(", ")", "'", '"', "`", "<" }) do
      vim.keymap.set("x", key, "sS" .. key, { remap = true })
    end
  end,
}
