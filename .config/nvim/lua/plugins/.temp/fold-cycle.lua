return {
  "jghauser/fold-cycle.nvim",
  config = function()
    -- folds https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
    vim.opt.foldmethod = "indent"
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldtext = ""
    vim.opt.fillchars:append({ fold = " " })

    local fold_cycle = require("fold-cycle")
    fold_cycle.setup({
      open_if_max_closed = false,
      close_if_max_opened = false,
    })

    vim.keymap.set("n", "z=", function()
      return fold_cycle.open()
    end, { silent = true, desc = "Fold Less" })
    vim.keymap.set("n", "z-", function()
      return fold_cycle.close()
    end, { silent = true, desc = "Fold More" })
  end,
}