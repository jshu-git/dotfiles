return {
	"rafcamlet/nvim-luapad",
	config = function()
		local luapad = require("luapad")
		luapad.setup({
			split_orientation = "horizontal",
		})

		vim.keymap.set("n", "<leader>mp", luapad.init, { desc = "New Luapad" })
		vim.keymap.set("n", "<leader>tp", function()
			if luapad.current() == nil then
				vim.notify("Luapad on (Buffer)")
			else
				vim.notify("Luapad off (Buffer)")
			end
			luapad.toggle()
		end, { desc = "Toggle Luapad (Buffer)" })
	end,
}
