return {
  "echasnovski/mini.ai",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local gen_ai_spec = require("mini.extra").gen_ai_spec
    require("mini.ai").setup({
      mappings = {
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
        goto_left = "",
        goto_right = "",
      },
      custom_textobjects = {
        g = gen_ai_spec.buffer(),
        l = gen_ai_spec.line(),
        n = gen_ai_spec.number(),
        -- LazyVim
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        d = { "%f[%d]%d+" },
      },
    })
    vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
    vim.keymap.set("x", "v", "ilo", { remap = true })
    -- vim.keymap.set("n", "vil", "vilo", { remap = true })
    -- vim.keymap.set("n", "val", "valo", { remap = true })
  end,
}
