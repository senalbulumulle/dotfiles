------------------------------------------------------
--              SENAL NEOVIM CONFIG
--
------------------------------------------------------

-- Requiring files here --
require("senal.keybindings")
require("senal.otherkeybindings")
require("senal.customcommands")
require("senal.customui")


shiftwidth = 2
softtabstop = -1



vim.opt.tabstop = 8 -- Set the width of a tab character
vim.opt.shiftwidth = 8 -- Set the number of spaces to use for each step of indentation
vim.opt.expandtab = true -- Use spaces instead of tabs


-- prevent wrapping issues --


return {}
