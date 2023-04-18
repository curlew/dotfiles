autoload -Uz vcs_info
zstyle ":vcs_info:git:*" enable git
zstyle ":vcs_info:git:*" formats "(%b)"
precmd() {vcs_info}

setopt prompt_subst
PROMPT="%B%F{blue}%~%f%(?. . %F{red}%?%f )%F{cyan}%#%f%b "
RPROMPT="%F{242}\$vcs_info_msg_0_ %B%!%b%f"

[ -r "$HOME/.dircolors" ] && eval $(dircolors -b $HOME/.dircolors)
alias ls="ls -F --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias g="git"

bindkey -e
bindkey "^[Oc" forward-word # ctrl+right
bindkey "^[Od" backward-word # ctrl+left

setopt histignorealldups sharehistory
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

unsetopt beep

autoload -Uz compinit
compinit

zstyle :compinstall filename "$HOME/.zshrc"
zstyle ":completion:*" auto-description "specify: %d"
zstyle ":completion:*" completer _expand _complete _correct _approximate
zstyle ":completion:*" format "Completing %d"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" menu select=2
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" list-colors ""
zstyle ":completion:*" list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ":completion:*" matcher-list "" "m:{a-z}={A-Z}" "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=* l:|=*"
zstyle ":completion:*" menu select=long
zstyle ":completion:*" select-prompt %SScrolling active: current selection at %p%s
zstyle ":completion:*" use-compctl false
zstyle ":completion:*" verbose true

zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
zstyle ":completion:*:kill:*" command "ps -u $USER -o pid,%cpu,tty,cputime,cmd"

[ -x "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
