# 🏗️ Arch Linux Dotfiles

<div align="center">

**Personal dotfiles for Arch Linux — dual-boot (Omarchy) & WSL2**

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=hyprland&logoColor=black)](https://hyprland.org/)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Starship](https://img.shields.io/badge/Starship-DD0B78?style=for-the-badge&logo=starship&logoColor=white)](https://starship.rs/)

</div>

---

## 📋 Overview

This repository contains my personal configuration files organized into **two independent setups**:

| Setup                   | Use Case                          | Desktop Environment                          |
| ----------------------- | --------------------------------- | -------------------------------------------- |
| **`omarchy-dotfiles/`** | Bare-metal Arch Linux (dual-boot) | Hyprland via [Omarchy](https://omarchy.dev/) |
| **`wsl2-dotfiles/`**    | WSL2 Arch Linux on Windows        | Terminal-only (no DE)                        |

Each folder is **self-contained** — just deploy the right one for your environment.

---

## 📁 Repository Structure

```
arch-dotfiles/
├── README.md
├── .gitignore
│
├── omarchy-dotfiles/              # Full desktop Arch Linux
│   ├── hypr/                      # Hyprland window manager
│   │   ├── hyprland.conf          # Main config (sources Omarchy defaults + overrides)
│   │   ├── bindings.conf          # Custom keybindings (apps, browser, etc.)
│   │   ├── monitors.conf          # Monitor setup (eDP-2 @ 165Hz)
│   │   ├── input.conf             # Keyboard & touchpad settings
│   │   ├── looknfeel.conf         # Gaps, borders, decorations
│   │   ├── autostart.conf         # Auto-start applications
│   │   ├── envs.conf              # Environment variables
│   │   ├── hypridle.conf          # Idle/lock timers
│   │   ├── hyprlock.conf          # Lock screen appearance
│   │   ├── hyprsunset.conf        # Night light settings
│   │   ├── xdph.conf              # XDG Desktop Portal config
│   │   └── shaders/               # 138 screen shaders
│   ├── nvim/                      # Neovim (LazyVim-based)
│   │   ├── init.lua
│   │   └── lua/
│   │       ├── config/            # Options, keymaps, autocmds
│   │       └── plugins/           # Custom plugin configs
│   ├── starship/                  # Starship prompt
│   │   └── starship.toml          # Catppuccin Mocha powerline theme
│   ├── tmux/                      # Tmux terminal multiplexer
│   │   └── .tmux.conf             # Full config with catppuccin status bar
│   ├── zsh/                       # ZSH shell
│   │   └── .zshrc                 # Aliases, functions, tool integrations
│   └── packages/                  # Package lists
│       ├── arch-packages.txt      # Official repo packages (216)
│       └── aur-packages.txt       # AUR packages
│
└── wsl2-dotfiles/                 # WSL2 Arch Linux (terminal-only)
    ├── nvim/                      # Same Neovim config
    ├── starship/                  # Same Starship config
    ├── tmux/                      # Tmux with clip.exe clipboard
    ├── zsh/                       # ZSH with WSL2 integrations
    └── packages/                  # Trimmed package list (no GUI)
```

---

## ✨ Features

### ZSH

- **Oh My Zsh** with 10 plugins (autosuggestions, syntax-highlighting, sudo, extract, etc.)
- **70+ aliases**: navigation, git, docker, pacman/yay, modern CLI tools
- **Tool integrations**: [zoxide](https://github.com/ajeetdsouza/zoxide) (smart cd), [fzf](https://github.com/junegunn/fzf) (fuzzy finder), [yazi](https://github.com/sxyazi/yazi) (file manager)
- **Modern replacements**: `ls→eza`, `cat→bat`, `grep→rg`, `find→fd`, `du→dust`
- **Utility functions**: `mkcd`, `take` (clone + cd), `portcheck`, `backup`, `cheatsheet`
- **WSL2 variant**: Windows clipboard (`pbcopy`/`pbpaste`), `wslview`, drive shortcuts

### Tmux

- **Catppuccin Mocha** status bar matching the Starship theme
- **Intuitive splits**: `prefix + |` (vertical), `prefix + -` (horizontal)
- **Vim-style pane navigation**: `h/j/k/l`
- **Session persistence**: auto-save/restore via `tmux-resurrect` + `tmux-continuum`
- **Alt+1-5** to quickly jump to windows
- **Auto TPM bootstrap** — plugins install themselves on first launch

### Starship

- **Catppuccin Mocha** powerline ribbon theme with Nerd Font icons
- **Language detection**: C, Rust, Go, Node.js, Python, PHP, Java, Kotlin, Haskell, Lua, Ruby, Terraform, Helm
- **Command duration** for commands > 2 seconds
- **Battery warning** when below 30%
- **Memory usage** when above 75%
- **Background jobs**, **sudo indicator**, **package version** display
- **Git branch & status** with clean symbols

### Hyprland (Omarchy only)

- Based on [Omarchy](https://omarchy.dev/) with custom overrides
- NVIDIA GPU environment variables
- Custom keybindings for apps (browser, editor, terminal, Docker, etc.)
- 138 screen shaders for visual effects
- HyprIdle + HyprLock for session management

### Neovim

- **LazyVim** distribution with custom plugins
- Auto-detect project root (`.git`, `package.json`, `pyproject.toml`, `go.mod`)
- Custom terminal keymaps, code runner, live-server, toggleterm
- Catppuccin theme with hot-reload support

---

## 📦 Prerequisites

### Both Environments

- [Arch Linux](https://archlinux.org/) with [yay](https://github.com/Jguer/yay) AUR helper
- [Oh My Zsh](https://ohmyz.sh/)
- [Nerd Font](https://www.nerdfonts.com/) (CaskaydiaMono or JetBrainsMono)

### Omarchy Only

- [Omarchy](https://omarchy.dev/) (Hyprland-based Arch distro)
- NVIDIA drivers (if applicable)

### WSL2 Only

- [ArchWSL](https://github.com/yuk7/ArchWSL) or similar WSL2 Arch setup
- [wslu](https://wslutiliti.es/) for Windows integration

---

## 🚀 Installation

### Omarchy (Dual-Boot)

```bash
# Clone the repo
git clone https://github.com/Guneshbari/arch-dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install packages
yay -S --needed - < omarchy-dotfiles/packages/arch-packages.txt
yay -S --needed - < omarchy-dotfiles/packages/aur-packages.txt

# Symlink configs
ln -sf ~/dotfiles/omarchy-dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/omarchy-dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/omarchy-dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/omarchy-dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/omarchy-dotfiles/hypr/* ~/.config/hypr/

# Reload
source ~/.zshrc
```

### WSL2

```bash
# Clone the repo
git clone https://github.com/Guneshbari/arch-dotfiles.git ~/dotfiles
cd ~/dotfiles

# Install packages
yay -S --needed - < wsl2-dotfiles/packages/arch-packages.txt
yay -S --needed - < wsl2-dotfiles/packages/aur-packages.txt

# Symlink configs
ln -sf ~/dotfiles/wsl2-dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/wsl2-dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/wsl2-dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/wsl2-dotfiles/nvim ~/.config/nvim

# Reload
source ~/.zshrc
```

> **Note**: Tmux plugins will auto-install on first launch via TPM.

---

## ⌨️ Key Bindings Quick Reference

### ZSH Aliases

| Alias    | Command                     | Description                |
| -------- | --------------------------- | -------------------------- |
| `gs`     | `git status`                | Git status                 |
| `gaa`    | `git add --all`             | Stage all changes          |
| `gcm`    | `git commit -m`             | Commit with message        |
| `gp`     | `git push`                  | Push to remote             |
| `glg`    | `git log --oneline --graph` | Pretty git log             |
| `update` | `yay -Syu --noconfirm`      | System update              |
| `ll`     | `eza -la --icons --git`     | Detailed file listing      |
| `dcup`   | `docker compose up -d`      | Start containers           |
| `lg`     | `lazygit`                   | Open LazyGit               |
| `mkcd`   | mkdir + cd                  | Create and enter directory |

### Tmux

| Keybind            | Action                     |
| ------------------ | -------------------------- |
| `prefix + \|`      | Vertical split             |
| `prefix + -`       | Horizontal split           |
| `prefix + h/j/k/l` | Navigate panes (vim-style) |
| `Shift + ←/→`      | Switch windows             |
| `Alt + 1-5`        | Jump to window N           |
| `prefix + r`       | Reload config              |
| `prefix + S`       | New named session          |

### Hyprland (Omarchy)

| Keybind             | Action                |
| ------------------- | --------------------- |
| `Super + Return`    | Terminal              |
| `Super + B`         | Browser               |
| `Super + N`         | Editor                |
| `Super + Q`         | Close window          |
| `Super + D`         | Docker (lazydocker)   |
| `Super + Shift + T` | System monitor (btop) |

---

## 🎨 Theme

All configs use the **Catppuccin Mocha** color palette for a consistent look across the terminal.

| Element        | Color     |
| -------------- | --------- |
| Background     | `#1e1e2e` |
| Foreground     | `#cdd6f4` |
| Accent (peach) | `#fab387` |
| Green          | `#a6e3a1` |
| Blue           | `#89b4fa` |
| Purple         | `#cba6f7` |

---

## 📝 License

This is a personal configuration repository. Feel free to fork and adapt it to your needs.
