local git = require('mini.git')
git.setup({
  command = {
    split = 'vertical',
  },
})

vim.keymap.set({ 'n', 'x' }, '<leader>gs', function()
  git.show_at_cursor({ split = 'vertical' })
end, { desc = 'Show (Cursor)' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'git',
  callback = function()
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.MiniGit.diff_foldexpr()'
    vim.opt_local.foldlevel = 2
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

-- Use only HEAD name as summary string
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniGitUpdated',
  callback = function(data)
    local summary = vim.b[data.buf].minigit_summary
    vim.b[data.buf].minigit_summary_string = summary.head_name or ''
  end,
})

-- blame
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniGitCommandSplit',
  callback = function(au_data)
    if au_data.data.git_subcommand ~= 'blame' then
      return
    end

    -- Align blame output with source
    local win_src = au_data.data.win_source
    vim.wo.wrap = false
    vim.fn.winrestview({ topline = vim.fn.line('w0', win_src) })
    vim.api.nvim_win_set_cursor(0, { vim.fn.line('.', win_src), 0 })

    -- Bind both windows so that they scroll together
    vim.wo[win_src].scrollbind, vim.wo.scrollbind = true, true
  end,
})
vim.keymap.set('n', '<leader>gb', '<cmd>leftabove Git blame -- %:p<cr>', { desc = 'Blame' })
