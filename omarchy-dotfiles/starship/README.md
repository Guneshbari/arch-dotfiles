# 🚀 Starship Prompt Configuration

## Installation

```bash
# Symlink to config directory
mkdir -p ~/.config
ln -sf ~/dotfiles/omarchy-dotfiles/starship/starship.toml ~/.config/starship.toml

# Make sure starship is installed
sudo pacman -S starship

# Add to .zshrc (already included in our config)
eval "$(starship init zsh)"
```

## Theme

Uses the **Catppuccin Mocha** color palette with a powerline-style ribbon layout.

## What Each Module Shows

The prompt is a two-line ribbon. Here's what each segment displays:

### Line 1 (left to right)

| Segment    | Color        | What It Shows                                 |
| ---------- | ------------ | --------------------------------------------- |
| OS Icon    | Dark         | Auto-detects your OS (Arch 󰣇, Ubuntu 󰕈, etc.) |
| Username   | Dark         | Your current user                             |
| Directory  | Peach        | Current path (truncated to 3 levels)          |
| Git Branch | Green        | Current branch name + status symbols          |
| Languages  | Teal         | Detected language + version (see below)       |
| Docker     | Blue         | Active Docker context                         |
| Sudo       | Blue         | 󰞀 indicator when sudo is cached               |
| Jobs       | Blue         | ✦ count of background jobs                    |
| Duration   | Purple       | 󱎫 command time (only if > 2 seconds)          |
| Time       | Purple       | Current time (HH:MM)                          |
| Battery    | After ribbon | Shows when battery < 50%                      |

### Line 2

| Symbol | Meaning                            |
| ------ | ---------------------------------- |
| ``     | Last command succeeded             |
| ``     | Last command failed                |
| ``     | Vim normal mode (if using vi-mode) |

## Supported Languages

The prompt auto-detects these languages when you're in a project directory:

| Language  | Symbol | Detected By                                  |
| --------- | ------ | -------------------------------------------- |
| C         | ` `    | `*.c`, `*.h` files                           |
| Rust      | ``     | `Cargo.toml`                                 |
| Go        | ``     | `go.mod`                                     |
| Node.js   | ``     | `package.json`                               |
| Python    | ``     | `*.py`, `pyproject.toml`, `requirements.txt` |
| PHP       | ``     | `composer.json`                              |
| Java      | ` `    | `pom.xml`, `*.java`                          |
| Kotlin    | ``     | `*.kt`                                       |
| Haskell   | ``     | `*.hs`, `stack.yaml`                         |
| Lua       | ``     | `*.lua`                                      |
| Ruby      | ``     | `Gemfile`, `*.rb`                            |
| Terraform | `󱁢`    | `*.tf`                                       |
| Helm      | `⎈`    | `Chart.yaml`                                 |

## Smart Directory Icons

Some directories get special icons:

| Directory | Icon |
| --------- | ---- |
| Documents | 󰈙    |
| Downloads |      |
| Music     | 󰝚    |
| Pictures  |      |
| Developer | 󰲋    |

## Battery Warnings

| Level | Display               |
| ----- | --------------------- |
| < 30% | 🔴 Red with 󰁻 icon    |
| < 50% | 🟡 Yellow with 󰁾 icon |
| > 50% | Hidden                |

## Memory Usage

Shows `󰍛` with RAM percentage **only when usage exceeds 75%**.

## Customization Tips

```bash
# Edit the config
estarship   # alias from .zshrc

# Change the color palette to Gruvbox
# In starship.toml, change:
palette = 'gruvbox_dark'

# Disable a module
[battery]
disabled = true

# Change command duration threshold
[cmd_duration]
min_time = 5_000   # show only for commands > 5 seconds
```
