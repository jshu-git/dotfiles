return {
  "nguyenvukhang/nvim-toggler",
  config = function()
    local toggler = require("nvim-toggler")
    toggler.setup({
      inverses = {
        ["&&"] = "||",
        ["and"] = "or",
        ["if"] = "else",
      },
      remove_default_keybinds = true,
      autoselect_longest_match = true,
    })

    vim.keymap.set("n", "-", toggler.toggle)
    vim.keymap.set("n", "=", toggler.toggle)
  end,
}
