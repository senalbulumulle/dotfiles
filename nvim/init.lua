-- Senal's Neovim Config --

-- Requiring files here --
require("senal.keybindings")
require("senal.kickstart")

-- Require Files for custom programs in neovim --
-- require custom programs here --


shiftwidth = 2;
softtabstop = -1;


-- 
-- 
--

vim.opt.tabstop = 4       -- Set the width of a tab character
vim.opt.shiftwidth = 4    -- Set the number of spaces to use for each step of indentation
vim.opt.expandtab = true  -- Use spaces instead of tabs

return {}
