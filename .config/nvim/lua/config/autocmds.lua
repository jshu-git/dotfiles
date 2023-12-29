-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
api.nvim_create_autocmd({ "WinLeave" }, { pattern = "*", command = "set nocursorline", group = cursorGrp })
-- show cursor column in active window
local cursorColGrp = api.nvim_create_augroup("CursorColumn", { clear = true })
api.nvim_create_autocmd({ "WinEnter" }, { pattern = "*", command = "set cursorcolumn", group = cursorColGrp })
api.nvim_create_autocmd({ "WinLeave" }, { pattern = "*", command = "set nocursorcolumn", group = cursorColGrp })

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })
api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})
