return {
	"nvim-zh/colorful-winsep.nvim",
	event = "WinNew",
	config = function()
		require("colorful-winsep").setup({
			symbols = { "─", "│", "┌", "┐", "└", "┘" },
			hi = { link = "DiagnosticWarn" },
			smooth = false,
			exponential_smoothing = false,
		})
	end,
}
