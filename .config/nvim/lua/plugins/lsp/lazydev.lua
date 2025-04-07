require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    -- https://github.com/Hammerspoon/Spoons/pull/240
    -- https://github.com/gnudad/dotfiles/blob/main/neovim.lua#L301
    { path = vim.env.HOME .. '/.config/hammerspoon/Spoons/EmmyLua.spoon/annotations' },
  },
})
