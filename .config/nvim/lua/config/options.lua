-- misc
vim.o.undofile = true
vim.o.swapfile = false
vim.o.confirm = true
vim.o.termguicolors = true

-- editing
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.virtualedit = 'block'
vim.o.startofline = true

-- cmp
vim.o.pumheight = 5
vim.o.completeopt = 'menu,menuone,noinsert'
vim.o.infercase = true
vim.opt.shortmess:append('c')
if vim.fn.has('nvim-0.11') == 1 then
  vim.opt.completeopt:append('fuzzy')
end

-- fold
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldlevelstart = 99

-- tabs/indents
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- wrap
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.wrap = false
vim.o.showbreak = '↳ '
vim.o.sidescrolloff = 8

-- chars
vim.o.list = true
vim.o.listchars = 'tab:> ,extends:…,precedes:…,nbsp:␣'
vim.opt.fillchars:append({ diff = '╱', fold = '-', foldsep = ' ' })

-- statusline
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.showcmd = false

-- statuscolumn
vim.o.number = true
vim.o.signcolumn = 'yes'

-- cursorline
vim.o.cursorline = true
-- vim.o.cursorlineopt = 'number'

-- splits
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = 'screen'

-- search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = false
vim.o.incsearch = false
vim.opt.shortmess:append('S')

-- mouse
vim.o.mouse = 'a'
vim.o.mousescroll = 'ver:1,hor:0'
