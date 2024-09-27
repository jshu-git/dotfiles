local opt = vim.opt

-- misc
opt.undofile = true
opt.swapfile = false
opt.confirm = true
opt.termguicolors = true

-- editing
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)
opt.virtualedit = 'block'
opt.startofline = true

-- cmp
opt.pumheight = 5

-- fold
opt.foldmethod = 'expr'
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
opt.foldlevelstart = 99

-- tabs/indents
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4

-- wrap
opt.breakindent = true
opt.linebreak = true
opt.wrap = false
opt.showbreak = '↳ '
opt.sidescrolloff = 8

-- chars
opt.fillchars:append({
  diff = '╱',
  fold = '-',
  foldsep = ' ',
})
opt.list = true
opt.listchars = {
  tab = '> ',
  extends = '…',
  precedes = '…',
  nbsp = '␣',
}

-- statusline
opt.laststatus = 3
opt.showmode = false
opt.showcmd = false

-- statuscolumn
opt.number = true
opt.signcolumn = 'yes'

-- cursorline
opt.cursorline = true
opt.cursorlineopt = 'number'

-- splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'screen'

-- search
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = false
opt.incsearch = false

-- mouse
opt.mouse = 'a'
opt.mousescroll = 'ver:1,hor:0'
