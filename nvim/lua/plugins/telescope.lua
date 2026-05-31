return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },

		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>",                                        desc = "Find Files" },
			{ "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", desc = "Find All Files" },
			{ "<leader>fe", "<cmd>Telescope file_browser<CR>",                                      desc = "File Browser" },
			{ "<leader>fF", "<cmd>Telescope live_grep<CR>",                                         desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<CR>",                                           desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>",                                         desc = "Help Tags" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<CR>",                                          desc = "Old Files" },
			{ "<leader>fc", "<cmd>Telescope colorscheme<CR>",                                       desc = "Choose Colorscheme" },
			{ "<leader>gi", "<cmd>Telescope lsp_implementations<CR>",                               desc = "LSP: [G]oto [I]mplementation" },
			{ "gd",         function() require('telescope.builtin').lsp_definitions() end,          desc = "LSP: [G]oto [D]efinition" },
			{ "gr",         function() require('telescope.builtin').lsp_references() end,           desc = "LSP: [G]oto [R]eferences" },
			{ "gI",         function() require('telescope.builtin').lsp_implementations() end,      desc = "LSP: [G]oto [I]mplementation" },
		},

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
		'nvim-lua/plenary.nvim',
	},

	{
		'nvim-telescope/telescope-ui-select.nvim',
	},
}
