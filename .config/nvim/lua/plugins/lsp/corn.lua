return {
	"RaafatTurki/corn.nvim",
	config = function()
		require("corn").setup({
			icons = { error = "󰅚", warn = "󰀪", hint = "󰌶", info = "󰋽" },
			item_preprocess_func = function(item)
				return item
			end,
		})
	end,
}
