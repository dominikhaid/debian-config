ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
source "$HOME/.pathrc"
export EDITOR=nvim


### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
bindkey -v
export TMPDIR="/tmp" 
#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/cog/lib/pkgconfig/
#export $(gnome-keyring-daemon --daemonize --start)
#if [ -n "$DESKTOP_SESSION" ];then
 #   eval $(gnome-keyring-daemon --start --components=ssh)
  #  export SSH_AUTH_SOCK
#fi

#if [ -z "$SSH_AUTH_SOCK" ] ; then
 #   eval `ssh-agent -s`
  #    ssh-add
#fi

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


EMOJI_CLI_KEYBIND=^a


source $HOME/antigen.zsh
source ~/dev/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
#antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle zdharma/zsh-startify
antigen bundle sinetoami/web-search
#antigen bundle changyuheng/zsh-interactive-cd
antigen bundle IngoMeyer441/zsh-easy-motion
#antigen bundle jeffreytse/zsh-vi-mode
#antigen bundle b4b4r07/emoji-cli
#antigen bundle luismayta/zsh-notify
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle leophys/zsh-plugin-fzf-finder
# Tell Antigen that you're done.
antigen apply


bindkey -M vicmd ' ' vi-easy-motion


ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6272A4'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[function]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[command]='fg=#50FA7B'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#50FA7B,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#FFB86C,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#FFB86C'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#FFB86C'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#BD93F9'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#8BE9FD'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#F1FA8C'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[path]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#FF79C6'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#BD93F9'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#FF5555'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#F8F8F2'
ZSH_HIGHLIGHT_STYLES[default]='fg=#F8F8F2'



DISABLE_MAGIC_FUNCTIONS=true
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
COMPLETION_WAITING_DOTS=true
DISABLE_UNTRACKED_FILES_DIRTY=true
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
autoload zmv
autoload zcalc
#plugins=( zsh-notify )


export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
export TERM="xterm-256color" # This sets up colors properly
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export HISTCONTROL=ignoreboth 	
export VISUAL=nvim

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
#alias vim='nvim'
#alias vi='nvim'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ls='exa -lha'
# general use
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias tree='exa --tree --level=2'
# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree
alias br='br -sdph'
alias mv='mv -i' 	
alias rm='rm -i' 	
alias cp='cp -i' 
#alias grep='rg'
#alias vifm='sudo vifm'
#alias vi='nvim'
#alias vim='nvim'
alias ps='procs'
# Colorize grep output (good for log files)
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cat='batcat'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=$HOME/.lynx/lynx.cfg -lss=$HOME/.lynx/lynx.lss -vikeys'

alias bo="br --conf ~/.config/broot/select.toml"

# git
#alias addup='git add -u'
#alias addall='git add .'
#alias branch='git branch'
#alias checkout='git checkout'
#alias clone='git clone'
#alias commit='git commit -m'
#alias fetch='git fetch'
#alias pull='git pull origin'
#alias push='git push origin'
#alias status='git status'
#alias tag='git tag'
#alias newtag='git tag -a'

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi


eval $(/usr/bin/gnome-keyring-daemon --start --components=secrets)
#if [ -n "$DESKTOP_SESSION" ];then
 #   eval $(gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
  #  export SSH_AUTH_SOCK
#fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"
#emulate sh -c 'source /etc/profile'
eval "$(starship init zsh)"
#fortune | cowsay -f $(find /usr/share/cowsay/cows  -printf "%f\n" | shuf -n 1)

set-wal() {
    wal -n -i "$HOME/Bilder/wallpaper"
    nitrogen --head=0 --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"
    nitrogen --head=1 --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"
    nitrogen --head=3 --set-zoom-fill "$(< "${HOME}/.cache/wal/wal")"
    qtile cmd-obj  -o cmd -f restart
}

# deep fuzzy cd
 dcd() {
    br --only-folders --cmd "$1;:cd"
}

zsh-startify
