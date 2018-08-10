export WORKSPACE="$HOME/workspace"
export HISTFILE="$HOME/.zsh_history"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="$XDG_CONFIG_HOME:/etc:/etc/xdg"
export HISTSIZE=131072
export SAVEHIST=$HISTSIZE
export PROMPT='%F{green}%~%f %F{white}%#%f '
export RPROMPT='%F{white}[%f%(?.%F{green}%?%f.%F{red}%?%f)%F{white}]%f'
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.utf8
export TERM="rxvt-unicode-256color"
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"

bindkey -e # Use emacs key bindings

alias c='xclip; xclip -o | xclip -selection clipboard -i'
alias man=vman
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias bd='cd ..'
alias ls='ls --color'
alias l='ls -al'
alias sl=ls
alias lse='command ls -d *(/^F)' # list empty dirs
alias lsold='ls -rtlha'
alias lsnew='ls -tlha'
alias lssmall='ls -Srla'
alias lsbig='ls -Sla'
alias watch="watch -cd" # colorize that shit
alias vi="vim"
alias pm="pacman"
alias pms="pacman -Ss"
alias wh="which"
alias tsm="transmission-remote"
alias mypackages="expac '%n %p' | grep 'Chris Dempewolf' | column -t"
alias rgrep='grep -Rn'
alias rzsh="source $HOME/.zshrc"
alias findf="find . -type f -name"
alias findd="find . -type d -name"
alias tmuxa='tmux attach-session -t'
alias tmuxn='tmux new-session -s'
alias history='history -ED 0'
alias weather='curl wttr.in'

# Git aliases
alias GST="git status"
alias gst="git status"
alias branch="git branch | grep \* | awk {'print $2'}"
alias push="git push -u origin"
alias pull="git pull --rebase"
alias gclean='git checkout master; git pull --rebase; git branch -d $(git branch --merged)'
alias gitcon='vim $(git diff --name-only --diff-filter=U --raw | tail -1)'

url_decode () {
    ruby -e "require 'uri'; puts(URI.decode(\"$1\"))"
}

build_gem () {
    current_dir=$(pwd)
    cd $1; gem=$(bundle exec gem build *.gemspec | grep -i "file:" | awk {'print $2'})
    cp $1/$gem $2
    cd $2; gem install $gem
    cd $current_dir
}

wifi () {
    sudo ip link set wlp2s0 up
    sudo wpa_supplicant -B -i wlp2s0 -c /usr/share/doc/wpa_supplicant/send_nudes.cfg
    sudo dhcpcd
}

new_wifi () {
    
}

setopt BANG_HIST              # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY          # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
setopt HIST_BEEP              # Beep when accessing nonexistent history.
setopt COMPLETE_ALIASES       # Autocomplete aliases
setopt EXTENDED_GLOB
setopt auto_pushd             # Make cd push prev dir onto dir stack
setopt completeinword         
setopt hash_list_all          # Whenever a command completion is attempted, make sure the entire command path is hashed first.
setopt auto_cd                # If a command can't be evaluated, assume it's a dir
#setopt correctall             # Autocorrect errors

# Enable Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable Fish-like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable Fish-like history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# support colors in less
export LESS_TERMCAP_mb=$'\e[01;36m'
export LESS_TERMCAP_md=$'\e[01;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;102;30m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# Autocompletion
autoload -Uz compinit
compinit

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true
# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;34m%}%B%d%b%{\e[0m%}'

# automatically complete 'cd -<tab>' and 'cd -<ctrl-d>' with menu
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# insert all expansions for expand completer
zstyle ':completion:*:expand:*'        tag-order all-expansions
zstyle ':completion:*:history-words'   list false

# activate menu
zstyle ':completion:*:history-words'   menu yes

# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes

# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'

# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''

zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'

# describe options in full
zstyle ':completion:*:options'         description 'yes'

# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# provide verbose completion information
zstyle ':completion:*'                 verbose true

# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false


# define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'

# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin            \
                                           /usr/X11R6/bin

# provide .. as a completion
zstyle ':completion:*' special-dirs ..

# run rehash on completion so new installed program are found automatically:
_force_rehash() {
    (( CURRENT == 1 )) && rehash
    return 1
}

# caching
zstyle ':completion:*' use-cache yes
zstyle ':completion::complete:*' cache-path $XDG_CACHE_HOME/zsh

# Dirstack handling
DIRSTACKSIZE=${DIRSTACKSIZE:-20}
DIRSTACKFILE=${DIRSTACKFILE:-${ZDOTDIR:-${XDG_CACHE_HOME/}}/.zdirs}
