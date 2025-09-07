return {
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
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
				"lsonls", --JSON
				"html",
				"dockerls",
				"cssls",
				"ansiblels",

			},
		},
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	}
}
