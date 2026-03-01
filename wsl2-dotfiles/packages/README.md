# 📦 Package Lists — WSL2

## Overview

These files contain packages for the WSL2 Arch Linux setup. This is a **trimmed list** focused on terminal tools — no Hyprland, GPU drivers, or desktop applications.

- **`arch-packages.txt`** — Official repo packages (terminal-only)
- **`aur-packages.txt`** — AUR packages (`wslu` for Windows integration)

## Install All Packages

```bash
# Official repo packages
yay -S --needed - < arch-packages.txt

# AUR packages
yay -S --needed - < aur-packages.txt
```

## Update Package Lists

```bash
# Official packages
pacman -Qqen > arch-packages.txt

# AUR packages
pacman -Qqem > aur-packages.txt
```

## What's Different from Omarchy

### Removed (not needed in WSL2)

- ❌ Hyprland, HyprIdle, HyprLock, HyprPicker, HyprSunset
- ❌ NVIDIA drivers and utils
- ❌ SDDM, Waybar, Walker, Mako, SwayBG
- ❌ PipeWire audio stack
- ❌ GUI apps (browser, Obsidian, VS Code, LibreOffice, etc.)
- ❌ Bluetooth, printing (CUPS), screen recording

### Added (WSL2-specific)

- ✅ `wslu` — WSL utilities (`wslview`, `wslpath`, etc.)
- ✅ `openssh` — SSH client/server

## Package Categories

### Core

`base`, `base-devel`, `bash-completion`

### Terminal Tools

`neovim`, `tmux`, `tmuxp`, `starship`, `zsh`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `bat`, `eza`, `fd`, `ripgrep`, `fzf`, `dust`, `btop`, `fastfetch`, `jq`, `yq`, `tree`, `tldr`, `less`, `wget`, `whois`

### Development

`git`, `git-lfs`, `github-cli`, `lazygit`, `docker`, `docker-compose`, `docker-buildx`, `lazydocker`, `clang`, `llvm`, `rust`, `ruby`, `jdk-openjdk`, `luarocks`, `mise`

### File Management

`yazi`, `7zip`, `unzip`, `ntfs-3g`

### Fonts

`ttf-cascadia-mono-nerd`, `ttf-jetbrains-mono-nerd`, `noto-fonts`, `noto-fonts-cjk`, `noto-fonts-emoji`, `noto-fonts-extra`

### WSL2 Integration

`wslu` (AUR) — provides `wslview` (open URLs/files in Windows), `wslpath`, and other WSL utilities
