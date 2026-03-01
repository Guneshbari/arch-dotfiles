# 🪟 Hyprland Configuration — Omarchy

> **Note**: This config is for the **Omarchy** (dual-boot) setup only. Hyprland does not work in WSL2.

## Overview

This is a [Hyprland](https://hyprland.org/) configuration built on top of [Omarchy](https://omarchy.dev/) defaults. The main `hyprland.conf` sources Omarchy's base config first, then applies our custom overrides.

## Installation

```bash
# Symlink the entire hypr directory
ln -sf ~/dotfiles/omarchy-dotfiles/hypr/* ~/.config/hypr/
```

## File Structure

| File              | Purpose                                                      |
| ----------------- | ------------------------------------------------------------ |
| `hyprland.conf`   | Main config — sources Omarchy defaults then custom overrides |
| `bindings.conf`   | Custom app keybindings                                       |
| `monitors.conf`   | Monitor resolution and scaling                               |
| `input.conf`      | Keyboard, mouse, touchpad settings                           |
| `looknfeel.conf`  | Gaps, borders, rounding, layout                              |
| `autostart.conf`  | Apps to launch on login                                      |
| `envs.conf`       | Extra environment variables                                  |
| `hypridle.conf`   | Idle timeouts (screensaver, lock, screen off)                |
| `hyprlock.conf`   | Lock screen appearance                                       |
| `hyprsunset.conf` | Night light / blue light filter                              |
| `xdph.conf`       | XDG Desktop Portal (screen sharing)                          |
| `shaders/`        | 138 screen shaders for visual effects                        |

## Key Bindings

### Application Launchers

| Keybind                | App                     |
| ---------------------- | ----------------------- |
| `Super + Return`       | Terminal                |
| `Super + Alt + Return` | Terminal with Tmux      |
| `Super + B`            | Browser                 |
| `Super + Shift + B`    | Browser (private)       |
| `Super + N`            | Editor (Neovim)         |
| `Super + Shift + F`    | File Manager (Nautilus) |
| `Super + Q`            | Close window            |
| `Super + D`            | Docker (lazydocker TUI) |
| `Super + Shift + T`    | System monitor (btop)   |
| `Super + Shift + V`    | VS Code                 |
| `Super + /`            | 1Password               |

### Web Apps

| Keybind             | App                |
| ------------------- | ------------------ |
| `Super + A`         | ChatGPT            |
| `Super + Shift + A` | Claude AI          |
| `Super + M`         | Spotify            |
| `Super + Y`         | YouTube            |
| `Super + C`         | Google Calendar    |
| `Super + Shift + E` | Gmail              |
| `Super + Shift + W` | WhatsApp           |
| `Super + Shift + G` | GitHub             |
| `Super + X`         | NxtWave (learning) |
| `Super + O`         | Obsidian           |

## Monitor Setup

Current configuration:

```
monitor = eDP-2, 1920x1200@165, auto, 1.25
```

To change your monitor settings:

```bash
# List available monitors
hyprctl monitors

# Edit the config
nvim ~/.config/hypr/monitors.conf
```

### Common Monitor Configs

```conf
# 1080p/1440p (no scaling)
monitor = ,preferred,auto,1

# 4K 27"/32" (fractional)
monitor = ,preferred,auto,1.666667

# Retina-class 2x
monitor = ,preferred,auto,2
```

## Idle/Lock Behavior

| Timer        | Action                      |
| ------------ | --------------------------- |
| 2.5 min      | Start screensaver           |
| 2.5 min + 1s | Lock screen                 |
| 5.5 min      | Turn off keyboard backlight |
| 5.5 min      | Turn off screen             |

Screen and keyboard backlight restore automatically on activity.

## Night Light

Night light is disabled by default. To enable:

```conf
# In hyprsunset.conf, uncomment:
profile {
    time = 20:00
    temperature = 4000
}
```

## NVIDIA Settings

The config includes NVIDIA-specific env vars in `hyprland.conf`:

```conf
env = NVD_BACKEND,direct
env = LIBVA_DRIVER_NAME,nvidia
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
```

Remove these if you don't have an NVIDIA GPU.

## Shaders

The `shaders/` directory contains 138 visual effect shaders:

```bash
# List available shaders
ls ~/.config/hypr/shaders/

# Popular ones:
# cyberpunk-neon.glsl  - Neon glow effect
# night-vision.glsl   - Green night vision
# matrix-rain.glsl    - Matrix rain effect
# grayscale.glsl      - Grayscale mode
# reading-mode.glsl   - Warm reading light
```

## Customization Tips

```bash
# Quick edit
ehypr            # opens ~/.config/hypr/ in nvim
hyprconf         # opens hyprland.conf directly

# Check for errors
hyprctl monitors        # list monitors
hyprctl clients         # list windows
hyprctl dispatch dpms   # toggle screen
```
