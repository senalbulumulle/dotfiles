## init-install.sh

## TODO: 
## - Fix issue with slowing performance issues... may 
## - just have to use lazy instead????

function downloadRepo()
{
	mkdir -p /Users/$USER/.local/share/nvim/site/pack/manual/start/
	cd /Users/$USER/.local/share/nvim/site/pack/manual/start/
        git clone https://github.com/stevearc/aerial.nvim
        git clone https://github.com/rcarriga/nvim-dap-ui
        git clone https://github.com/folke/which-key.nvim
        git clone https://github.com/MunifTanjim/nui.nvim
        git clone https://github.com/nvim-telescope/telescope.nvim
        git clone https://github.com/github/copilot.vim
        git clone https://github.com/hrsh7th/nvim-cmp
        git clone https://github.com/nvim-treesitter/nvim-treesitter
        git clone https://github.com/glepnir/lspsaga.nvim
}


function uninstallRepo()
{
	mkdir -p /Users/$USER/.local/share/nvim/site/pack/manual/start/
	cd /Users/$USER/.local/share/nvim/site/pack/manual/start/
        rm -rf coc.nvim
}
uninstallRepo


downloadRepo

function checkRepo()
{
	echo "checking repos installed"
}
checkRepo
