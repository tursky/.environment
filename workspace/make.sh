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
		base=/home/$USER
		rm -rf $base/.bashrc \
			$base/.themes \
			$base/.config/xfce4 \
			$base/.config/gtk-3.0 \
			$base/.config/menus \
			$base/.config/Kvantum \
			$base/.config/Thunar \
			$base/.config/manjaro \
			$base/.config/autostart \
			$base/.local/share/applications \
			$base/.local/share/desktop-directories
	fi

	echo 'Preparing...'
}

# Run
if [[ $directive == 'set' ]]; then
	echo '- unix or windows?' # working environment
	read -p '- ' USER_INPUT
	env=$USER_INPUT

	if [[ $env != 'unix' ]] && [[ $env != 'windows' ]]; then
		echo '- Wrong data, please try again.' && exit 0
	fi

	prepare 'home'
    
	cp -r $global/.bashrc ~/
	cp -r $glocal/$env/.config/xfce4 ~/.config
	cp -r $glocal/$env/.config/gtk-3.0 ~/.config
	cp -r $glocal/$env/.config/menus ~/.config
	cp -r $glocal/$env/.config/Kvantum ~/.config
	cp -r $glocal/$env/.config/Thunar ~/.config
	cp -r $glocal/$env/.config/manjaro ~/.config
	cp -r $glocal/$env/.config/autostart ~/.config
	cp -r $glocal/$env/.local/share/applications ~/.local/share
	cp -r $glocal/$env/.local/share/desktop-directories ~/.local/share
	cp -r $glocal/$env/.themes ~/

	echo $env > $__dir/config

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
