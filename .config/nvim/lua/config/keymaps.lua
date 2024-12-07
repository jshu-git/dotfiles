vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.keymap.set
map('n', '<esc>', function()
  vim.cmd('nohlsearch')
  vim.cmd('echon')
end)
-- https://undelete.pullpush.io/r/neovim/comments/vguomm/how_can_i_map_tab_but_keep_the_default_action_for/
map('n', '<C-i>', '<C-i>')

-- leader
map('n', '<leader>w', '<cmd>update<CR>', { desc = 'Write' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
map('n', '<leader>d', '<cmd>bd!<CR>', { desc = 'Buffer: Delete' })
map('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit (All)' })
map('n', '<leader>s', function()
  vim.cmd('source %')
  vim.notify('Sourced: ' .. vim.fn.expand('%:t'))
end, { desc = 'Source File' })
map('n', '<leader>nn', '<cmd>messages<CR>', { desc = 'Messages' })

-- append
map('n', '<leader>,', 'mzA,<Esc>`z', { desc = 'Append Comma' })
map('n', '<leader>;', 'mzA;<Esc>`z', { desc = 'Append Semicolon' })
map('n', '<leader>p', 'mzA<Esc>p`z', { desc = 'Append Paste' })

-- toggles
map('n', '<leader>tw', '<cmd>setlocal wrap!<CR>', { desc = 'Toggle Word Wrap' })

-- movement
map({ 'n', 'x' }, 'j', function()
  return vim.v.count > 0 and 'j' or 'gj'
end, { expr = true })
map({ 'n', 'x' }, 'k', function()
  return vim.v.count > 0 and 'k' or 'gk'
end, { expr = true })
map({ 'n', 'x', 'o' }, 'E', 'g$')
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
map('n', '=', '<C-a>')
map('n', '-', '<C-x>')
map('n', 'X', 'mzA<BS><Esc>`z')
map('n', 'M', '%', { remap = true })
map('n', 'y<C-c>', 'yygccp', { remap = true })

-- visual
map('x', '<CR>', '"_c')
map('x', '<C-q>', 'j')
map('x', 'I', function()
  return vim.fn.mode() == 'V' and '0<C-v>I' or 'I'
end, { expr = true })
map('x', 'A', function()
  return vim.fn.mode() == 'V' and '$<C-v>A' or 'A'
end, { expr = true })
-- map('x', '/', '<esc>/\\%V')
-- map('x', 'v', 'iw')

-- preserve clipboard
map({ 'n', 'x' }, 'x', '"_x')
map({ 'n', 'x' }, 'c', '"_c')
map({ 'n', 'x' }, 'C', '"_C')
map('n', 'dd', function()
  return vim.api.nvim_get_current_line():match('^%s*$') and '"_dd' or 'dd'
end, { expr = true })

-- search
map('n', '*', 'g*``')
-- map('n', 'g/', '/\\v', { desc = 'Search (Very Magic)' })
map('x', '*', '"zy' .. '/<C-r>z<CR>``')

-- custom operators
-- https://old.reddit.com/r/neovim/comments/1dfvluw/share_your_favorite_settingsfeaturesexcerpts_from/l8qlbs8/
-- https://github.com/neovim/neovim/issues/21676
-- https://vim.fandom.com/wiki/Search_and_replace
map('n', 'sw', 'yiw' .. 'g*``' .. '"_cgn', { desc = 'Substitute cword (Instance)' })
map('n', 'sx', '*``' .. '"_dgn', { desc = 'Delete cword (Instance)' })
map('x', 'sw', 'y' .. '/<C-r>0<CR>``' .. '_cgn', { desc = 'Substitute (Instance)' })
map('x', 'sx', '*' .. '"_dgn', { desc = 'Delete (Instance)', remap = true })
-- map('n', 's/', ':%s/<C-r><C-w>/<C-r><C-w>/gcI<Left><Left><Left><Left>', { desc = 'Substitute cword (Buffer)' })
map('x', 's/', ':s///gcI<Left><Left><Left><Left><Left>', { desc = 'Substitute (In Selection)' })

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

-- insert/command
map({ 'i', 'c' }, '<C-h>', '<Left>')
map({ 'i', 'c' }, '<C-l>', '<Right>')
map({ 'i', 'c' }, '<C-k>', '<Up>')
map({ 'i', 'c' }, '<C-j>', '<Down>')
-- emacs
map({ 'i', 'c' }, '<C-a>', '<Home>')
map({ 'i', 'c' }, '<C-e>', '<End>')
map({ 'i', 'c' }, '<C-d>', '<Del>')
map({ 'i', 'c' }, '<A-d>', '<C-Right><C-w>')

-- undo points
for _, key in ipairs({ ',', '.', '!', '?', ':', ';' }) do
  map('i', key, key .. '<C-g>u')
end

-- command
map({ 'n', 'x' }, ';', ':')
-- https://old.reddit.com/r/neovim/comments/1f9rdgl/help_me_convert_that_line_from_vimscript_to_lua/
map('c', ';;', function()
  return vim.fn.getcmdtype() == ':' and vim.fn.expand('%:p:h') .. '/' or ';;'
end, { expr = true })
