-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      timeout = require('utils').highlight_timeout,
      higroup = 'Search',
    })
  end,
})

-- disable auto comments
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})

-- help maps https://old.reddit.com/r/neovim/comments/1i44vke/what_keymaps_or_sequences_do_you_use_over_the/m7utbiy/
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help' },
  callback = function(event)
    vim.keymap.set('n', '<CR>', '<C-]>', { buffer = event.buf })
    vim.keymap.set('n', '<BS>', '<C-t>', { buffer = event.buf })
  end,
})

-- from LazyVim
-- close some filetypes with <esc>
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'help', 'qf' },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', '<esc>', '<cmd>close<cr>', { buffer = event.buf })
  end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  callback = function()
    if vim.o.buftype ~= 'nofile' then
      vim.cmd('checktime')
    end
  end,
})

-- set wrap in some filetypes
vim.api.nvim_create_autocmd('FileType', {
  pattern = { '*.txt', '*.log', 'gitcommit', 'markdown', 'mininotify-history' },
  callback = function()
    vim.wo.wrap = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function(event)
    if event.match:match('^%w%w+:[\\/][\\/]') then
      return
    end
    ---@diagnostic disable-next-line: undefined-field
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
