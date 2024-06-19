return {
	"echasnovski/mini.pairs",
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({
			modes = { insert = true, command = true },
		})
	end,
}
