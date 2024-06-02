return {
	"monaqa/dial.nvim",
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				-- numbers
				augend.integer.alias.decimal_int,
				augend.integer.alias.hex,

				-- constants
				augend.constant.alias.bool,
				augend.constant.new({
					elements = { "and", "or" },
				}),
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
				}),

				-- hexcolor
				augend.hexcolor.new({
					case = "lower",
				}),
			},
		})

		vim.keymap.set("n", "=", function()
			require("dial.map").manipulate("increment", "normal")
		end)
		vim.keymap.set("n", "-", function()
			require("dial.map").manipulate("decrement", "normal")
		end)
	end,
}
