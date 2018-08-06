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

bindkey -e # Use emacs key bindings

alias tsm="transmission-remote"
alias mypackages="expac '%n %p' | grep 'Chris Dempewolf' | column -t"
alias rgrep='grep -Rn'
alias rzsh="source $HOME/.zshrc"
alias findf="find . -type f -name"
alias findd="find . -type d -name"
alias sl=ls
alias lsa='ls -a --color'
alias lsal='ls -al --color'
alias ls='ls --color'
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
#setopt correctall             # Autocorrect errors

# Autocompletion
autoload -Uz compinit
compinit

# autocompletion styling
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings'     format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:default'      list-colors ${(s.:.)LS_COLORS}

# Enable Fish-like syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Enable Fish-like autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable Fish-like history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
