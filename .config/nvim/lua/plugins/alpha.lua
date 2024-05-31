return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = {
			"  Welcome to SnoreTown.",
		}
		-- header
		local header = dashboard.section.header
		header.val = logo

		-- buttons
		local buttons = dashboard.section.buttons
		buttons.opts.spacing = 0
		buttons.val = {
			dashboard.button("r", "󰁯  Restore Session", "<cmd>SessionRestore<CR>"),
			dashboard.button("f", "󰍉  Find", "<cmd>Telescope find_files<CR>"),
			-- dashboard.button("e", "  Explorer", "<cmd>Oil --float<CR>"),
			---@diagnostic disable-next-line: param-type-mismatch
			dashboard.button("e", "  Explorer", function()
				MiniFiles.open()
			end),
			dashboard.button("n", "  New File", "<cmd>new<CR>"),
			dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
			dashboard.button("<esc>", "󰩈  Exit", "<cmd>qa<CR>"),
		}
		-- padding
		for _, button in ipairs(buttons.val) do
			button.opts.width = 20
		end

		-- footer
		-- local footer = dashboard.section.footer

		dashboard.config.layout = {
			{ type = "padding", val = 16 },
			header,
			{ type = "padding", val = 1 },
			buttons,
			{ type = "padding", val = 1 },
			-- footer,
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

		-- dynamic footer
		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "LazyVimStarted",
		-- 	callback = function()
		-- 		local stats = require("lazy").stats()
		-- 		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		-- 		dashboard.section.footer.val = "(loaded " .. stats.count .. " plugins in " .. ms .. "ms)"
		-- 		pcall(vim.cmd.AlphaRedraw)
		-- 	end,
		-- })
	end,
}
