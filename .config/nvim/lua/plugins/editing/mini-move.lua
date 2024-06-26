return {
  "echasnovski/mini.move",
  config = function()
    require("mini.move").setup({
      -- can't use alt because of escape sending alt https://github.com/LunarVim/LunarVim/issues/1857
      mappings = {
        left = "<A-S-h>",
        right = "<A-S-l>",
        down = "<A-S-j>",
        up = "<A-S-k>",
        line_left = "<A-S-h>",
        line_right = "<A-S-l>",
        line_down = "<A-S-j>",
        line_up = "<A-S-k>",
      },
    })
  end,
}
