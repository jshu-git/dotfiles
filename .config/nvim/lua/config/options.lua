-- ui
vim.opt.pumblend = 10
vim.opt.pumheight = 5
vim.opt.winblend = 0
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

-- tabs/indents
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- folds https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 10
vim.opt.foldtext = ""
vim.opt.fillchars = { fold = " " }

-- misc
vim.opt.wrapscan = false
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.commentstring = "// %s"
vim.opt.termguicolors = true
