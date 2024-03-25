-- Senal's Best Configuration File for Neovim --




local vim = vim
local Plug = vim.fn['plug#']




--[[

--------------
Introduction: 
--------------
Welcome to Senal's Configuration files for lua. Basically this configuration 
file for Neovim allows the abilty to customize neovim based on Senal's liking.

This particular configuration file is designed to be ONLY be used on Windows. 

The init.lua is served as a documentation mostly so the files are in different 
locations for ease of maintainability

For now, the configuration settings is all in one file here, until some kind 
of organization will take place.

]]



print(":-)")									-- Put a Smile Face because why not




--[[

--------------
Functions
--------------


vim_configurations
------------------
-- Inside this function, this function allows the ability to configure the vim keybindings for ease of use 
-- inside the neovim configuration file. 

	
]]



local function vim_configurations() 
	-- --
	vim.opt.number 	= false		-- True = Enables the number | False = Disables the number	
	vim.o.shell = 'powershell'	-- This sets the default shell--

end



local function vim_plugins()
	vim.call('plug#begin')
	Plug('preservim/nerdtree', { ['on'] = 'NERDTreeToggle' })
	Plug('vim-airline/vim-airline')
	Plug('mhinz/vim-startify')



	vim.call('plug#end')
end




local function vim_keybindings()
	vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle .<CR>', {noremap = true})
end




vim_configurations()
vim_plugins()
vim_keybindings()
