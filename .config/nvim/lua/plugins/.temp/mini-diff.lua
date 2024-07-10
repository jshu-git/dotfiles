return {
  "echasnovski/mini.diff",
  config = function()
    local diff = require("mini.diff")
    diff.setup({
      view = {
        style = "sign",
        signs = {
          add = "▌",
          change = "▌",
          delete = "-",
        },
      },
      mappings = {
        apply = "",
        reset = "<leader>gr",
        textobject = "ah",
      },
    })

    vim.keymap.set(
      "n",
      "<leader>td",
      diff.toggle_overlay,
      { desc = "Git: Toggle Diff" }
    )
    vim.keymap.set(
      "n",
      "<leader>gR",
      "<leader>gr" .. "iB",
      { desc = "Reset Buffer", remap = true }
    )
  end,
}
