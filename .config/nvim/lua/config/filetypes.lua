vim.filetype.add({
  extension = {
    zsh = 'sh',
    sh = 'sh',
  },
  -- pattern = {
  --   ['*.*suite'] = 'yaml',
  -- },
  filename = {
    ['.zshrc'] = 'sh',
    ['.zshenv'] = 'sh',
  },
})
