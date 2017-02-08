# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export TERM='xterm-256color'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
export DISABLE_AUTO_TITLE="true"
export AUTO_TITLE=false
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  extract
  copydir
  copyfile
  docker
  docker-compose
  git
  git-flow
  history
  jsontools
)

# for copydir and copyfile to work
# sudo apt-get install xsel
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias c='clear'
alias open='xdg-open'
# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

# add some scripts
export PATH=$HOME/dotfiles/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# # For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use ctrl-e to edit current command in vim buffer, nice :)
# http://nuclearsquid.com/writings/edit-long-commands/
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# enable CTRL+s usage for vim
stty -ixon

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "\^H" backward-delete-word

# move history with alt+k | alt+j
bindkey "^[k" up-line-or-search
bindkey "^[j" down-line-or-search

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '\^i' expand-or-complete-prefix

if [ -f ~/.bash_aliases ]; then
     . ~/.bash_aliases
fi

case $- in *i*)
    if [ -z "$TMUX" ]; then exec tmux; fi;;
esac

if [ -f $HOME/.rvm/scripts/rvm ]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi

function simplify_dir {
    local PREFIX
    if [[ $PWD == "$HOME"* ]]; then
        PREFIX=${HOME%/}
        echo "${PWD##"$PREFIX/"}"
    else
        echo "$PWD"
    fi
}

settitle() {
  printf "\033k$1\033\\"
}
chpwd() {
  settitle "$(simplify_dir)"
}
precmd(){
  settitle "$(simplify_dir)"
}
preexec(){
  settitle "$(echo $1 | cut -d" " -f1)"
}
ssh() {
    settitle "$*"
    command ssh "$@"
}

# Paste x CLIPBOARD
function x-yank() {
  if [[ "$(uname)" == "Linux" ]]; then
    CUTBUFFER=$(xclip -o -selection clipboard)
  elif [[ "$(uname)" == "Darwin" ]] ; then
    CUTBUFFER=$(pbpaste)
  fi
  zle yank
}
zle -N x-yank

# Ctrl-v: Insert the contents of the clipboard at the cursor
bindkey '^v' x-yank

# Kill region goes to CLIPBOARD
function x-kill-region() {
  zle kill-region
  if [[ "$(uname)" == "Linux" ]]; then
    print -rn $CUTBUFFER | xclip -i -selection clipboard
  elif [[ "$(uname)" == "Darwin" ]] ; then
    print -rn $CUTBUFFER | pbcopy
  fi
}
zle -N x-kill-region

# Ctrl-o: Deletes everything after cursor
bindkey '^x' x-kill-region

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# rempate esc to capslock
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

# include z.sh
. ~/bin/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
