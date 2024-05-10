return {
	"gelguy/wilder.nvim",
	event = "CmdlineEnter",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })
		wilder.set_option("pipeline", {
			wilder.branch(
				wilder.cmdline_pipeline({
					fuzzy = 1,
				}),
				wilder.vim_search_pipeline({
					fuzzy = 1,
				})
			),
		})
	end,
}
