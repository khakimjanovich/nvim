return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		require("nvim-tree").setup({})
		local function open_nvim_tree(data)
			local directory = vim.fn.isdirectory(data.file) == 1
			if not directory then
				return
			end
			
			vim.cmd.cd(data.file)
			require("nvim-tree.api").tree.open()
		end
		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
	end
}
