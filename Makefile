export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/usr/bin/core_perl

init : ## Initial deploy dotfiles
  ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
  ln -vsf ${PWD}/.latexmkrc ${HOME}/.latexmkrc
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	ln -vsf ${PWD}/.xprofile ${HOME}/.xprofile
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc

urxvt: ## Init rxvt-unicode terminal
  sudo pacman -S rxvt-unicode urxvt-perls
  ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources

xterm: ## Init xterm terminal
  sudo pacman -S xterm
  ln -vsf ${PWD}/.Xresources ${HOME}/.Xresources

neovim: ## Init neovim
  sudo pacman -S neovim
  mkdir -p ${PWD}.config/nvim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/installer.sh
  bash ${HOME}/.config/nvim/installer.sh ${HOME}/.config/nvim

