return {
  'zk-org/zk-nvim',
  config = function()
    local zk = require('zk')
    zk.setup({
      picker = 'minipick',
    })

    vim.keymap.set('n', '<leader>zz', function()
      local input = vim.fn.input('Title: ')
      if input ~= '' then
        zk.new({ title = input })
      end
    end)

    vim.keymap.set('n', '<leader>zt', zk.pick_tags)
  end,
}
