# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Settings for oh-my-zsh python plugin
export PYTHON_VENV_NAME=".venv"
export PYTHON_AUTO_VRUN=true
export BAT_THEME="tokyonight_night"

# Location of the config file (for lazygit)
export XDG_CONFIG_HOME="$HOME/.config"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Default editor
EDITOR="nvim"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Plugins
plugins=(git gh docker web-search history macos python dirhistory zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.openai_key.zsh"

# Aliases
alias ls="eza"
alias fzfn='nvim $(fzf -m --preview="bat --color=always {}")'
alias neofetch="fastfetch"

eval "$(github-copilot-cli alias -- "$0")"
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias dotfiles='/usr/bin/git --git-dir=/Users/evillian/.dotfiles/ --work-tree=/Users/evillian'
alias dotfiles='/usr/bin/git --git-dir=/Users/evillian/.dotfiles/ --work-tree=/Users/evillian'
alias dotfiles='/usr/bin/git --git-dir=/Users/evillian/.dotfiles/ --work-tree=/Users/evillian'
alias dotfiles='/usr/bin/git --git-dir=/Users/evillian/.dotfiles/ --work-tree=/Users/evillian'
alias dotfiles='/usr/bin/git --git-dir=/Users/evillian/.dotfiles/ --work-tree=/Users/evillian'
