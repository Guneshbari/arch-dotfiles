# ─────────────────────────────────────────────────────────────
#  ZSH Configuration — WSL2 (Arch Linux on Windows)
# ─────────────────────────────────────────────────────────────

# ── Oh My Zsh ──────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

plugins=(
  git                    # git aliases and functions
  zsh-autosuggestions    # fish-like autosuggestions
  zsh-syntax-highlighting # real-time syntax highlighting
  sudo                   # press Esc twice to prepend sudo
  extract                # universal archive extractor: extract <file>
  web-search             # search from terminal: google <query>
  copypath               # copy current path to clipboard
  dirhistory             # Alt+Left/Right to navigate dir history
  command-not-found      # suggest package when command not found
  jsontools              # pp_json, is_json, urlencode, urldecode
)

source $ZSH/oh-my-zsh.sh

# ── Environment ────────────────────────────────────────────
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# XDG Defaults
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# WSL2-specific: use Windows browser
export BROWSER="wslview"

# ── History ────────────────────────────────────────────────
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY       # add timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST # expire duplicates first
setopt HIST_IGNORE_DUPS       # ignore consecutive duplicates
setopt HIST_IGNORE_ALL_DUPS   # remove older duplicate entries
setopt HIST_IGNORE_SPACE      # ignore commands starting with space
setopt HIST_FIND_NO_DUPS      # no duplicates in search
setopt HIST_SAVE_NO_DUPS      # no duplicates when saving
setopt SHARE_HISTORY          # share history across sessions
setopt INC_APPEND_HISTORY     # add to history immediately

# ── Completion ─────────────────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # case-insensitive
zstyle ':completion:*' menu select                           # arrow-key menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"      # colored completions
zstyle ':completion:*' descriptions format '%F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
setopt AUTO_CD            # cd by just typing directory name
setopt AUTO_PUSHD         # push dirs onto stack automatically
setopt PUSHD_IGNORE_DUPS  # no duplicate dirs in stack
setopt CORRECT            # suggest correction for typos

# ── Navigation Aliases ─────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# ── Eza (modern ls) ───────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias la='eza -a --icons --group-directories-first'
alias lt='eza --tree --level=2 --icons'
alias lta='eza --tree --level=3 --icons -a'

# ── Modern Tool Replacements ──────────────────────────────
alias cat='bat --style=auto'
alias grep='rg'
alias find='fd'
alias du='dust'
alias top='btop'
alias df='df -h'
alias free='free -h'
alias diff='diff --color=auto'

# ── Git Aliases ────────────────────────────────────────────
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gd='git diff'
alias gds='git diff --staged'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gba='git branch -a'
alias glg='git log --oneline --graph --decorate -20'
alias gla='git log --oneline --graph --decorate --all -30'
alias gst='git stash'
alias gstp='git stash pop'
alias grb='git rebase'
alias grbi='git rebase -i'
alias gcp='git cherry-pick'
alias grs='git reset'
alias grsh='git reset --hard'
alias gcl='git clone'

# ── Docker Aliases ─────────────────────────────────────────
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dlog='docker logs -f'
alias dexe='docker exec -it'
alias dcp='docker compose'
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dclog='docker compose logs -f'
alias dcbuild='docker compose build'
alias dcrestart='docker compose restart'

# ── System (Pacman / Yay) ─────────────────────────────────
alias update='yay -Syu --noconfirm'
alias install='yay -S'
alias remove='yay -Rns'
alias search='yay -Ss'
alias pkginfo='yay -Qi'
alias cleanup='yay -Yc && sudo pacman -Sc --noconfirm'
alias orphans='pacman -Qdtq'
alias rmorphans='sudo pacman -Rns $(pacman -Qdtq) 2>/dev/null || echo "No orphans found"'

# ── Quick Config Edit ─────────────────────────────────────
alias ezsh='$EDITOR ~/.zshrc'
alias etmux='$EDITOR ~/.tmux.conf'
alias estarship='$EDITOR ~/.config/starship.toml'
alias envim='$EDITOR ~/.config/nvim/'
alias reload='source ~/.zshrc && echo "✓ ZSH config reloaded"'

# ── WSL2 Integrations ─────────────────────────────────────
# Clipboard (pbcopy/pbpaste style)
alias pbcopy='clip.exe'
alias pbpaste='powershell.exe -NoProfile -Command "Get-Clipboard" | tr -d "\r"'

# Open files/URLs with Windows default app
alias open='wslview'

# Windows drive shortcuts
alias cdwin='cd /mnt/c'
alias cdhome='cd /mnt/c/Users/$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d "\r")'
alias cddesk='cd /mnt/c/Users/$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d "\r")/Desktop'
alias cddown='cd /mnt/c/Users/$(cmd.exe /C "echo %USERNAME%" 2>/dev/null | tr -d "\r")/Downloads'

# Run Windows executables
alias explorer='explorer.exe'
alias notepad='notepad.exe'
alias code='code'

# ── Utility Aliases ────────────────────────────────────────
alias c='clear'
alias q='exit'
alias h='history | tail -30'
alias ports='ss -tulnp'
alias myip='curl -s ifconfig.me && echo'
alias weather='curl -s "wttr.in?format=3"'
alias sizeof='du -sh'
alias ff='fastfetch'
alias lg='lazygit'
alias ld='lazydocker'
alias y='yazi'

# ── Functions ──────────────────────────────────────────────

# mkdir + cd in one command
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# git clone + cd into the repo
take() {
  if [[ $1 =~ ^(https?|git)://* ]] || [[ $1 =~ .*\.git$ ]]; then
    git clone "$1" && cd "$(basename "$1" .git)"
  else
    mkcd "$1"
  fi
}

# check what's using a port
portcheck() {
  if [[ -z "$1" ]]; then
    echo "Usage: portcheck <port>"
    return 1
  fi
  ss -tulnp | grep ":$1 "
}

# quick backup of a file
backup() {
  cp "$1" "$1.bak.$(date +%Y%m%d_%H%M%S)"
}

# show a cheatsheet of custom aliases
cheatsheet() {
  echo "
  ╔══════════════════════════════════════════════════════════╗
  ║                   CUSTOM ALIASES                        ║
  ╠══════════════════════════════════════════════════════════╣
  ║  Navigation:  .., ..., ls, ll, la, lt                   ║
  ║  Git:         gs, ga, gaa, gc, gcm, gp, gpl, gd, glg   ║
  ║  Docker:      dps, dcup, dcdown, dclog, dexe            ║
  ║  System:      update, install, remove, search, cleanup  ║
  ║  Tools:       cat→bat, grep→rg, find→fd, du→dust       ║
  ║  Config:      ezsh, etmux, estarship, envim             ║
  ║  WSL2:        pbcopy, pbpaste, open, cdwin, cdhome      ║
  ║  Utils:       mkcd, take, portcheck, backup, ff, lg     ║
  ╚══════════════════════════════════════════════════════════╝
  "
}

# ── Tool Integrations ─────────────────────────────────────

# Zoxide (smart cd)
eval "$(zoxide init zsh)"

# FZF keybindings and completion
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --style=numbers --color=always {} 2>/dev/null || cat {}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"

# Yazi shell wrapper (cd into dir on exit)
function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ── Starship Prompt ────────────────────────────────────────
eval "$(starship init zsh)"
