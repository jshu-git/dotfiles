vim.filetype.add({
  extension = {
    zsh = 'sh',
    sh = 'sh',
    -- work
    suite = 'yaml',
    nxsuite = 'yaml',
    thpl = 'perl',
    thpy = 'python',
    cnf = 'json',
  },
  filename = {
    ['.zshrc'] = 'sh',
    ['.zshenv'] = 'sh',
  },
})
