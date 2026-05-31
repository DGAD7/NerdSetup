return
{
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here (try changing "murphy" to "tokyonight" or "catppuccin")
			vim.cmd.colorscheme "murphy"
			-- Enable colorscheme preview in Telescope
			require("telescope").setup {
				extensions = {
					["colorscheme"] = {
						enable_preview = true,
					},
				},
			}
		end,
	},
	{ "catppuccin/nvim",        name = "catppuccin", lazy = true },
	{ "rose-pine/neovim",       name = "rose-pine",  lazy = true },
	{ "rebelot/kanagawa.nvim",  lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
}
