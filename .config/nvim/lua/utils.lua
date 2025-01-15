local H = {}

-- ui
H.highlight_timeout = 250
H.popup = {
  height = math.floor(0.80 * vim.o.lines),
  width = math.floor(0.80 * vim.o.columns),
}
H.border = { '─', '│', '─', '│', '┌', '┐', '┘', '└' }

return H
