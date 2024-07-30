local o = vim.opt

-- misc
o.undofile = true
o.swapfile = false
o.confirm = true
o.termguicolors = true

-- editing
vim.schedule(function()
  o.clipboard = 'unnamedplus'
end)
o.virtualedit = 'block'
o.startofline = true

-- tabs/indents
o.breakindent = true
o.smartindent = true
o.wrap = false
-- o.tabstop = 4
-- o.shiftwidth = 4

-- chars
o.fillchars:append({
  eob = ' ',
  diff = '╱',
  foldopen = '',
  foldclose = '',
  fold = '╌',
  foldsep = ' ',
})
o.list = true
o.listchars = {
  tab = '↦ ',
  extends = '…',
  precedes = '…',
  nbsp = '␣',
}

-- statusline
o.cmdheight = 0
o.laststatus = 3
o.showmode = false
o.showcmd = false

-- statuscolumn
o.number = true
o.signcolumn = 'yes'

-- cursorline
o.cursorline = true
o.cursorlineopt = 'number'

-- splits
o.splitbelow = true
o.splitright = true
o.splitkeep = 'screen'

-- menus
o.pumheight = 5

-- search
o.ignorecase = true
o.smartcase = true
o.wrapscan = false
o.incsearch = false

-- mouse
o.mouse = 'a'
o.mousescroll = 'ver:1,hor:0'

-- filetypes
vim.filetype.add({
  extension = {
    zsh = 'sh',
    sh = 'sh',
  },
  filename = {
    ['.zshrc'] = 'sh',
    ['.zshenv'] = 'sh',
  },
})
