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
        reset = "gH",
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
      "<leader>gr",
      "gH" .. "ah",
      { desc = "Reset Hunk", remap = true }
    )
    vim.keymap.set(
      "n",
      "<leader>gR",
      "gH" .. "iB",
      { desc = "Reset Buffer", remap = true }
    )
  end,
}
