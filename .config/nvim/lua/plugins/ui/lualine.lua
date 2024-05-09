return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
	event = "ColorScheme",
	config = function()
		local function total_lines()
			return vim.api.nvim_buf_line_count(0)
		end
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
							show_loading = true,
						},
					},
				},
				lualine_y = {
					{
						"filetype",
					},
				},
				lualine_z = {
					{
						total_lines,
						padding = { left = 0, right = 0 },
					},
				},
			},
			inactive_sections = {
				lualine_c = {
					{ "filename", path = 0 },
				},
				lualine_x = {},
				lualine_y = { "filetype" },
				lualine_z = {
					{
						total_lines,
						padding = { left = 0, right = 0 },
					},
				},
			},
		})
	end,
}
