## init-install.sh



function downloadRepo()
{
	mkdir -p /Users/$USER/.local/share/nvim/site/pack/manual/start/
	cd /Users/$USER/.local/share/nvim/site/pack/manual/start/
        git clone https://github.com/stevearc/aerial.nvim
        git clone https://github.com/rcarriga/nvim-dap-ui
        git clone https://github.com/folke/which-key.nvim
        git clone https://github.com/MunifTanjim/nui.nvim
        git clone https://github.com/nvim-telescope/telescope.nvim
        git clone https://github.com/MunifTanjim/nui.nvim
        git clone https://github.com/toppair/peek.nvim

}
downloadRepo



function checkRepo()
{

	echo "checking repos installed"
}
checkRepo
