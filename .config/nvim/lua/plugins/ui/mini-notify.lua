return {
	"echasnovski/mini.notify",
	config = function()
		local notify = require("mini.notify")
		notify.setup({ window = { winblend = 0 } })
		vim.notify = notify.make_notify()
		vim.keymap.set("n", "<leader>mm", notify.clear, { desc = "Clear Notifications" })
		vim.keymap.set(
			"n",
			"<leader>mh",
			"<cmd>vsplit | lua MiniNotify.show_history()<CR>",
			{ desc = "Show Notifications History" }
		)
	end,
}
