-- keybindings --
--

-- this for space
--
vim.g.mapleader = " "


-- Gets into the file manager vim file manager. This may change in the future 
-- How you able to do that, just simply use <space> and then pv to go the file
-- manager
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- Allows the ability to indent the code --
vim.keymap.set("n", "<leader>is", "=", { desc = "Indent selected block" })



-- Disables highlight after searching using ESC --
vim.keymap.set('n', '<Esc>', ':nohlsearch<CR>', { silent = true })
