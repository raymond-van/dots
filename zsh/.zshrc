# /home/ray/code/lib/pfetch/pfetch

# onefetch https://github.com/o2sh/onefetch
# git repository greeter
# last_repository=
# check_directory_for_new_repository() {
 # current_repository=$(git rev-parse --show-toplevel 2> /dev/null)
 # if [ "$current_repository" ] && \
    # [ "$current_repository" != "$last_repository" ]; then
  # onefetch
 # fi
 # last_repository=$current_repository
# }
# cd() {
 # builtin cd "$@"
 # check_directory_for_new_repository
# }



# optional, greet also when opening shell directly in repository directory
# adds time to startup
#check_directory_for_new_repository

eval "$(zoxide init zsh)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
ZSH_THEME="powerlevel10k/powerlevel10k"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

###################################################
##################  ENV VARS  #####################
###################################################
# pfetch
PF_ASCII="Catppuccin"
# dots
DOTS="/home/ray/dots"
# ollama
OLLAMA_FLASH_ATTENTION=true
OLLAMA_NVIDIA_VISIBLE_DEVICES="all"
# OLLAMA_KV_CACHE_TYPE="q6"
CUDA_VISIBLE_DEVICES=0
#Environment="OLLAMA_KEEP_ALIVE=-1"
OLLAMA_MODELS="/home/ray/models/ollama"
PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig/openssl.pc"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
 fzf
 fzf-tab
 zsh-autosuggestions
 zsh-syntax-highlighting
 zsh-history-substring-search
 zsh-completions
 zsh-z
 autojump
 sudo
 web-search
 )


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder



source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
#
###############################################################
# MY CONFIGS
###############################################################

# Plugins
#
###############################################################
###############################################################

# Initialize compinit
autoload -U compinit
compinit


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ray/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
eval "$__conda_setup"
else
if [ -f "/home/ray/miniforge3/etc/profile.d/conda.sh" ]; then
. "/home/ray/miniforge3/etc/profile.d/conda.sh"
else
export PATH="/home/ray/miniforge3/bin:$PATH"
fi
fi
unset __conda_setup
if [ -f "/home/ray/miniforge3/etc/profile.d/mamba.sh" ]; then
. "/home/ray/miniforge3/etc/profile.d/mamba.sh"
fi
if [[ -n "$TMUX" ]] then
  export flavor='mamba'
  source $HOME/.tmux/plugins/tmux-conda-inherit/conda-inherit.sh
fi

# tmux-window-name() {
# 	($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
# }

# add-zsh-hook chpwd tmux-window-name

