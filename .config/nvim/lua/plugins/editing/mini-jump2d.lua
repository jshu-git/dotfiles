return {
  "echasnovski/mini.jump2d",
  keys = {
    { "<leader><leader>", mode = { "n", "x", "o" } },
    { "<leader>.", mode = { "n", "x", "o" } },
  },
  config = function()
    local jump2d = require("mini.jump2d")
    jump2d.setup({
      mappings = {
        start_jumping = "",
      },
    })

    -- jump to any word
    vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", function()
      local opts =
        vim.tbl_deep_extend("force", jump2d.builtin_opts.word_start, {
          view = { n_steps_ahead = 1 },
        })
      jump2d.start(opts)
    end, { desc = "Jump (Word)" })

    -- jump to punctuation
    vim.keymap.set({ "n", "x", "o" }, "<leader>.", function()
      jump2d.start({
        spotter = jump2d.gen_pattern_spotter("%p+"),
      })
    end, { desc = "Jump (Punctuation)" })
  end,
}
