return {
  "monkoose/neocodeium",
  cond = vim.env.SSH_CLIENT == nil,
  event = "InsertEnter",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup({
      silent = true,
      filetypes = {
        ["*"] = true,
        ["rip-substitute"] = false,
      },
    })

    vim.keymap.set("i", "<Tab>", function()
      if neocodeium.visible() then
        neocodeium.accept()
      else
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
          "n",
          false
        )
      end
    end)
    vim.keymap.set("i", "<C-c>", function()
      if neocodeium.visible() then
        neocodeium.clear()
      else
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<C-c>", true, false, true),
          "n",
          false
        )
      end
    end)
    vim.keymap.set("i", "<A-l>", neocodeium.accept_word)
    vim.keymap.set("i", "<A-n>", function()
      neocodeium.cycle_or_complete(1)
    end)
    vim.keymap.set("i", "<A-p>", function()
      neocodeium.cycle_or_complete(-1)
    end)
  end,
}
