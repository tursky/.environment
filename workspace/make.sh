#!/bin/sh

# The script automates switching between XFCE themes and provides the ability
# to save the current state of custom user configs.

# Directive
echo '- set or save?'
read -p '- ' USER_INPUT
directive=$USER_INPUT

# Init
# workspace='.workspace'
# src='skel'

__dir=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)
system=`cat $__dir/config`
root='skel-cp'
global=$__dir/$root/global
glocal=$__dir/$root/glocal


# Remove custom environment settings 
function prepare() {
	if [[ $@ == 'workspace' ]]; then
		rm -rf $__dir/$root/global/.bashrc
		rm -rf $__dir/$root/glocal/$system
	fi

	if [[ $@ == 'home' ]]; then
		rm -rf ~/.bashrc \
			~/.themes \
			~/.config/xfce4 \
			~/.config/gtk-3.0 \
			~/.config/menus \
			~/.config/Kvantum \
			~/.config/Thunar \
			~/.config/manjaro \
			~/.config/autostart \
			~/.local/share/applications \
			~/.local/share/desktop-directories
	fi

	echo 'Preparing...'
}

# Run
if [[ $directive == 'set' ]]; then
	echo '- mac or win?' # working environment
	read -p '- ' USER_INPUT
	env=$USER_INPUT

	echo $env > $__dir/config
	
	# address=~/$workspace/$env/$src

	# destination=/home/$USER/
	# prepare $destination
    
	# cp -r $address/.bashrc ~/
	# cp -r $address/.config/xfce4 ~/.config
	# cp -r $address/.config/gtk-3.0 ~/.config
	# cp -r $address/.config/menus ~/.config
	# cp -r $address/.config/Kvantum ~/.config
	# cp -r $address/.config/Thunar ~/.config
	# cp -r $address/.config/manjaro ~/.config
	# cp -r $address/.config/autostart ~/.config
	# cp -r $address/.local/share/applications ~/.local/share
	# cp -r $address/.local/share/desktop-directories ~/.local/share
	# cp -r $address/.themes ~/

	# reboot
	echo 'Setting...'
fi

if [[ $directive == 'save' ]]; then
	echo $system
	prepare 'workspace'

	home=$( pwd )
	
	cp -r ~/.bashrc $global

	destination=$glocal/$system
	mkdir $destination && cd $destination

	cp -r ~/.themes .
	mkdir -p .config && cd .config
	cp -r ~/.config/{xfce4,gtk-3.0,menus,Kvantum,Thunar,manjaro,autostart} .
	cd .. && mkdir -p .local/share/ && cd .local/share/
	cp -r ~/.local/share/{applications,desktop-directories} .
	
	echo '- successfully'

	cd $home
	echo 'Saving...'
fi
