require('snacks').setup({
  gitbrowse = {
    open = function(url)
      vim.fn.setreg('+', url)
    end,
    remote_patterns = {
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
