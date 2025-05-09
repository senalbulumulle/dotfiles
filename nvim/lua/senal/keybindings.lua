-- keybindings --

-- Leader key setup
vim.g.mapleader = " " -- Set space as leader key

-- Basic keybindings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- File explorer
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true }) -- Clear search highlights

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Better text selection
vim.keymap.set("n", "uio", "viw", { desc = "Select word under cursor" })
vim.keymap.set("n", "uioo", "V", { desc = "Select current line" })

-- Better indentation
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Allows the ability to indent the code --
vim.keymap.set("n", "<leader>is", "=", { desc = "Indent selected block" })