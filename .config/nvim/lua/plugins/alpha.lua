return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"echasnovski/mini.pick",
		"echasnovski/mini.files",
	},
	opts = function()
		local dashboard = require("alpha.themes.dashboard")

		-- header
		local header = dashboard.section.header
		header.val = "  Welcome to SnoreTown."

		-- buttons
		local buttons = dashboard.section.buttons
		buttons.opts.spacing = 0
		buttons.val = {
			dashboard.button("r", "󰁯  Restore Session", "<cmd>lua require('persistence').load()<CR>]"),
			dashboard.button("f", "󰍉  Find", "<cmd>Pick files<CR>"),
			dashboard.button("e", "  Explorer", "<cmd>lua MiniFiles.open()"),
			dashboard.button("n", "  New File", "<cmd>enew<CR>"),
			dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("<esc>", "󰩈  Exit", "<cmd>qa<CR>"),
		}
		-- padding
		for _, button in ipairs(buttons.val) do
			button.opts.width = 20
		end

		dashboard.config.layout = {
			{ type = "padding", val = 16 },
			header,
			{ type = "padding", val = 1 },
			buttons,
			{ type = "padding", val = 1 },
		}
		return dashboard
	end,
	config = function(_, dashboard)
		-- close lazy and reopen when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end
		require("alpha").setup(dashboard.config)
	end,
}
