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
setopt correct
setopt re_match_pcre
setopt prompt_subst

# disable
disable r

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# path
export PATH=${HOME}/usr/bin:$PATH

# aliase
alias ls='ls -v -F --color=auto'
alias ll='ls -al'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias open='xdg-open'
alias emacs='emacs -nw'
alias r='R'

# prompt
PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
PROMPT2='[%n]> '
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "

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

# stack
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

# termite
source /etc/profile.d/vte.sh

# zsh-syntax-hilighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
