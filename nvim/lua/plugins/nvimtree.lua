return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup
		{
			update_focused_file = {
				enable = true,
				update_cwd = false,
				ignore_list = {},
			},
			git = {
				enable = true, -- enable git integration (default: true)
				ignore = false, -- show .gitignored files (default: false)
				show_on_dirs = true, -- show git status on directories (default: true)
				timeout = 400, -- git command timeout in ms (default: 400)
			},

		}
	end,
}
