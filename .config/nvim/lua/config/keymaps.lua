vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- misc
map('n', '<esc>', '<cmd>nohlsearch<CR>')

-- leader
map('n', '<leader>w', '<cmd>update<CR>', { desc = 'Write' })
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
map('n', '<leader>Q', '<cmd>qa!<CR>', { desc = 'Quit All' })
map('n', '<leader>S', '<cmd>so %<CR>', { desc = 'Source File' })
map('n', '<leader>i', '<cmd>Inspect<CR>', { desc = 'Inspect' })
map('n', '<leader>N', '<cmd>enew<CR>', { desc = 'New Buffer' })

-- map('n', '<leader>o', 'o<Esc>', { desc = 'New Line After' })
-- map('n', '<leader>O', 'O<Esc>', { desc = 'New Line Before' })
-- map('n', '<leader>p', '<cmd>put<CR>', { desc = 'Paste After' })
-- map('n', '<leader>P', '<cmd>put!<CR>', { desc = 'Paste Before' })
map('n', 'O', 'o<Esc>', { desc = 'New Line After' })
map('n', 'P', '<cmd>put<CR>', { desc = 'Paste After' })

map('n', '<leader>,', 'mzA,<Esc>`z', { desc = 'Append Comma' })
map('n', '<leader>;', 'mzA;<Esc>`z', { desc = 'Append Semicolon' })
map('n', 'X', 'mzA<BS><Esc>`z')

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
map('n', '<CR>', '"_ciw')
map('n', '<S-CR>', '<CR>')
map('n', 'U', '<C-r>')
map('n', '<BS>', '<C-^>')
map('n', 'i', function()
  return vim.fn.getline('.') == '' and '"_cc' or 'i'
end, { expr = true })

-- command mode
map({ 'n', 'x' }, ';', ':')
map('n', ':', '@:')

-- preserve clipboard
map({ 'n', 'x' }, 'x', '"_x')
map({ 'n', 'x' }, 'c', '"_c')
map({ 'n', 'x' }, 'C', '"_C')
map('n', 'dD', '"_dd')
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

-- custom operators
-- vim.keymap.set("n", "sf", ":%s/<C-r><C-w>//gI<left><left><left>", { desc = "Substitute cword (File)" })
-- vim.keymap.set("x", "s/", ":s///gI<left><left><left><left>", { desc = "Substitute in selection" })
-- https://old.reddit.com/r/neovim/comments/1dfvluw/share_your_favorite_settingsfeaturesexcerpts_from/l8qlbs8/
map('n', 'sw', 'g*Ncgn', { desc = 'Substitute cword (Instance)' })
map(
  'x',
  'sw',
  [[y/\V<C-R>=substitute(escape(@", '/\'), '\n', '\\n', 'g')<NL><CR>Ncgn]],
  { desc = 'Substitute (Instance)' }
)

-- yanking
map('n', 'gy', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
  vim.notify('Copied: ' .. vim.fn.expand('%:p'))
end)
map('n', 'gY', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  vim.notify('Copied: ' .. vim.fn.expand('%'))
end)

-- quickfix
map('n', ']q', '<cmd>cnext<CR>', { desc = 'Next Quickfix' })
map('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous Quickfix' })
map('n', '[Q', '<cmd>cfirst<CR>', { desc = 'First Quickfix' })
map('n', ']Q', '<cmd>clast<CR>', { desc = 'Last Quickfix' })
map('n', '<leader>c', function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      vim.cmd('cclose')
      return
    end
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd('copen')
  else
    vim.notify('No Quickfix', vim.log.levels.WARN)
  end
end, { desc = 'Quickfix' })
-- tabs
map('n', ']t', '<cmd>tabnext<CR>', { desc = 'Next Tab' })
map('n', '[t', '<cmd>tabprev<CR>', { desc = 'Previous Tab' })

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
