# UNIX-like work environment

![Xfce console](/manjaro/xfce.png)

- Download OS: https://manjaro.org/
	- Manjaro XFCE
- Create a bootable USB
- Install:
	- swap (memory: [Do I Need Swap](https://wiki.manjaro.org/index.php/Swap))
	- boot (500 MiB)
	- /
	- home

---

## Table of Contents
1. [Installing programms](#installing-programms)
	- [Burn an ISO image](#burn-an-iso-image)
2. [Web surfing and chatting](#web-surfing-and-chatting)
	- [Telegram](#telegran)
	- [Chromium browser](#chromium-browser)
3. [Vendor package managers](#vendor-package-managers)
4. [Fonts](#fonts)
	- [IBM Plex Fonts](#ibm-plex-fonts)
	- [Microsoft Windows Fonts](#microsoft-windows-fonts)
	- [Mono Fonts by JetBrains](#mono-fonts-by-jetbrains)
	- [Fonts used with LaTeX](#fonts-used-with-latex)
5. [System processing, cleaning, updating](#system-processing-cleaning)
6. [Console environment](#console-environment)
	- [Neovim](#neovim)
	- [Tmux](#tmux)
	- [Bat](#bat)
	- [Alacritty](#alacritty)
	- [Midnight commander](#midnight-commander)
7. [SSH](#ssh)
8. [Programming](#programming)
	- [Rust](#rust)
	- [Deno](#deno)
	- [Node.js](#node.js)
	- [PHP](#php)
	- [Python](#python)
		- [Install using pyenv](#install-using-pyenv)
		- [Compiling from binaries](#compiling-from-binaries)
		- [Calculus libs etc](#calculus-libs-etc)
	- [Haskell](#haskell)
	- [Kotlin](#kotlin)
	- [Go](#go)
	- [Docker](#docker)
	- [PostgreSQL](#postgresql)
		- [DB setup](#db-setup)
		- [Installation pgAdmin](#installation-pgadmin)
9. [Code editors](#code-editors)
	- [VSCodium](#vscodium)
		- [Extensions set](#extensions-set)
		- [User settings](#settings)
	- [IntelliJ IDEA](#intellij-idea)
	- [PyCharm](#pycharm)
	- [Code::Blocks](#codeblocks)
10. [Engineering](#engineering)
	- [LaTeX](#latex)
		- [TexStudio](#texstudio)
		- [VSCode as Tex-editor](#vscode-as-tex-editor)
	- [FreeCAD](#freecad)
	- [KiCad](#kicad)
	- [Scilab](#scilab)
	- [Octave](#octave)
	- [Drawio](#drawio)
	- [Inkscape](#inkscape)
	- [VirtualBox](#virtualbox)
11. [Office environment](#office-environment)
	- [LibreOffice](#libreoffice)
	- [Xreader](#xreader)
	- [FBReader](#fbreader)
	- [Offline dictionaries](#offline-dictionaries)
		- [StarDict](#stardict)
		- [GoldenDict](#goldendict)
12. [Desktop applications](#desktop-applications)
	- [Movie editor](#movie-editor)
	- [Audio player](#audio-player)
	- [Image viewer](#image-viewer)
	- [Desktop streaming](#desktop-streaming)
	- [Key streaming](#key-streaming)
	- [Guitar tuner](#guitar-tuner)
	- [Screenshot utility](#screenshot-utility)
	- [Tex Match](#tex-match)

---

# Installing programms

Update environment:

```
sudo pacman -Syu
```

Install, remove, find package:

```
sudo pacman -S package
sudo pacman -Ss package
sudo pacman -R package
sudo pacman -Rs package
```

Install package to build from source, AUR etc.:

```
sudo pacman -S base-devel
```

## Burn an ISO image

List of mounted partitions:

```
sudo fdisk -l
```

Type the command to write the OS image, where `/sdc` is the target flash drive:

```
sudo dd bs=4M if=/home/manjaro/Downloads/manjaro.iso of=/dev/sdc status=progress oflag=sync
```

---

# Web surfing and chatting

## Telegram
```
sudo pacman -S telegram-desktop
```

## Chromium browser
```
sudo pacman -S chromium
```

---

# Vendor package managers

Add/remove software using `yay`, `snapd` and `pamac`:

```
sudo pacman -S yay snapd
```

```
sudo ln -s /var/lib/snapd/snap /snap
```

Usage `pamac`:

```
pamac search
pamac build
pamac remove
pamac list
```

Usage `yay`:

```
yay -S package
yay -Rns package
yay -Syu
yay package
```

Usage `snapd`:

```
sudo snap install package
sudo snap remove package
snap find package
snap list
sudo snap refresh
sudo snap refresh <application>
```

---

# Fonts

## IBM Plex Fonts

```
pamac install otf-ibm-plex
```

## Microsoft Windows Fonts

Times New Roman etc:
```
pamac install ttf-ms-fonts
```

## Mono Fonts by JetBrains:

```
sudo pacman -S ttf-jetbrains-mono
```

## Fonts used with LaTeX:

```
sudo pacman -S gnu-free-fonts
```

```
pamac install otf-xits
```

---

# System processing, cleaning, updating
Use `htop` in terminal or `kill PID` to manage running processes:

![Console administration](/manjaro/htop.png)

## Cleaning

List packages:

```
ls /var/cache/pacman/pkg/ | less
```

Remove all pkg except those installed:

```
sudo pacman -Sc
``` 

Remove all files from pkg cache:

```
sudo pacman -Scc
```

## System update

```
sudo pacman -Syu
```

To disable system updates, go to `Add/Remove Software` >> `Preferences` and toggle off the `Check for updates`.

---

# Console environment

Terminal command line setup:

```
echo "export PS1='\[\033[01;32m\][\u\[\033[01;37m\] \W\[\033[01;32m\]]#\[\033[00m\] '" >> ~/.bashrc
```

![Xfce console](/manjaro/terminal.png)

### Neovim

Vim-based text editor:

```
sudo pacman -S neovim
```

Install clipboard provider:

```
sudo pacman -S xclip
```

Settings:

```
mkdir ~/.config/nvim
```

```
touch ~/.config/nvim/init.vim
```

```
echo "set clipboard=unnamedplus" >> ~/.config/nvim/init.vim
```

### Tmux

Terminal multiplexor:

```
sudo pacman -S tmux
```

Set up:

```
mkdir ~/.config/tmux
```

```
touch ~/.config/tmux/tmux.conf
```

```
echo "
set -g mouse on
" >> ~/.config/tmux/tmux.conf
```

Usage:
```
# Create a new session
tmux new-session

# Create a new session detached
tmux new-session -d

# Create a new session and name it
tmux new-session -s me

# Create a new named session and attach to it if one exists
tmux new-session -As me

# Add horizontal window
tmux split-window -vf

# Add vertical window
tmux split-window -hf

# Quit session
exit
```

![Tmux windows](/manjaro/tmux.png)

### Bat

Console code-preview utility:

```
sudo pacman -S bat
```

Usage:
```
bat file
```

### Alacritty

Terminal emulator:

```
sudo pacman -S alacritty
```

Set up:

```
mkdir ~/.config/alacritty
touch ~/.config/alacritty/alacritty.yml
```

### Midnight commander

Cross-platform file manager: 

```
sudo pacman -S mc
```

- Set default theme:
`mc >> F9 >> Option >> Apperance >>`
	- [x] modarin256-defbg

![Midnight commander](/manjaro/mc.png)

- To use **nvim** in **mc**:
`mc >> F9 >> Option >> Configuration >>`
	- [ ] use internal edit

```
echo "alias mcn='EDITOR=nvim mc'" >> ~/.bashrc
```

---

# SSH

Link: [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

Set up `git`:

```
git config --global user.name "Name Surname"
git config --global user.email operator@unix.git
git config --global init.defaultBranch main
```

Prepare `ssh` dir:

```
mkdir ~/.ssh && cd ~/.ssh && touch config
```

Example `config` with required configuration:

![SSH config](/manjaro/ssh.png)

```
echo "Host github.com
	IdentityFile ~/.ssh/github/id_ed25519" >> config
```

#### Follow step by step

Verify SSH:
```
eval "$(ssh-agent -s)"
```

Generate key:
```
ssh-keygen -t ed25519 -C "operator@unix.git"
```

Copy to clipboard, paste on Github:
```
cat id_ed25519.pub | xclip -selection clipboard
```

Move keys to directory:
```
sudo mkdir github && sudo mv id_ed25519 id_ed25519.pub github
```

Check connection:
```
ssh-add ~/.ssh/github/id_ed25519 && ssh -T git@github.com
```

---

# Programming

## Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
```
source "$HOME/.cargo/env" && rustc -V
```

## Deno

```
sudo pacman -S deno && deno upgrade
```

```
cargo install deno --locked
```

```
curl -fsSL https://deno.land/x/install/install.sh | sh
```

## Node.js

```
sudo pacman -S nodejs npm && node -v
```

```
# Package update utility
sudo npm install -g npm-check-updates
```

## PHP

```
sudo pacman -S php && php -v
```

## Python

### Install using pyenv

```
sudo pacman -S pyenv
```

Add commands to ~/.bashrc by executing the following directives:
```
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
```
```
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
```
```
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
```

If you have ~/.profile, ~/.bash_profile or ~/.bash_login, type this:
```
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
```
```
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
```
```
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
```

Restart your shell:
```
exec "$SHELL"
```

Usage:

```
pyenv install --list
pyenv install 3.11.2

pyenv global system
pyenv global 3.11.2

pyenv version
pyenv versions

pyenv exec python -m venv .venv
```

Upgrade pip:

```
pip install --upgrade pip
```

### Compiling from binaries

```
# Download
sudo wget https://www.python.org/ftp/python/3.11.3/Python-3.11.3.tgz
```

```
cd ~/Downloads
tar -xvf Python-3.11.3.tgz && mv Python-3.11.3 3.11.3 && cd 3.11.3

# Run configurations
./configure --prefix=/home/operator/.python/3.11.3 --enable-optimizations

# Make (numbers of cores)
make -j8

# Install
sudo make altinstall

# Add PATH
echo 'export PATH=/home/operator/.python/3.11.3/bin:$PATH' >> ~/.bashrc

# Update pip
pip3.11 install --upgrade pip
```

### Calculus libs etc

```
python3.11 -m pip install virtualenv numpy sympy pandas scipy matplotlib tensorflow jupyterlab vpython qiskit handcalcs pylint black black[jupyter] clang-format flask psycopg[binary] psycopg[pool] PyQt6
```

## Haskell

Compiler
```
sudo pacman -S ghc stack
```

Formatting tool
```
stack install hindent
```

Clash
```
sudo pacman -S clash-ghc
```

## Kotlin

```
sudo pacman -S kotlin && kotlin -version
```

## Go

```
sudo pacman -S go && go version
```

## Docker

```
sudo pacman -S docker
```

```
sudo systemctl start docker.service && sudo systemctl enable docker.service
```

Check:

```
sudo docker version
sudo docker info
```

Run Docker without root (reboot required):

```
sudo usermod -aG docker $USER
```

Hello world:

```
docker run hello-world
```

Docker compose:

```
sudo pacman -S docker-compose
# docker-compose -h
```

Usage:

```
# List
docker ps -a

# Removing
docker rm NAMES
docker rmi hello-world

# Monitoring
docker container ls
docker images
docker stats
docker network ls
```

# PostgreSQL

```
sudo pacman -S postgresql
```

## DB setup

Run as postgres user:

```
sudo su postgres -l
```

Init:

```
initdb --locale $LANG -E UTF8 -D '/var/lib/postgres/data/' && exit
```

Configure Systemd:

```
sudo systemctl start postgresql.service && sudo systemctl enable postgresql.service && sudo systemctl status postgresql
```

New password for postgres user:

```
sudo passwd postgres 
```

Run:

```
su - postgres
psql
```

Add a new db user (execute as postgres):

```
createuser --interactive -P
```

## Installation pgAdmin

Step 1: Make the essential catalogs

```
sudo mkdir /var/lib/pgadmin && sudo mkdir /var/log/pgadmin
```

Step 2: Change the owner

```
sudo chown $USER /var/lib/pgadmin && sudo chown $USER /var/log/pgadmin
```

Step 3: Create the Python-based virtual environment and activate the env

```
mkdir ~/.db && cd .db && python3 -m venv pgadmin4 && source pgadmin4/bin/activate
```

Step 4: Install pgAdmin4

```
pip install pgadmin4
```

Step 5: Navigate to the pgAdmin4 and start the pgAdmin4 service

```
cd pgadmin4 && pgadmin4
```

```
# Open the browser and login:
https://127.0.0.1:5050/

- Login: operator@unix.pg
- Password: pgadmin

# Click on «Add New Server»
- Name: Database Server

# Connection
Host name/address: localhost
Port:              5432
Maintenance db:    postgres
Username:          operator
```

Add directive to .bashrc:

```
echo 'function pg() {
    cd ~/.db/pgadmin4
    python3 -m venv pgadmin4
    source pgadmin4/bin/activate 
    pgadmin4
}' >> ~/.bashrc
```

---

# Code editors

## VSCodium

Enable AUR for VSCodium:

```
cat /etc/pamac.conf | grep EnableAUR && sudo sed -Ei '/EnableAUR/s/^#//' /etc/pamac.conf
```

Installing:

```
sudo pamac install vscodium-bin
```

### Extensions set

- GitHub Theme 
	- GitHub Dark Colorblind
- Markdown Preview Enhanced
- Live Server
- LaTeX Workshop

### User settings

```json
{
	"update.mode": "none",
	"files.eol": "\n",
	"editor.smoothScrolling": true,
	"workbench.startupEditor": "newUntitledFile",
	"files.defaultLanguage": "md",
	"editor.fontSize": 14,
	"terminal.integrated.fontSize": 14,
	"editor.lineHeight": 20,
	"editor.tabSize": 4,
	"editor.minimap.enabled": false,
	"breadcrumbs.enabled": false,
	"editor.folding": false,
	"editor.glyphMargin": false,
	"editor.parameterHints.enabled": false,
	"editor.hover.enabled": false, 
	"explorer.confirmDelete": false,
	"security.workspace.trust.enabled": false,
	"editor.insertSpaces": false,
	"editor.linkedEditing": true,
	"editor.renderWhitespace": "selection",
	"editor.unicodeHighlight.ambiguousCharacters": false,
	"explorer.decorations.badges": false,
	"explorer.decorations.colors": false,
	"workbench.editor.decorations.colors": false,
	"workbench.editor.decorations.badges": false,
	"window.zoomLevel": 2,
	"window.menuBarVisibility": "toggle"
}
```

## IntelliJ IDEA

```
sudo pacman -S intellij-idea-community-edition
```

Usage:

```
java --version
archlinux-java status
sudo archlinux-java set <target java package name>
sudo archlinux-java set java-19-jdk
```

## PyCharm

```
sudo pacman -S pycharm-community-edition
```

## Code::Blocks

```
pamac build codeblocks
```

---

# Engineering

## LaTeX

```
sudo pacman -S texlive-most
```

Formatting with `latexindent` requires some Perl libraries:

```
sudo pacman -S perl-yaml-tiny perl-file-homedir perl-unicode-linebreak
```

```
latexindent --vversion
```

Usage:

```
latexmk -xelatex -synctex=1 -outdir=build main.tex
```

### TexStudio

```
sudo pacman -S texstudio
```

### VSCode as Tex-editor

`XeLaTeX` settings for `LaTeX Workshop` extension:

```json
"latex-workshop.latex.autoBuild.run": "never",
"latex-workshop.latex.tools": [
	{ 
	"name": "latexmk",
	"command": "latexmk",
	"args": [
		"-xelatex",
		"-synctex=1",
		"-interaction=nonstopmode",
		"-file-line-error",
		"%DOC%"
		]
	}
]
```

## FreeCAD

```
sudo pacman -S freecad
```

## KiCad

```
sudo pacman -S kicad && sudo pacman -S --asdeps kicad-library kicad-library-3d
```

## Scilab

```
pamac build scilab-bin
```

It can also be built from source:

```
git clone https://aur.archlinux.org/scilab-bin.git && cd scilab-bin && makepkg -si
```

## Octave

Similar to `Matlab` application:

```
sudo pacman -S octave
```

## Drawio

```
pamac build drawio-desktop
```

## Inkscape

Including `Gimp`, for some technical graphical tasks this package may be needed:

```
pamac install inkscape
```

## VirtualBox

First, you need to install the packages virtualbox and linux*-virtualbox-host-modules. To list what kernels is installed use:

```
mhwd-kernel -li
```

The console will print itself the version of the kernel used by OS:

```
Currently running: 6.1.22-1-MANJARO (linux61)
The following kernels are installed in your system:
   * linux61
```

Install modules for your current kernel:

```
sudo pacman -S virtualbox linux61-virtualbox-host-modules
```

Adding the `vbox` module to your kernel: just reboot OS. To run VirtualBox immediately, type the following command:

``` 
sudo vboxreload && vboxmanage --version
```

---

# Office environment

## LibreOffice

The pre-installed `ONLYOFFICE` is more than enough, but for better compatibility with the outside world, it makes sense to install an alternative `office` just in case.

```
sudo pacman -S libreoffice-fresh
```

## Xreader

The pre-installed in `xfce` PDF viewer is not bad (or the built-in features of the browser), but for one reason or another, the author prefers an otherwise package:

- Xreader, compact viewer:

```
sudo pacman -S xreader
```

- Optionally:

```
sudo pacman -S okular
```

## FBReader

To read books in `.fb2` or `.epub` extenstions:

```
sudo pacman -S fbreader
```

## Offline dictionaries

### StarDict
`sdcv` as a console translator:

```
sudo pacman -S sdcv
```

Create catalogs for your vocabularies:

```
sudo mkdir /usr/share/stardict && sudo mkdir /usr/share/stardict/dic
```

Copy/paste unpacked dicts:

```
sudo tar -xvjf yourdict.tar.bz2 -C /usr/share/stardict/dic
```

Usage:

```
sdcv cybernetics
```

![Console translator](/manjaro/sdcv.png)

```
echo 'function slovo() {
	clear & sdcv "$@" --color
}' >> ~/.bashrc

slovo sun
```

### GoldenDict

GUI Dictionary

```
pamac build goldendict-git
```

Repeat the steps as above to unpack the voice-over dictionary, for example:

```
sudo mkdir /usr/share/goldendict/dic
```

```
sudo unzip WAV-dict.zip -d /usr/share/goldendict/dic
```

---

# Desktop applications

In ordinary scenarios, there is no direct need for these applications, but still.

## Movie editor

```
sudo pacman -S openshot
```

## Audio player

```
pamac install audacious
```

## Image viewer

```
pamac install ristretto
```

## Desktop streaming

```
sudo pacman -S vokoscreen
```

## Key streaming

```
sudo pacman -S screenkey
```

## Guitar tuner

```
pamac build lingot
```

## Screenshot utility

```
sudo pacman -S flameshot
```

## Tex Match

Tex symbols handbook based on AI tricks:

```
pamac build tex-match
```

Installing using snapd:

```
sudo snap install tex-match
```

---

# Testing machine: IBM T61p

![Manjaro screenfetch](/manjaro/screenfetch.png)

---

# EOF