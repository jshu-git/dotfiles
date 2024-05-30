return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = false,
					italic = false,
					transparency = true,
				},
			})
		end,
		name = "rose-pine",
	},

	-- {
	-- 	"aktersnurra/no-clown-fiesta.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("no-clown-fiesta").setup({
	-- 			transparent = false,
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"kdheepak/monochrome.nvim",
	-- 	priority = 1000,
	-- },

	-- {
	-- 	"slugbyte/lackluster.nvim",
	-- 	priority = 1000,
	-- },
}
