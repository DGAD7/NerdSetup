return {
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers",
				close_command = "bdelete! %d",
				right_mouse_command = "bdelete! %d",
				left_mouse_command = "buffer %d",
				indicator = {
					style = 'icon',
				},
				diagnostics = "nvim_lsp",
				buffer_close_icon = '',
				modified_icon = '●',
				show_buffer_close_icons = true,
				close_icon = '',
				show_close_icon = true,
				separator_style = "slant",
				show_tab_indicators = true,
				always_show_bufferline = true,
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", highlight = "Directory", separator = true }
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
	}
}
