#
# ~/.zshrc
#
 
# emacslike
bindkey -e

 
# completion
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit
compinit
setopt correct
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# word-break
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "/=;@:{},|"
zstyle ':zle:*' word-style unspecified
 
# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
setopt auto_pushd
setopt pushd_ignore_dups

# others
setopt no_flow_control
setopt no_beep
 
# alias
alias ls='ls -FG'
alias ll='ls -alF'
alias la='ls -A'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias mkdir='mkdir -p'
alias -g G='| grep'
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g S='| sort'
alias -g W='| wc'
alias -g X='| xargs'
alias tsp='tmux new-session \; split-window -h -d'
alias tvsp='tmux new-session \; split-window -d'
alias mysql="mysql --auto-rehash"

source ~/.bash_profile
#alias tullys='ssh azusa.kikuchi@tullys.gaiax.com -A'
alias comet1='ssh azusa.kikuchi@10.10.10.170 -A'

## function
# cd -> cd + ls
function chpwd() {
  ls
}

# cd ../ -> Ctrl+^
function cdup() {
  echo
  cd ..
  ls
  zle reset-prompt
}
zle -N cdup
bindkey '^\^' cdup

# history -> Ctrl+r
function peco-select-history() {
    BUFFER=$(fc -l -n 1 | tail -r | peco --query "$LBUFFER" --prompt "HISTORY >")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N peco-select-history
bindkey "^r" peco-select-history

# peco ssh
function peco-ssh() {
    SSH=$(grep "^\s*Host " ~/.ssh/config | sed s/"[\s ]*Host "// | grep -v "^\*$" | sort | peco)
    if [ "$1" = "root" ]; then
        ssh 'root@'$SSH
    else
        ssh $SSH
    fi
}
alias ss="peco-ssh"
alias ssr="peco-ssh root"

# prompt
function ruby_version()
{
    if which rvm-prompt &> /dev/null; then
      rvm-prompt i v g
    else
      if which rbenv &> /dev/null; then
        rbenv version | sed -e "s/ (set.*$//"
      fi
    fi
}

function node_version()
{
  if which node &> /dev/null; then
    node -v | sed -e "s/ (set.*$//"
  fi
}

# prompt
autoload -U colors
PROMPT='[%n@%m]$ '
RPROMPT="[%d rb: $(ruby_version) node: $(node_version)]"
