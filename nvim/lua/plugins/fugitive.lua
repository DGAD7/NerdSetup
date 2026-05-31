return {
	"tpope/vim-fugitive",
	keys = {
		-- Open the main Git status window
		{ "<leader>gs", "<cmd>Git<CR>",        desc = "Git Status (Fugitive)" },
		-- Quickly blame the current file
		{ "<leader>gb", "<cmd>Git blame<CR>",  desc = "Git Blame (Fugitive)" },
		-- Open a 3-way split to resolve merge conflicts or view diffs
		{ "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "Git Diff Split (Fugitive)" },
		-- Quick shortcuts for committing and pushing
		{ "<leader>gc", "<cmd>Git commit<CR>", desc = "Git Commit (Fugitive)" },
	},
}
