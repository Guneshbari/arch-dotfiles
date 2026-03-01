# 📦 Package Lists — Omarchy

## Overview

These files contain all packages installed on the Omarchy (dual-boot) Arch Linux system.

- **`arch-packages.txt`** — Official Arch repository packages (216 packages)
- **`aur-packages.txt`** — AUR (Arch User Repository) packages (3 packages)

## Install All Packages

```bash
# Official repo packages
yay -S --needed - < arch-packages.txt

# AUR packages
yay -S --needed - < aur-packages.txt
```

The `--needed` flag skips already-installed packages.

## Update Package Lists

To regenerate these lists from your current system:

```bash
# Official packages only
pacman -Qqen > arch-packages.txt

# AUR packages only
pacman -Qqem > aur-packages.txt
```

## Package Categories

### Core System

`base`, `base-devel`, `linux`, `linux-firmware`, `linux-headers`, `intel-ucode`, `grub`, `efibootmgr`, `dosfstools`, `mtools`

### Desktop (Hyprland / Omarchy)

`hyprland`, `hypridle`, `hyprlock`, `hyprpicker`, `hyprsunset`, `sddm`, `waybar`, `walker`, `mako`, `swaybg`, `swayosd`, `polkit-gnome`

### GPU (NVIDIA)

`nvidia-open-dkms`, `nvidia-utils`, `lib32-nvidia-utils`, `libva-nvidia-driver`, `egl-wayland`

### Terminal Tools

`neovim`, `tmux`, `tmuxp`, `starship`, `zsh`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `bat`, `eza`, `fd`, `ripgrep`, `fzf`, `dust`, `btop`, `fastfetch`, `jq`, `yq`, `tree`, `tldr`, `less`, `wget`, `whois`

### Development

`git`, `git-lfs`, `github-cli`, `lazygit`, `docker`, `docker-compose`, `docker-buildx`, `lazydocker`, `clang`, `llvm`, `rust`, `ruby`, `jdk-openjdk`, `luarocks`, `mise`

### Applications

`zen-browser-bin`, `chromium`, `obsidian`, `visual-studio-code-bin`, `libreoffice-fresh`, `obs-studio`, `kdenlive`, `spotify`, `signal-desktop`, `localsend`, `mpv`, `pinta`, `evince`, `xournalpp`

### File Management

`nautilus`, `nautilus-open-any-terminal`, `yazi`, `gvfs-mtp`, `gvfs-nfs`, `gvfs-smb`, `ntfs-3g`, `exfatprogs`, `7zip`, `unzip`

### Audio

`pipewire`, `pipewire-alsa`, `pipewire-jack`, `pipewire-pulse`, `wireplumber`, `pamixer`, `playerctl`

### Networking

`iwd`, `inetutils`, `ethtool`, `ufw`, `ufw-docker`, `nss-mdns`

### Fonts

`ttf-cascadia-mono-nerd`, `ttf-jetbrains-mono-nerd`, `ttf-ia-writer`, `noto-fonts`, `noto-fonts-cjk`, `noto-fonts-emoji`, `noto-fonts-extra`, `woff2-font-awesome`
