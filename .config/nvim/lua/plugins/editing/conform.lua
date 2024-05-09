return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat then
					return
				end
				return { timeout_ms = 500, lsp_fallback = true }
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- python = { "isort", "black" },
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
		})

		vim.g.disable_autoformat = false
		vim.api.nvim_create_user_command("ToggleAutoformatting", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
		end, {
			desc = "Toggle Autoformatting",
		})
		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleAutoformatting<CR>", { desc = "Toggle Autoformatting" })
	end,
}
