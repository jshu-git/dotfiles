return {
  "echasnovski/mini.indentscope",
  config = function()
    local indentscope = require("mini.indentscope")
    indentscope.setup({
      draw = {
        animation = indentscope.gen_animation.none(),
      },
      options = {
        try_as_border = true,
      },
      symbol = "▏",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "lazy",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
