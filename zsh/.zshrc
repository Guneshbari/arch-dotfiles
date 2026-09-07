# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --------------------------------------------------
# Omarchy Zsh
# --------------------------------------------------

[[ -f /usr/share/omarchy-zsh/shell/zoptions ]] && \
    source /usr/share/omarchy-zsh/shell/zoptions

[[ -f /usr/share/omarchy-zsh/shell/all ]] && \
    source /usr/share/omarchy-zsh/shell/all

# --------------------------------------------------
# Personal configuration
# --------------------------------------------------

# NVM
export NVM_DIR="$HOME/.config/nvm"

[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Automatic .nvmrc handling
autoload -U add-zsh-hook

load-nvmrc() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
        nvm use
    fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Node project helper
newnode() {
    cp -r "$HOME/Templates/node-ts" "$1"
    cd "$1" || return
    nvm use
    pnpm install
    git init
}
