-- init.lua -- 

-- __   ___                                
-- /__` |__  |\ |  /\  |       \  / |  |\/| 
-- .__/ |___ | \| /~~\ |___     \/  |  |  |  1.0
                                         

-- LAZY VIM Included



local function init()
        vim.cmd("set expandtab")
        vim.cmd("set shiftwidth=4")
        vim.cmd("set softtabstop=4")
        vim.cmd("set tabstop=4")
        vim.cmd("set number")
        vim.cmd("set relativenumber")
end


init()



-- Variable set for lazy --

package_one = "catppuccin/nvim"
package_two = "nvim-treesitter/nvim-treesitter"
package_three = "preservim/nerdtree"





-- Lazy stuff--

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
        { package_one, name = "catppuccin", priority = 1000 },
        { package_two, name = "nvim-treesitter", priority = 1000 },
        { package_three, name = "nerdtree", priority = 1000 }
}
local opts    = {}

require("lazy").setup(plugins, opts)







-- Plugin setups--
local function themeSettings()
        require("catppuccin").setup()
        vim.cmd.colorscheme "catppuccin"
end


themeSettings()



-- Keybindings --
local function keyBindings()
        vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle .<CR>', {noremap = true})
end


keyBindings()
