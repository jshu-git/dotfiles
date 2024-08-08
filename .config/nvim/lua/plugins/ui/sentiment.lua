return {
  'utilyre/sentiment.nvim',
  event = 'VeryLazy',
  init = function()
    vim.g.loaded_matchparen = 1
  end,
  config = function()
    require('sentiment').setup({
      delay = 0,
      pairs = {
        { '(', ')' },
        { '{', '}' },
        { '[', ']' },
        { '<', '>' },
      },
    })

    require('config.utils').apply_highlights({
      MatchParen = { link = 'Underlined' },
    })
  end,
}
