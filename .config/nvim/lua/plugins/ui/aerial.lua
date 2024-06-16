return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local aerial = require("aerial")
		aerial.setup({
			keymaps = {
				["<C-j>"] = false,
				["<C-k>"] = false,
				["J"] = "actions.down_and_scroll",
				["K"] = "actions.up_and_scroll",
				["<esc>"] = "actions.close",
				["<Tab>"] = function()
					aerial.select()
					aerial.open({ direction = "float" })
				end,
			},
			highlight_closest = false,
			highlight_on_hover = true,
			show_guides = true,
			guides = { whitespace = "" },
			float = {
				border = "single",
				relative = "win",
			},
		})

		vim.keymap.set("n", "go", function()
			aerial.toggle({ direction = "float" })
		end, { desc = "Symbols Outline" })
	end,
}
