autoload -U compinit promptinit
compinit
promptinit

export LANG=ja_JP.UTF-8

autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=10000

# setopt
setopt hist_ignore_dups
setopt nonomatch

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# aliase
alias ls='ls -v -F --color=auto'
alias ll='ls -al'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias open='xdg-open'
alias emacs='emacs -nw'
alias guvpn='sudo openconnect -u t160d006 --juniper https://vpn.gunma-u.ac.jp'

# vcs_info
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# zsh-syntax-hilighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
