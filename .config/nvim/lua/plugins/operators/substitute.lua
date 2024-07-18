return {
  "gbprod/substitute.nvim",
  config = function()
    local substitute = require("substitute")
    substitute.setup({
      preserve_cursor_position = true,
      highlight_substituted_text = { timer = 250 },
    })
    vim.keymap.set("n", "s", substitute.operator)
    vim.keymap.set("n", "ss", substitute.line, { desc = "Substitute (Line)" })
    vim.keymap.set("n", "S", substitute.eol)
    vim.keymap.set(
      "x",
      "ss",
      substitute.visual,
      { desc = "Substitute (Visual)" }
    )
  end,
}
