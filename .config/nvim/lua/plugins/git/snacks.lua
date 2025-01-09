local snacks = require('snacks')

snacks.setup({
  gitbrowse = {
    open = function(url)
      vim.fn.setreg('+', url)
    end,
    remote_patterns = {
      -- https://github.com/jshu-git/dotfiles.git/blob/main/.config/nvim/lua/plugins/git/snacks.lua#L21-L21
      { '^https://github.com/(.*).git', 'https://github.com/%1' },

      -- (https://bitbucket.ngage.netapp.com)/scm/(op)/(api).git -> (https://bitbucket.ngage.netapp.com)/projects/(op)/repos/(api)/browse
      { '^(https://bitbucket%.ngage%.netapp%.com)/scm/(.*)/(.*).git$', '%1/projects/%2/repos/%3/browse' },
    },
    url_patterns = {
      ['bitbucket.ngage.netapp.com'] = {
        file = '/{file}#{line_start}-{line_end}',
      },
    },
  },
})

vim.keymap.set({ 'n', 'x' }, '<leader>gy', function()
  snacks.gitbrowse()
end, { desc = 'Copy URL' })
vim.keymap.set({ 'n', 'x' }, '<leader>gb', function()
  snacks.git.blame_line()
end, { desc = 'Blame' })
