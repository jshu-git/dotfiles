return {
	"Fildo7525/pretty_hover",
	event = "LspAttach",
	config = function()
		require("pretty_hover").setup({
			border = "single",
			max_width = math.floor(0.5 * vim.o.columns),
			max_height = math.floor(0.25 * vim.o.lines),
		})
	end,
}
