## config-install-new.sh

## New Shell Script that uses if statements to find a linux distro
## and then automatically download dependencies and my configs. 

## Written by Senal Bulumulle


function Garuda() {
	
if lsb_release -a| grep Garuda
then 
	echo "it works"
fi

}


function Arch() {
if lsb_release -a| grep Arch
then 
	echo "it works"
fi	
}


function Debian() {
if lsb_release -a| grep Debian
then 
	echo "it works"
fi
}

function Fedora() {
if lsb_release -a| grep Fedora
then 
	echo "it works"
fi
}

function Pop() {
if lsb_release -a| grep Pop
then 
	echo "it works"
fi
}


function Kali() {
if lsb_release -a| grep Kali
then 
	echo "it works"
fi
}


function Ubuntu() {
if lsb_release -a| grep Ubuntu
then 
	echo "it works"
fi
}


Garuda
Arch
Debian
Fedora
Pop
Kali
Ubuntu
