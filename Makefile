export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/bin/core_perl

init : ## Initial deploy dotfiles
	ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
	ln -vsf ${PWD}/.latexmkrc ${HOME}/.latexmkrc
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.xprofile ${HOME}/.xprofile
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.zprofile ${HOME}/.zprofile

urxvt: ## Init rxvt-unicode terminal
	sudo pacman -S rxvt-unicode urxvt-perls
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources

xterm: ## Init xterm terminal
	sudo pacman -S xterm
	ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources

termite: ## Init termite terminal
	sudo pacman -S termite
	mkdir -p ${HOME}/.config/termite
	ln -vsf ${PWD}/.config/termite/config ${HOME}/.config/termite/config

neovim: ## Init neovim
	sudo pacman -S neovim
	mkdir -p ${HOME}/.config/nvim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/installer.sh
	# bash ${HOME}/.config/nvim/installer.sh ${HOME}/.config/nvim

vscode: ## Init visual-studio-code
	# yay -S visual-studio-code-bin
	ln -vsf ${PWD}/.config/Code/User/settings.json ${HOME}/.config/Code/User/settings.json
	code --install-extension $(cat ${PWD}/vscode/extension)

update: ## UPdate archlinux package
	yay -Syua; paccache -ruk0

backup: ## Backup archlinux package
	mkdir -p ${PWD}/archlinux
	pacman -Qqen > ${PWD}/archlinux/pacmanlist
	pacman -Qnq > ${PWD}/archlinux/allpacmanlist
	pacman -Qqem > ${PWD}/archlinux/yaylist

vscodebackup: ## backup vscode package
	mkdir -p ${PWD}/vscode
	code --list-extensions > ${PWD}/vscode/extensions

allinit: init

allinstall: urxvt xterm termite neovim

allupdate: update

allbackup: backup vscodebackup

all: allinit allinstall allbackup
