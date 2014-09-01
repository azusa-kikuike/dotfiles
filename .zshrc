#
# ~/.zshrc
#
 
# prompt
autoload -U colors
#colors
PROMPT='[%n@%m]$ '
RPROMPT='[%d]'
 
# completion
autoload -U compinit
compinit
setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
 
# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups
 
# alias
alias ls='ls -FG'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g W='| wc'
alias -g X='| xargs'
alias tsp='tmux new-session \; split-window -h -d'
alias tvsp='tmux new-session \; split-window -d'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.bash_profile
