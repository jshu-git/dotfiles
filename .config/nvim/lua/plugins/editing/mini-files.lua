local files = require('mini.files')
files.setup({
  mappings = {
    close = '<esc>',
    go_in = '',
    go_in_plus = '<CR>',
    go_out = '',
    go_out_plus = '-',
    reset = '_',
    synchronize = '<leader>w',
  },
  options = {
    permanent_delete = false,
  },
  windows = {
    width_focus = math.floor(0.15 * vim.o.columns),
    width_nofocus = math.floor(0.15 * vim.o.columns),
    width_preview = math.floor(0.30 * vim.o.columns),
  },
})

-- toggle explorer
vim.keymap.set('n', '<leader>e', function()
  if not files.close() then
    files.open(vim.api.nvim_buf_get_name(0))
    files.reveal_cwd()
  end
end, { desc = 'Explorer' })
-- vim.keymap.set('n', '<leader>E', function()
--   files.open(nil)
-- end, { desc = 'Explorer (cwd)' })
vim.keymap.set('n', '<leader>E', function()
  files.open(files.get_latest_path())
end, { desc = 'Explorer (Latest)' })

-- toggle preview
local show_preview = false
local toggle_preview = function()
  show_preview = not show_preview
  files.refresh({ windows = { preview = show_preview } })
  -- hack
  if not show_preview then
    vim.api.nvim_command('normal! k')
    vim.defer_fn(function()
      vim.api.nvim_command('normal! j')
    end, 50)
  end
end

-- open in split
local map_split = function(buf_id, lhs, direction)
  local rhs = function()
    local cur_target = files.get_explorer_state().target_window
    local new_target = vim.api.nvim_win_call(cur_target, function()
      vim.cmd(direction .. ' split')
      return vim.api.nvim_get_current_win()
    end)
    files.set_target_window(new_target)

    -- close explorer
    files.go_in({ close_on_file = true })
  end
  -- Adding `desc` will result into `show_help` entries
  vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = 'Split ' .. direction })
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id

    -- splits
    map_split(buf_id, '<C-s>', 'horizontal')
    map_split(buf_id, '<C-v>', 'vertical')

    -- preview
    vim.keymap.set('n', '<Tab>', toggle_preview, {
      buffer = buf_id,
      desc = 'Toggle Preview',
    })
  end,
})

-- customize window
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    local win_id = args.data.win_id
    local config = vim.api.nvim_win_get_config(win_id)
    config.title_pos = 'center'
    vim.api.nvim_win_set_config(win_id, config)
  end,
})
