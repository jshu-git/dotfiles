return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
	event = "ColorScheme",
	config = function()
		require("lualine").setup({
			options = {
				theme = "rose-pine-alt",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "undotree", "alpha" },
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					{
						"copilot",
						symbols = {
							status = {
								icons = {
									enabled = "",
									sleep = "",
									disabled = "",
									warning = "",
									unknown = "",
								},
							},
							show_colors = true,
						},
					},
					"filetype",
				},
				lualine_y = {},
				lualine_z = {
					{
						"location",
						padding = { left = 0, right = 0 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "quickfix" },
		})
	end,
}
