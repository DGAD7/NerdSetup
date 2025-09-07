# DGADs NVIM setup

The setup is based on [Lazy Nvim](https://lazy.folke.io)

#### How to use this
* [Install neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

* Clone this repo to any location of choice
* Create a symlink to this folder. For example if the clone is made in ~/Documents/projects/NerdSetup/ the command as below:w
```
 ln -s ~/Documents/projects/NerdSetup/nvim ~/.config/nvim
```


## NVIM packages installed

### nvimtree
* This package provides a explorer tree view of the files.
* see keybindings for keys related to this.

### bufferline
* This package helps with managing buffers
https://github.com/akinsho/bufferline.nvim?tab=readme-ov-file#installation

### telescope
* This package helps with fuzzy logics. Find files, livegrep, change colorschemes
* Keybindings in whichkey 
* Default colorscheme is `murphy`  
https://github.com/nvim-telescope/telescope.nvim

### whichkey
* Contains all th keybindings
* keybidings are in configs/keymap
https://github.com/folke/which-key.nvim

### miniicons
* This packages adds icons and text like prints Insert in insert mode and so on.
https://github.com/nvim-mini/mini.icons

### colorschemes
* This files adds the tokyonight colorscheme. 

### web devicons
* Adds NerdFonts
https://github.com/nvim-tree/nvim-web-devicons

* Ensure that nerdfons are installed
https://www.nerdfonts.com/font-downloads


## Useful commands

### Find an replace multiple files

`*cgn` : Selects the word above the cursor and deletes that word. Then the user can type the new word and press esc.
`.`    : Following the above action, pressing the `.` key will replace all the instance of that word in that file.

### Commenting a line.
`gcc` : In normal mode (pressed 'esc') typing `gcc` will make the line a comment in that specific format.


### Find source
`gd`: Pressing `gd` on a code line, will navigate to the source of the code above the cursor.
