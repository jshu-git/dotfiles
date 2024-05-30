return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "AndreM222/copilot-lualine" },
		{ "dokwork/lualine-ex" },
	},
	config = function()
		local function total_lines()
			return vim.api.nvim_buf_line_count(0) .. "L"
		end

		require("lualine").setup({
			options = {
				-- https://github.com/rose-pine/neovim/tree/main/lua/lualine/themes
				theme = require("lualine.themes.rose-pine-alt"),
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha" },
			},
			sections = {
				lualine_a = {
					{ "mode", padding = { left = 1, right = 0 } },
				},
				lualine_b = {
					{ "branch", padding = { left = 1, right = 0 } },
					{ "diff", padding = { left = 1, right = 0 } },
					{ "diagnostics", padding = { left = 1, right = 0 } },
				},
				lualine_c = {
					{ "filename", path = 1, padding = { left = 1, right = 0 } },
				},
				lualine_x = {
					{
						"copilot",
						symbols = {
							status = {
								icons = {
									enabled = " ",
									sleep = " ",
									disabled = " ",
									warning = " ",
									unknown = "",
								},
							},
							show_colors = true,
						},
						padding = { left = 0, right = 1 },
					},
				},
				lualine_y = {
					{
						"ex.lsp.single",
						icons = {
							lsp_is_off = "nolsp",
						},
						padding = { left = 0, right = 1 },
					},
					-- {
					-- 	"filetype",
					-- 	icon = { "" },
					-- 	padding = { left = 0, right = 1 },
					-- },
				},
				lualine_z = {
					{ total_lines, padding = { left = 0, right = 1 } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", path = 3 },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
