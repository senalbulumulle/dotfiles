vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
        -- Packer can manage itself, this is a requirement --
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0', 
        }



        -- File Explorer
        use {
                'nvim-tree/nvim-tree.lua',
                requires = { 'nvim-tree/nvim-web-devicons' } -- Optional for file icons
        }

end)
