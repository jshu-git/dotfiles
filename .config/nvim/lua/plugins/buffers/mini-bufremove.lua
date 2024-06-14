return {
	"echasnovski/mini.bufremove",
	config = function()
		local mini = require("mini.bufremove")
		mini.setup()

		vim.keymap.set("n", "<leader>x", function()
			mini.delete(0, false)
		end, { desc = "Delete Buffer" })
		vim.keymap.set("n", "<leader>X", function()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if buf ~= vim.api.nvim_get_current_buf() then
					mini.delete(buf, false)
				end
			end
		end, { desc = "Delete Other Buffers" })
		-- vim.keymap.set("n", "<leader>X", function()
		-- 	mini.delete(0, false)
		-- 	vim.cmd("silent! close")
		-- end, { desc = "Delete Buffer and Window" })
	end,
}
