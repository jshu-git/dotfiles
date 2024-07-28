return {
  "echasnovski/mini.jump",
  config = function()
    require("mini.jump").setup({
      mappings = {
        repeat_jump = "", -- defaults to ;
      },
      delay = {
        highlight = 0,
      },
    })
  end,
}
