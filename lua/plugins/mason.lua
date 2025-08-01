return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	cmd = "Mason",
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
			"lua-language-server",
		},
	},
}
