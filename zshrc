# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/palozano/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="spaceship"
#ZSH_THEME="bira"
ZSH_THEME="juanghurtado"
#ZSH_THEME="mh"

# To remove "(base)" from promt, run this: conda config --set changeps1 false

# Export 256 colors
#export TERM=xterm-256color

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         colored-man-pages
         zsh-autosuggestions
         zsh-syntax-highlighting
         #vi-mode
         #command-time
         #tmux
         )

source $ZSH/oh-my-zsh.sh

# Current time updated to include timestamp of command's start
#RPROMPT='[%D{%L:%M:%S %p}]'
#TMOUT=1
#TRAPALRM(){
#        zle reset-prompt
#}

# Conda-messing-up-the-hostname fix:
# Conda clobbers HOST, so save the real hostname in another variable.
HOSTNAME="$(hostname)"

precmd() {
    OLDHOST="${HOST}"
    HOST="${HOSTNAME}"
}
preexec() {
    HOST="${OLDHOST}"
}
# precmd runs right before the prompt is drawn
# preexec runs right after the user hits enter

# tmux plugin settings
# this always starts tmux
#ZSH_TMUX_AUTOSTART=true
#ZSH_TMUX_AUTOSTART_ONCE=true
#ZSH_TMUX_FIXTERM=true
#ZSH_TMUX_AUTOQUIT=false

# Launch/Connect to tmux
#if [ -z "$TMUX" ]
#then
#    tmux attach || tmux new
#fi

#if [ -z "$TMUX" ]
#then
#    tmux attach -t TMUX || tmux new -s TMUX
#fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"
# Editor
#alias vim="nvim"
alias vi="nvim"
# Listing files
alias ls="exa"
alias l="exa -hlaum --git"
alias ll="exa -hlum --git"
alias lr="exa -R"
alias lt="exa -T"
#unalias la
#unalias lsa
alias tsm="transmission-remote"

# Kitty kittens
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"


#ZSH_TMUX_AUTOSTART_ONCE="true"
#ZSH_TMUX_AUTOCONNECT="true"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/palozano/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/palozano/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/palozano/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/palozano/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# alias for Anaconda3
export PATH=~/anaconda3/bin:$PATH
#export=PATH=~/anaconda3/bin:$PATH

# open pycharm from anywhere
#export PATH=/opt/pycharm-2020.1/bin:$PATH

# Editor
export VISUAL=nvim
export EDITOR=nvim

# Find-in-file fuzzy finder
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Options for fuzzy finder
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --preview "head -100 {}"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

neofetch
