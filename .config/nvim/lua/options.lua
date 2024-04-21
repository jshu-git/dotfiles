local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs/indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = false

-- appearance
opt.cursorline = true
opt.cursorcolumn = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.fillchars = { eob = " " }

-- windows
opt.splitright = true
opt.splitbelow = true

-- misc
opt.mouse = "a"
opt.scrolloff = 10
opt.inccommand = "split"
opt.undofile = true
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
opt.clipboard = "unnamedplus"
opt.swapfile = false

-- opt.showmode = false
-- opt.guicursor = 'n-v-i-c:block-Cursor'
