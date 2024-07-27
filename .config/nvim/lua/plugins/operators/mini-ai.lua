return {
  "echasnovski/mini.ai",
  dependencies = {
    "echasnovski/mini.extra",
  },
  config = function()
    local ai = require("mini.ai")
    local extra_ai = require("mini.extra").gen_ai_spec
    ai.setup({
      n_lines = 500,
      mappings = {
        around_next = "",
        inside_next = "",
        around_last = "",
        inside_last = "",
        goto_left = "",
        goto_right = "",
      },
      custom_textobjects = {
        -- override
        c = ai.gen_spec.function_call(),
        -- extra
        g = extra_ai.buffer(),
        D = extra_ai.diagnostic(),
        L = extra_ai.line(),
        n = extra_ai.number(),
        -- treesitter
        f = ai.gen_spec.treesitter({
          a = "@function.outer",
          i = "@function.inner",
        }),
        o = ai.gen_spec.treesitter({
          a = { "@conditional.outer", "@loop.outer" },
          i = { "@conditional.inner", "@loop.inner" },
        }),
        C = ai.gen_spec.treesitter({
          a = "@class.outer",
          i = "@class.inner",
        }),
      },
    })

    vim.keymap.set("n", "<S-CR>", "ciq", { remap = true })
    vim.keymap.set("x", "v", "iLo", { remap = true })
    -- vim.keymap.set("n", "vil", "vilo", { remap = true })
    -- vim.keymap.set("n", "val", "valo", { remap = true })
  end,
}
