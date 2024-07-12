return {
  "NStefan002/visual-surround.nvim",
  config = function()
    local visual_surround = require("visual-surround")
    visual_surround.setup({
      use_default_keymaps = false,
    })

    for _, key in pairs({ "{", "[", "(", "'", '"', "`", "<" }) do
      vim.keymap.set("v", key, function()
        visual_surround.surround(key)
      end)
    end
  end,
}
