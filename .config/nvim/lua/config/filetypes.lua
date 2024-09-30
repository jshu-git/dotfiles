vim.filetype.add({
  extension = {
    zsh = 'sh',
    sh = 'sh',
    suite = 'yaml',
    nxsuite = 'yaml',
    thpl = 'perl',
  },
  filename = {
    ['.zshrc'] = 'sh',
    ['.zshenv'] = 'sh',
  },
})
