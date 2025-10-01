return {
	'neovim/nvim-lspconfig',
	config = function()
		-- Bash
		vim.lsp.start {
			name = 'bashls',
			cmd = { 'bash-language-server', 'start' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '.bashrc', '.bash_profile' }, { upward = true })[1]
			),
		}
		-- TailwindCSS
		vim.lsp.start {
			name = 'tailwindcss',
			cmd = { 'tailwindcss-language-server', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts', 'postcss.config.js', 'package.json', '.git' }, { upward = true })[1]
			),
		}
		-- CMake
		vim.lsp.start {
			name = 'cmake',
			cmd = { 'cmake-language-server' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'CMakeLists.txt', '.git' }, { upward = true })[1]
			),
		}
		-- C++ (clangd)
		vim.lsp.start {
			name = 'clangd',
			cmd = { 'clangd' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'compile_commands.json', 'compile_flags.txt', '.git' }, { upward = true })[1]
			),
		}
		-- Go (gopls)
		vim.lsp.start {
			name = 'gopls',
			cmd = { 'gopls' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'go.mod', '.git' }, { upward = true })[1]
			),
		}
		-- Templ
		vim.lsp.start {
			name = 'templ',
			cmd = { 'templ', 'lsp' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'go.mod', '.git' }, { upward = true })[1]
			),
		}
		-- Python (pyright)
		vim.lsp.start {
			name = 'pyright',
			cmd = { 'pyright-langserver', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile' }, { upward = true })[1]
			),
		}
		-- Lua
		vim.lsp.start {
			name = 'lua_ls',
			cmd = { 'lua-language-server' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.luarc.json', '.luarc.jsonc', '.git' }, { upward = true })[1]
			),
		}
		-- YAML
		vim.lsp.start {
			name = 'yamlls',
			cmd = { 'yaml-language-server', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '.yamllint', 'docker-compose.yml' }, { upward = true })[1]
			),
		}
		-- XML
		vim.lsp.start {
			name = 'lemminx',
			cmd = { 'lemminx' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '*.xml' }, { upward = true })[1]
			),
		}
		-- SQL
		vim.lsp.start {
			name = 'sqlls',
			cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '*.sql' }, { upward = true })[1]
			),
		}
		-- JSON
		vim.lsp.start {
			name = 'jsonls',
			cmd = { 'vscode-json-language-server', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '*.json' }, { upward = true })[1]
			),
		}
		-- HTML
		vim.lsp.start {
			name = 'html',
			cmd = { 'vscode-html-language-server', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '*.html' }, { upward = true })[1]
			),
		}
		-- Docker
		vim.lsp.start {
			name = 'dockerls',
			cmd = { 'docker-langserver', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'Dockerfile', '.git' }, { upward = true })[1]
			),
		}
		-- CSS
		vim.lsp.start {
			name = 'cssls',
			cmd = { 'vscode-css-language-server', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ '.git', '*.css' }, { upward = true })[1]
			),
		}
		-- Ansible
		vim.lsp.start {
			name = 'ansiblels',
			cmd = { 'ansible-language-server', '--stdio' },
			root_dir = vim.fs.dirname(
				vim.fs.find({ 'ansible.cfg', '.git' }, { upward = true })[1]
			),
		}
	end
}
