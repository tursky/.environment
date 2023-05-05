#!/bin/sh

# The script automates switching between XFCE themes and provides the ability
# to save the current state of custom user configs.

# Directive
echo '- set or save?'
read -p '- ' USER_INPUT
directive=$USER_INPUT

# Remove custom environment settings 
function prepare() {
	base=$@
	# rm -rf $base/.bashrc \
	#        $base/.themes \
	#        $base/.config/xfce4 \
	#        $base/.config/gtk-3.0 \
	#        $base/.config/menus \
	#        $base/.config/Kvantum \
	#        $base/.config/Thunar \
	#        $base/.config/manjaro \
	#        $base/.config/autostart \
	#        $base/.local/share/applications \
	#        $base/.local/share/desktop-directories

	echo 'Preparing...'
}

# Init
# workspace='.workspace'
# src='skel'

__dir=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)
system=`cat $__dir/config`

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
	# destination=$workspace/$ui/$src
	# prepare $destination

	# home=$( pwd )
	
	# mkdir -p $destination/.config && cd $destination
	
	# cp -r ~/.bashrc .
	# cp -r ~/.themes .

	# cd .config
	# cp -r ~/.config/{xfce4,gtk-3.0,menus,Kvantum,Thunar,manjaro,autostart} .
	
	# cd .. && mkdir -p .local/share/ && cd .local/share/
	# cp -r ~/.local/share/{applications,desktop-directories} .
	
	# echo '- successfully'

	# cd $home
	echo 'Saving...'
fi
