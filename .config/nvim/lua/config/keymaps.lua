vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
map('n', '<esc>', function()
  vim.cmd('nohlsearch')
  vim.cmd('echon')
end)
-- https://undelete.pullpush.io/r/neovim/comments/vguomm/how_can_i_map_tab_but_keep_the_default_action_for/
vim.keymap.set('n', '<C-i>', '<C-i>')

-- leader
map('n', '<leader>d', '<cmd>bd!<CR>', { desc = 'Buffer: Delete' })
map('n', '<leader>w', '<cmd>update<CR>', { desc = 'Write' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
map('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit All' })
map('n', '<leader>N', '<cmd>enew<CR>', { desc = 'Buffer: New' })
map('n', '<leader>S', function()
  vim.cmd('source %')
  vim.notify('Sourced: ' .. vim.fn.expand('%:t'))
end, { desc = 'Source File' })
map('n', '<leader>,', 'mzA,<Esc>`z', { desc = 'Append Comma' })
map('n', '<leader>;', 'mzA;<Esc>`z', { desc = 'Append Semicolon' })
map('n', '<leader>p', 'mzA<Esc>p`z', { desc = 'Append Paste' })
map('n', 'X', 'mzA<BS><Esc>`z')
map('n', '<leader>nN', '<cmd>messages<CR>', { desc = 'Messages' })
map('n', '<leader>I', '<cmd>Inspect<CR>', { desc = 'Inspect' })

-- toggles
map('n', '<leader>tw', '<cmd>setlocal wrap!<CR>', { desc = 'Toggle Word Wrap' })

-- movement
map({ 'n', 'x' }, 'j', function()
  return vim.v.count > 0 and 'j' or 'gj'
end, { expr = true })
map({ 'n', 'x' }, 'k', function()
  return vim.v.count > 0 and 'k' or 'gk'
end, { expr = true })
map({ 'n', 'x', 'o' }, 'E', '$')
-- smart 0/^ https://github.com/wscnd/LunarVim/blob/master/lua/keymappings.lua#L98
map({ 'n', 'x', 'o' }, '0', function()
  local line = vim.fn.getline('.')
  local col = vim.fn.col('.') - 1
  return line:sub(1, col):match('^%s+$') and '0' or '^'
end, { expr = true })

-- editing
map('n', 'O', 'o<Esc>')
map('n', 'P', '<cmd>put<CR>')
map('n', '<CR>', '"_ciw')
map('n', '<S-CR>', '<CR>')
map('n', 'U', '<C-r>')
map('n', '<BS>', '<C-^>')
map('n', 'i', function()
  return vim.fn.getline('.') == '' and '"_cc' or 'i'
end, { expr = true })

-- command mode
map({ 'n', 'x' }, ';', ':')

-- preserve clipboard
map({ 'n', 'x' }, 'x', '"_x')
map({ 'n', 'x' }, 'c', '"_c')
map({ 'n', 'x' }, 'C', '"_C')
map('n', 'dd', function()
  return vim.fn.getline('.') == '' and '"_dd' or 'dd'
end, { expr = true })

-- windows
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- size
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>')
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>')
map('n', '<C-Up>', '<cmd>resize -2<CR>')
map('n', '<C-Down>', '<cmd>resize +2<CR>')
-- split
map('n', '<C-v>', '<C-w>v')
map('n', '<C-s>', '<C-w>s')

-- visual
map('x', '<CR>', '"_c')
map('x', '<C-q>', 'j')
map('x', '/', '<esc>/\\%V')

-- search
map('n', '*', 'g*``')
map('n', 'g*', '*``')
map(
  'x',
  '*',
  -- *`` doesn't work for some reason
  [["zy/\V<C-r>=substitute(escape(@z, '/\'), '\n', '\\n', 'g')<CR><CR>``]]
)

-- custom operators
map('n', 'sw', 'g*``cgn', { desc = 'Substitute cword (Instance)' })
-- https://old.reddit.com/r/neovim/comments/1dfvluw/share_your_favorite_settingsfeaturesexcerpts_from/l8qlbs8/
-- https://github.com/neovim/neovim/issues/21676
-- https://vim.fandom.com/wiki/Search_and_replace
map(
  'x',
  'sw',
  [[y/\V<C-R>=substitute(escape(@", '/\'), '\n', '\\n', 'g')<NL><CR>Ncgn]],
  -- "zy -> yank selection into register z
  -- / -> search
  -- \v -> very magic mode
  -- <C-r>= -> expression register
  -- substitute(escape(@z, '/\'), '\n', '\\n', 'g') -> replace each ^M newline (if any) with \n of register z
  -- first <CR> -> submit substitution
  -- second <CR> -> submit search
  -- [["zy/\v<C-r>=substitute(escape(@z, '/\'), '\n', '\\n', 'g')<CR><CR>``cgn]],
  { desc = 'Substitute (Instance)' }
)

-- yanking
map('n', 'yp', function()
  -- absolute path
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end)
map('n', 'yP', function()
  -- relative
  local path = vim.fn.expand('%:.')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end)
map('n', 'yf', function()
  -- tail
  local path = vim.fn.expand('%:t')
  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end)

-- insert/command mode
map({ 'i', 'c' }, '<C-h>', '<Left>')
map({ 'i', 'c' }, '<C-l>', '<Right>')
map({ 'i', 'c' }, '<C-k>', '<Up>')
map({ 'i', 'c' }, '<C-j>', '<Down>')
-- emacs https://github.com/tscolari/nvim/blob/main/lua/keyboard.lua#L26
map({ 'i', 'c' }, '<C-a>', '<Home>')
map({ 'i', 'c' }, '<C-e>', '<End>')
map({ 'i', 'c' }, '<C-d>', '<Del>')
map({ 'i', 'c' }, '<A-d>', '<C-Right><C-w>')

-- undo points
for _, key in ipairs({ ',', '.', '!', '?', ':', ';' }) do
  map('i', key, key .. '<C-g>u')
end

-- command mode
-- https://old.reddit.com/r/neovim/comments/1f9rdgl/help_me_convert_that_line_from_vimscript_to_lua/
map('c', ';;', function()
  return vim.fn.getcmdtype() == ':' and vim.fn.expand('%:p:h') .. '/' or ';;'
end, { expr = true })
