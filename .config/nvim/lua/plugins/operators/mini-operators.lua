return {
  'echasnovski/mini.operators',
  config = function()
    local operators = require('mini.operators')
    operators.setup({
      evaluate = {
        prefix = 'se',
      },
      exchange = {
        prefix = 'sx',
      },
      multiply = {
        prefix = 'sm',
      },
      replace = { prefix = '' }, -- using substitute.nvim for highlight
      sort = {
        prefix = 'so',
      },
    })
    -- operators.make_mappings("replace", {
    --   textobject = "s",
    --   line = "ss",
    --   selection = "ss",
    -- })
    -- vim.keymap.set("n", "S", "s$", { remap = true })

    -- custom operators
    -- vim.keymap.set("n", "sf", ":%s/<C-r><C-w>//gI<left><left><left>", { desc = "Substitute cword (File)" })
    -- vim.keymap.set("x", "s/", ":s///gI<left><left><left><left>", { desc = "Substitute in selection" })
    -- https://old.reddit.com/r/neovim/comments/1dfvluw/share_your_favorite_settingsfeaturesexcerpts_from/l8qlbs8/
    vim.keymap.set(
      'n',
      'sw',
      'g*Ncgn',
      { desc = 'Substitute cword (instance)' }
    )
    vim.keymap.set(
      'x',
      'sw',
      [[y/\V<C-R>=substitute(escape(@", '/\'), '\n', '\\n', 'g')<NL><CR>Ncgn]],
      { desc = 'Substitute (instance)' }
    )
    vim.keymap.set(
      'x',
      '*',
      [[y/\V<C-R>=substitute(escape(@", '/\'), '\n', '\\n', 'g')<NL><CR>N]]
    )
  end,
}
