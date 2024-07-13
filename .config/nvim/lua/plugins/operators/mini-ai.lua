return {
  "echasnovski/mini.ai",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local gen_ai_spec = require("mini.extra").gen_ai_spec
    require("mini.ai").setup({
      custom_textobjects = {
        B = gen_ai_spec.buffer(),
        L = gen_ai_spec.line(),
        N = gen_ai_spec.number(),
      },
    })
    vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
    vim.keymap.set("n", "<C-CR>", "cib", { remap = true })
    vim.keymap.set("x", "v", "iLo", { remap = true })
    vim.keymap.set("n", "yY", "yaL", { remap = true })
    vim.keymap.set("n", "gG", "vaB", { desc = "Select All", remap = true })
  end,
}
