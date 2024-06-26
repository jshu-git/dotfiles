return {
  "echasnovski/mini.clue",
  config = function()
    local clue = require("mini.clue")
    clue.setup({
      window = {
        delay = 250,
        config = function(bufnr)
          local max_width = 0
          for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
            max_width = math.max(max_width, vim.fn.strchars(line))
          end
          max_width = max_width + 1
          return {
            width = math.min(40, max_width),
          }
        end,
      },
      triggers = {
        { mode = "n", keys = "<leader>" },
        { mode = "x", keys = "<leader>" },
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },
        { mode = "n", keys = "<C-w>" },
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },

        -- unimpaired
        { mode = "n", keys = "]" },
        { mode = "n", keys = "[" },

        -- surround/substitute operators
        { mode = "n", keys = "s" },
        { mode = "x", keys = "s" },
      },
      clues = {
        -- clue.gen_clues.g(),
        clue.gen_clues.windows(),
        clue.gen_clues.registers(),
        clue.gen_clues.z(),

        -- leader
        { mode = "n", keys = "<leader>f", desc = "Find…" },
        { mode = "n", keys = "<leader>l", desc = "LSP…" },
        { mode = "n", keys = "<leader>t", desc = "Toggle…" },
        { mode = "n", keys = "<leader>g", desc = "Git…" },
        { mode = "x", keys = "<leader>g", desc = "Git…" },
        { mode = "n", keys = "<leader>a", desc = "GPT…" },
        { mode = "x", keys = "<leader>a", desc = "GPT…" },
        { mode = "n", keys = "<leader>s", desc = "Session…" },

        -- submodes
        -- buffers
        { mode = "n", keys = "<leader><Tab>", postkeys = "<leader>" },
        { mode = "n", keys = "<leader><S-Tab>", postkeys = "<leader>" },
        -- folds
        { mode = "n", keys = "zj", postkeys = "z" },
        { mode = "n", keys = "zk", postkeys = "z" },
        { mode = "n", keys = "z=", postkeys = "z" },
        { mode = "n", keys = "z-", postkeys = "z" },
        { mode = "n", keys = "zo", postkeys = "z" },
        { mode = "n", keys = "zc", postkeys = "z" },
      },
    })
  end,
}
