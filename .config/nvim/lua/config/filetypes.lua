vim.filetype.add({
  extension = {
    zsh = 'sh',
    sh = 'sh',
    suite = 'yaml',
    nxsuite = 'yaml',
    thpl = 'perl',
    thpy = 'python',
  },
  filename = {
    ['.zshrc'] = 'sh',
    ['.zshenv'] = 'sh',
  },
})
