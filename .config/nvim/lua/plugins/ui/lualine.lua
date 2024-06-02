return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
	config = function()
		local function total_lines()
			return vim.api.nvim_buf_line_count(0) .. "L"
		end
		-- file size
		local function file_size()
			return string.format("%.2f", vim.fn.getfsize(vim.fn.expand("%:p")) / 1024) .. "KB"
		end

		require("lualine").setup({
			options = {
				-- theme = require("lualine.themes.rose-pine-alt"),
				theme = "vscode",
				component_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha" },
			},
			sections = {
				lualine_a = {
					{ "mode" },
				},
				lualine_b = {
					{ "branch" },
					{ "diff" },
					{ "diagnostics" },
				},
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
									sleep = " ",
									disabled = " ",
									warning = " ",
									unknown = "",
								},
							},
							show_colors = true,
						},
					},
					{ "filetype", padding = { left = 0, right = 1 } },
					{ file_size, padding = { left = 0, right = 1 } },
				},
				lualine_y = {},
				lualine_z = {
					{ total_lines },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", path = 0 },
				},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
