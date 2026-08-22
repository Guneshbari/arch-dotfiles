# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Starship is used instead.
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line if you want hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change the auto-update behavior.
# zstyle ':omz:update' mode disabled
# zstyle ':omz:update' mode auto
# zstyle ':omz:update' mode reminder

# Uncomment the following line to change how often to auto-update.
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line to disable marking untracked files dirty.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line to change the history timestamp format.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# Arch Linux packaged Zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------------------------------------------------
# User configuration
# --------------------------------------------------

export EDITOR="nvim"
export VISUAL="nvim"

# --------------------------------------------------
# Starship
# --------------------------------------------------

eval "$(starship init zsh)"

# --------------------------------------------------
# NVM
# --------------------------------------------------

export NVM_DIR="$HOME/.config/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# --------------------------------------------------
# Local binaries
# --------------------------------------------------

export PATH="$HOME/.local/bin:$PATH"

# --------------------------------------------------
# Automatic .nvmrc handling
# --------------------------------------------------

autoload -U add-zsh-hook

load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
        nvm use
    fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# --------------------------------------------------
# Node project helper
# --------------------------------------------------

newnode() {
    cp -r "$HOME/Templates/node-ts" "$1"
    cd "$1" || return
    nvm use
    pnpm install
    git init
}
