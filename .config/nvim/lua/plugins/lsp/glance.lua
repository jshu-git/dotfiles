return {
	"dnlhc/glance.nvim",
	cmd = "Glance",
	config = function()
		local glance = require("glance")
		local actions = glance.actions
		glance.setup({
			height = math.floor(0.5 * vim.o.lines),
			border = {
				enable = true,
				top_char = "─",
				bottom_char = "─",
			},
			list = {
				width = 0.2,
			},
			mappings = {
				list = {
					-- ["J"] = actions.next_location,
					-- ["K"] = actions.previous_location,
					["<C-v>"] = actions.jump_vsplit,
					["<C-s>"] = actions.jump_split,
					["<CR>"] = actions.enter_win("preview"),
					["<esc>"] = actions.close,
				},
				preview = {
					-- ["<esc>"] = actions.close,
					["<esc>"] = actions.enter_win("list"),
				},
			},
			folds = { folded = false },
		})
	end,
}
