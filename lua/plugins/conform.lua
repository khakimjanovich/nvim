return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffuer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = { timeout_ms = 2000, lsp_fallback = true },
	},
}
