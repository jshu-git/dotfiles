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

-- fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 99

-- tabs/indents
opt.breakindent = true
opt.smartindent = true
opt.wrap = false
opt.tabstop = 4
opt.shiftwidth = 4

-- chars
opt.fillchars:append({
  diff = '╱',
  foldopen = '',
  foldclose = '',
  -- fold = '╌',
  fold = '-',
  foldsep = ' ',
})
opt.list = true
opt.listchars = {
  tab = '↦ ',
  extends = '…',
  precedes = '…',
  nbsp = '␣',
}

-- statusline
-- opt.cmdheight = 0
opt.laststatus = 3
opt.showmode = false
opt.showcmd = false

-- statuscolumn
opt.number = true
opt.signcolumn = 'yes'

-- cursorline
opt.cursorline = true
-- opt.cursorlineopt = 'number'

-- splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = 'screen'

-- menus
opt.pumheight = 5

-- search
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = false
-- opt.incsearch = false

-- mouse
opt.mouse = 'a'
opt.mousescroll = 'ver:1,hor:0'
