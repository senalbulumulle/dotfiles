## python-dependencies-install.sh

function install() {
	pip3 install flask --break-system-packages
	pip3 install ollama --break-system-packages
	pip3 install pytest --break-system-packages
	
}
install


function uninstall() {
	echo "nothing here"
}
uninstall
