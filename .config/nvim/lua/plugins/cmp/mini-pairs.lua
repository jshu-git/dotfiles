return {
	"echasnovski/mini.pairs",
	event = "InsertEnter",
	config = function()
		require("mini.pairs").setup({
			modes = {
				insert = true,
				-- command = true,
			},
			mappings = {
				["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]." },
				[">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]." },
			},
		})
	end,
}
