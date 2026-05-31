return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		require("mason").setup() -- Ensure Mason is initialized first

		require("mason-tool-installer").setup({
			-- A list of tools you want to automatically install
			ensure_installed = {
				"cspell",
				"prettier", -- example formatter
				"eslint_d", -- example linter
				"ts_ls", -- LSP
				"ts_ls", -- example LSP
				"stylua", -- Lua formatter
				"black", -- Python formatter
				"isort", -- Python import sorter
				"flake8", -- Python linter
				"clang-format", -- C/C++ formatter
				"gofumpt", -- Go formatter
				"golangci-lint", -- Go linter
				"shfmt", -- Bash/Shell formatter
			},

			-- Automatically update these tools when starting Neovim
			auto_update = false,

			-- Run the installer on startup (checks if tools are missing)
			run_on_start = true,

			-- Delay the startup execution by this amount of ms to avoid slowing down Neovim startup
			start_delay = 3000,
		})
	end,
}
