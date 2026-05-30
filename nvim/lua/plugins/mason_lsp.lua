return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- Ensure lspconfig is loaded so it populates vim.lsp.config with default server settings
			require("lspconfig")

			local servers = {
				"bashls",
				"tailwindcss",
				"cmake",
				"clangd", -- C++,C
				"gopls", -- Go
				"templ", -- Templ
				"pyright", -- Python
				"lua_ls", -- Lua
				"yamlls", -- YAML
				"lemminx", --XML
				"sqlls", --SQL
				"jsonls", --JSON
				"html",
				"dockerls",
				"cssls",
				"ansiblels",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			-- Update the built-in config table for clangd natively
			vim.lsp.config.clangd = vim.tbl_deep_extend("force", vim.lsp.config.clangd or {}, {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--suggest-missing-includes"
				}
			})

			-- Enable all servers using the new Neovim 0.11/0.12 API
			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	}
}
