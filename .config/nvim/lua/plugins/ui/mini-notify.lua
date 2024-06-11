return {
	"echasnovski/mini.notify",
	config = function()
		local notify = require("mini.notify")
		notify.setup({
			window = { winblend = 0 },
		})
		vim.notify = notify.make_notify()
		vim.keymap.set("n", "<leader>mm", notify.clear, { desc = "Clear Notifications" })
		vim.keymap.set("n", "<leader>mh", function()
			vim.cmd("split")
			notify.show_history()
		end, { desc = "Show Notifications History" })
	end,
}
