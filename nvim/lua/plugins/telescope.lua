return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local telescope = require("telescope")
			telescope.setup {
				pickers = {
					colorscheme = {
						enable_preview = true
					}
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {}
					}
				}
			}
			telescope.load_extension("ui-select")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	},

	{
		'nvim-lua/plenary.nvim',
	},

	{
		'nvim-telescope/telescope-ui-select.nvim',
	},
}
