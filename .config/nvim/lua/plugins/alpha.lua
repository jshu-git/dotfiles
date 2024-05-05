return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"rmagatti/auto-session",
	},
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = {
			-- [[          ▀████▀▄▄              ▄█ ]],
			-- [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
			-- [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
			-- [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
			-- [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
			-- [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
			-- [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
			-- [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
			-- [[   █   █  █      ▄▄           ▄▀   ]],
			[[       ___           ___           ___                                    ___     ]],
			[[      /__/\         /  /\         /  /\          ___        ___          /__/\    ]],
			[[      \  \:\       /  /:/_       /  /::\        /__/\      /  /\        |  |::\   ]],
			[[       \  \:\     /  /:/ /\     /  /:/\:\       \  \:\    /  /:/        |  |:|:\  ]],
			[[   _____\__\:\   /  /:/ /:/_   /  /:/  \:\       \  \:\  /__/::\      __|__|:|\:\ ]],
			[[  /__/::::::::\ /__/:/ /:/ /\ /__/:/ \__\:\  ___  \__\:\ \__\/\:\__  /__/::::| \:\]],
			[[  \  \:\~~\~~\/ \  \:\/:/ /:/ \  \:\ /  /:/ /__/\ |  |:|    \  \:\/\ \  \:\~~\__\/]],
			[[   \  \:\  ~~~   \  \::/ /:/   \  \:\  /:/  \  \:\|  |:|     \__\::/  \  \:\      ]],
			[[    \  \:\        \  \:\/:/     \  \:\/:/    \  \:\__|:|     /__/:/    \  \:\     ]],
			[[     \  \:\        \  \::/       \  \::/      \__\::::/      \__\/      \  \:\    ]],
			[[      \__\/         \__\/         \__\/           ~~~~                   \__\/    ]],
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
			dashboard.button("e", "  Explorer", "<cmd>Oil --float<CR>"),
			dashboard.button("n", "  New File", "<cmd>enew<CR>"),
			dashboard.button("q", "󰩈  Quit", "<cmd>qa<CR>"),
		}
		for _, button in ipairs(buttons.val) do
			-- padding
			button.opts.width = 20
		end

		-- footer
		local footer = dashboard.section.footer

		dashboard.config.layout = {
			{ type = "padding", val = 10 },
			header,
			{ type = "padding", val = 2 },
			buttons,
			{ type = "padding", val = 2 },
			footer,
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
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = "(loaded " .. stats.count .. " plugins in " .. ms .. "ms)"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
