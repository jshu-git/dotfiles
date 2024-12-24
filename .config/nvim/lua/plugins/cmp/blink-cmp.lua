require('blink.cmp').setup({
  appearance = {
    use_nvim_cmp_as_default = false,
  },
  keymap = {
    preset = 'enter',
  },
  completion = {
    list = {
      selection = function(ctx)
        return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
      end,
    },
    menu = {
      max_height = 5,
      scrolloff = 3,
      draw = {
        columns = {
          { 'label', 'label_description', gap = 1 },
          { 'kind_icon', 'kind', gap = 1 },
        },
      },
    },
  },
  sources = {
    cmdline = function()
      local type = vim.fn.getcmdtype()
      if type == '/' or type == '?' then
        return { 'buffer' }
      end
      if type == ':' then
        return { 'cmdline' }
      end
      return {}
    end,
  },
})
