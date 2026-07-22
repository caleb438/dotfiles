vim.cmd.colorscheme("catppuccin")
vim.o.laststatus = 2          -- makes neovim always display status bar

vim.opt.nu = true             -- displays line numbers
vim.opt.relativenumber = true -- displays relative line numbers

vim.opt.tabstop = 2           -- display \t character as 2 spaces
vim.opt.softtabstop = 2       -- makes tab and backspace do 2 space characters

vim.opt.shiftwidth = 2        -- number of spaces used when auto indenting
vim.opt.expandtab = true      -- converts tab key to do actual spaces
vim.opt.smartindent = true    -- adds new level of indentation when pressing enter after opening braces

vim.opt.hlsearch = false      -- disable search highlighting after search is done
vim.opt.incsearch = true      -- jump to closest match after every character typed while searching

vim.opt.termguicolors = true  -- enables 24-bit true color support in terminal
vim.opt.scrolloff = 8         -- adds 8 lines of padding to cursor while scrolling up and down
