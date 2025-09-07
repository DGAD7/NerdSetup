return {
  
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd.colorscheme "murphy"
      -- Enable colorscheme preview in Telescope
      require("telescope").setup {
        extensions = {
          ["colorscheme"] = {
            enable_preview = true,
          },
        },
      }
    end,
  },
}