#yazi shell wrapper
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# 1. cd and then ls if the destination is a dir - including backwards with - 
# 2. Just cd to home if there is no destination 
# 3. $EDITOR <dest> if the destination is one or more files
function c() {
  if [[ $# -eq 1 && ( -d "$1" || "$1" == "-" ) ]]; then
    builtin cd "$1" && ls -bvxAF --color --group-directories-first
  elif [[ $# -eq 0 ]]; then
    builtin cd "$HOME" || return
  elif [[ -f "$1" || ! -e "$1" || $# -gt 1 ]]; then
    $EDITOR "$@"
  else
    printf "t: case not accounted for\n"
  fi
}


#export PATH="$PATH:/home/ray/.local/bin/Obsidian/"
#export PATH="$PATH:$HOME/bin"
#export PATH="$PATH:$HOME/Downloads/AppImages/"
#

# Enable fzf key bindings
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
#
# # Enable fzf auto-completion
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
#

# fzf-tab configurations
# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Force Zsh not to show the completion menu
zstyle ':completion:*' menu no
# Preview directory's content with eza when completing `cd`
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# Custom fzf flags
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# Make fzf-tab follow FZF_DEFAULT_OPTS
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# Switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# ALIASES
alias e=$EDITOR
alias tma="tmux a"
alias tmaa="tmux a -t"
alias tmn="tmux new -s"
alias tml="tmux ls"
alias tmk="tmux kill-session"
alias tmkk="tmux kill-session -t"
alias tmks="tmux kill-server"
alias tmd="tmux detach"
alias tms="tmux source-file ~/dots/tmux/.tmux.conf"
alias v="nvim"
alias nv="nvim"
alias vim="nvim"
alias upd="sudo apt update"
alias upg="sudo apt upgrade"
alias inst="sudo apt install"
alias instt="sudo apt -t bookworm-backports install"
alias fixinst="sudo apt --fix-broken install"
alias dpki="sudo dpkg -i"
alias l="eza"
alias ls="eza"
alias cl="clear"
alias clo="cd ~/.local/"
alias cco="cd ~/code/"
alias ccon="cd ~/.config/"
alias cdow="cd ~/Downloads"
alias cdoc="cd ~/Documents"
alias cva="cd ~/Documents/vaulty/"
alias cdo="cd $DOTS"
alias vzsh="nvim $DOTS/zsh/.zshrc"
alias szsh="source $DOTS/zsh/.zshrc"
alias v10="nvim $DOTS/p10k/.p10k.zsh"
alias vki="nvim $DOTS/kitty/.config/kitty/kitty.conf"
alias vi3="nvim $DOTS/i3/.config/i3/config"
alias vnv="nvim $DOTS/nvim/.config/nvim/init.lua"
alias vnvk="nvim $DOTS/nvim/.config/nvim/lua/user/keymaps.lua"
alias vnvft="nvim $DOTS/nvim/.config/nvim/lua/user/options.lua"
alias cnv="cd $DOTS/nvim/.config/nvim/"
alias cnvft="cd $DOTS/nvim/.config/nvim/after/ftplugin"
alias cnvover="cd /home/ray/dots/nvim/.config/nvim/lua/overseer/template/user/"
alias cnvu="cd $DOTS/nvim/.config/nvim/lua/user"
alias cnvp="cd $DOTS/nvim/.config/nvim/lua/plugins/"
alias cpb="cd $DOTS/polybar/.config/polybar/"
alias crf="cd $DOTS/rofi/.config/rofi/"
alias cya="cd $DOTS/yazi/.config/yazi/"
alias cohmy="cd $DOTS/oh-my-zsh/.oh-my-zsh/"
alias cde="cd ~/.local/share/applications"
alias mma='mamba activate'
alias mmab='mamba activate base'
alias mmc='mamba create -n'
alias mmcf='mamba env create -f'
alias mmcy='mamba create -y -n'
alias mmconf='mamba config'
alias mmcp='mamba create -y -p'
alias mmcss='mamba config --show-source'
alias mmd='mamba deactivate'
alias mmel='mamba env list'
alias mmi='mamba install'
alias mmiy='mamba install -y'
alias mml='mamba list'
alias mmle='mamba list --export'
alias mmles='mamba list --explicit > spec-file.txt'
alias mmr='mamba remove'
alias mmrn='mamba remove -y -all -n'
alias mmrp='mamba remove -y -all -p'
alias mmry='mamba remove -y'
alias mms='mamba search'
alias mmu='mamba update'
alias mmua='mamba update --all'
alias mmuc='mamba update conda'
alias gjust='just --justfile ~/dots/just/.config/just/justfile'
alias grep='rg'
alias pss='ps aux | grep'
alias kk='kill' 
alias py='python' 
# alias j=just
# if no autocomplete for just, uncomment below
# complete -F _just -o bashdefault -o default j


# Rust
. "$HOME/.cargo/env"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $DOTS/p10k/.p10k.zsh ]] || source $DOTS/p10k/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/ray/.cache/lm-studio/bin"
. "/home/ray/.deno/env"

# bun completions
[ -s "/home/ray/.bun/_bun" ] && source "/home/ray/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Open man pages with nvim
export MANPAGER='nvim +Man!'

# bindkey '^I'   autosuggest-accept # tab
bindkey '^[[Z' autosuggest-accept # shift + tab
# bindkey '^[[Z' complete-word # shift + tab
# # Open in tmux popup if on tmux, otherwise use --height mode
# export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border top'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# CUDA12
export PATH="/usr/local/cuda-12/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-12/lib64:$LD_LIBRARY_PATH"
