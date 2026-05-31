return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto", -- Automatically matches your current colorscheme
			},
			-- Move the long file path to a separate bar at the TOP of the window
			winbar = {
				lualine_c = {
					{
						"filename",
						path = 2, -- Absolute path
						-- 0: Just the filename
						-- 1: Relative path
						-- 2: Absolute path
						-- 3: Absolute path, with tilde as the home directory
					},
				},
			},
			inactive_winbar = {
				lualine_c = {
					{
						"filename",
						path = 2,
					},
				},
			},
		})
	end,
}
