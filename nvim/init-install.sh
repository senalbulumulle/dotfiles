## init-install.sh



function downloadRepo()
{
	mkdir -p /Users/$USER/.local/share/nvim
	cd /Users/$USER/.local/share/nvim
        git clone https://github.com/stevearc/aerial.nvim
        git clone https://github.com/rcarriga/nvim-dap-ui
        git clone https://github.com/folke/which-key.nvim
}
downloadRepo



function checkRepo()
{

	echo "checking repos installed"
}
checkRepo
