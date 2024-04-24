return {
	"miversen33/sunglasses.nvim",
	event = "UIEnter",
	config = function()
		require("sunglasses").setup({
			filter_percent = 0.5,
		})
	end,
}
