return {
  "echasnovski/mini.ai",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local gen_ai_spec = require("mini.extra").gen_ai_spec
    require("mini.ai").setup({
      custom_textobjects = {
        g = gen_ai_spec.buffer(),
        L = gen_ai_spec.line(),
        N = gen_ai_spec.number(),
        -- LazyVim
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        d = { "%f[%d]%d+" },
      },
    })
    vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
    vim.keymap.set("x", "v", "iLo", { remap = true })
  end,
}
