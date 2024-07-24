return {
  "echasnovski/mini.jump",
  keys = { "f", "F", "t", "T" },
  config = function()
    require("mini.jump").setup({
      mappings = {
        repeat_jump = "", -- defaults to ;
      },
    })
  end,
}
