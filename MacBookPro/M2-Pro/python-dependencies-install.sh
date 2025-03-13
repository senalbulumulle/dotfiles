## python-dependencies-install.sh

function install()
{
	pip3 install flask --break-system-packages
	pip3 install ollama-python --break-system-packages
	
}



function uninstall()
{
	## Nothing here
}
