return {
  "echasnovski/mini.ai",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local ai = require("mini.ai")
    local extra_ai = require("mini.extra").gen_ai_spec
    ai.setup({
      mappings = {
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
        goto_left = "",
        goto_right = "",
      },
      custom_textobjects = {
        c = ai.gen_spec.function_call(),
        g = extra_ai.buffer(),
        L = extra_ai.line(),
        n = extra_ai.number(),
        -- treesitter
        f = false,
      },
    })

    vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
    vim.keymap.set("x", "v", "iLo", { remap = true })
    -- vim.keymap.set("n", "vil", "vilo", { remap = true })
    -- vim.keymap.set("n", "val", "valo", { remap = true })
  end,
}
