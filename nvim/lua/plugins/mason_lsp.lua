return {
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

		-- Create an autocommand that runs every time an LSP attaches to a buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				opts.desc = "LSP Hover Documentation"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "LSP Rename Symbol"
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "LSP Code Action"
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "LSP References"
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)

				opts.desc = "Show LSP Diagnostics"
				vim.keymap.set("n", "<leader>lD", vim.diagnostic.open_float, opts)

				opts.desc = "Document LSP Diagnostics (Telescope)"
				vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
			end,
		})
	end,
}
