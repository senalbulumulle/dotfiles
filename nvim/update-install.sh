## init-install.sh



function downloadRepo()
{
	cd /Users/$USER/.local/share/nvim/site/pack/manual/start/
	cd aerial.nvim && git pull && cd ../
	cd nui.nvim && git pull && cd ../
	cd nvim-dap-ui && git pull && cd ../
	cd telescope.nvim && git pull && cd ../
	cd which-key.nvim && git pull && cd ../
	rm -rf peek.nvim
}

downloadRepo



function checkRepo()
{

	echo "repos are updated"
}
checkRepo
