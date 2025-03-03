-- Senal's Neovim Config --
--
--  Based on LazyVim --
--
require("senal.keybindings")
require("senal.lazy")
print("hello world")


shiftwidth = 2;
softtabstop = -1;


vim.opt.tabstop = 8       -- Set the width of a tab character
vim.opt.shiftwidth = 8    -- Set the number of spaces to use for each step of indentation
vim.opt.expandtab = true  -- Use spaces instead of tabs

return {}
