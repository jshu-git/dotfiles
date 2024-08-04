return {
  'zk-org/zk-nvim',
  config = function()
    local zk = require('zk')
    zk.setup({
      picker = 'minipick',
    })

    -- pickers
    local commands = require('zk.commands')
    vim.keymap.set('n', '<leader>zz', function()
      commands.get('ZkNotes')({
        select = { 'filenameStem', 'wordCount', 'tags' },
      })
    end)

    vim.keymap.set('n', '<leader>zn', function()
      local input = vim.fn.input('Title: ')
      if input ~= '' then
        zk.new({ title = input })
      end
    end)
    vim.keymap.set('n', '<leader>zd', function()
      zk.new({
        dir = 'daily',
        -- group = 'daily', -- doesn't seem to have an effect
      })
    end)

    vim.keymap.set('n', '<leader>zt', zk.pick_tags)
  end,
}
