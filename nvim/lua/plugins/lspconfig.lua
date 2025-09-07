return {
	'neovim/nvim-lspconfig',
	config = function()
		require('lspconfig').pyright.setup {} -- Python
		require('lspconfig').clangd.setup {} -- C++ brew install llvm (for clangd)
		require('lspconfig').gopls.setup {} -- Go go install golang.org/x/tools/gopls@latest
		require('lspconfig').lua_ls.setup {} -- Lua  Follow instructions at https://github.com/LuaLS/lua-language-server
		require('lspconfig').templ.setup {} -- Templ go install github.com/a-h/templ/cmd/templ@latest
	end
}
