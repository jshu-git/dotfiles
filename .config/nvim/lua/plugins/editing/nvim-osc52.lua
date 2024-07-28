-- currently, zellij supports OSC52 copy (copy_command), but not paste
-- copying to system clipboard works from neovim to outside works fine
--  links:
--    https://zellij.dev/documentation/options.html?highlight=copy_command#copy_command
--    https://github.com/zellij-org/zellij/issues/2637
--    https://github.com/zellij-org/zellij/issues/2647
--    https://github.com/zellij-org/zellij/issues/3135
--    https://github.com/theimpostor/osc?tab=readme-ov-file#terminal-multiplexer-support

-- so the following neovim snippet hangs when using 'p' to paste from outside
-- vim.g.clipboard = {
--   name = "OSC 52",
--   copy = {
--     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
--   },
--   paste = {
--     ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
--     ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
--   },
-- }

-- the workaround is to use this plugin, and use command-v for pasting from outside

return {
  'ojroques/nvim-osc52',
  cond = vim.env.SSH_CLIENT ~= nil,
  config = function()
    require('osc52').setup({
      silent = true,
    })
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end
    local function paste()
      return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
    end
    vim.g.clipboard = {
      name = 'osc52',
      copy = {
        ['+'] = copy,
        ['*'] = copy,
      },
      paste = {
        ['+'] = paste,
        ['*'] = paste,
      },
    }
  end,
}
