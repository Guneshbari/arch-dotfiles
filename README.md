````markdown
# 🌌 Arch Linux Dotfiles

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-00AAEE?style=for-the-badge&logo=wayland&logoColor=white)](https://hyprland.org/)
[![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)
[![Tmux](https://img.shields.io/badge/tmux-1BB91F?style=for-the-badge&logo=tmux&logoColor=white)](https://github.com/tmux/tmux)
[![Starship](https://img.shields.io/badge/Starship-DD0B78?style=for-the-badge&logo=starship&logoColor=white)](https://starship.rs/)
[![Zsh](https://img.shields.io/badge/Zsh-F15A24?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.zsh.org/)
[![Theme](https://img.shields.io/badge/Theme-Catppuccin_Mocha-CBA6F7?style=for-the-badge)](https://github.com/catppuccin/catppuccin)

Personal Linux configuration managed as a clean, modular dotfiles repository.

Built around **Omarchy + Hyprland**, with a focused development environment using **Neovim, Tmux, Zsh, and Starship**.

The repository intentionally keeps package manifests minimal. Packages are added when they become part of the permanent setup rather than recording every package currently installed on the system.

---

## 📑 Contents

- [Overview](#-overview)
- [Repository Structure](#-repository-structure)
- [Hyprland](#-hyprland)
- [Neovim](#-neovim)
- [Tmux](#-tmux)
- [Zsh](#-zsh)
- [Starship](#-starship)
- [Fastfetch](#-fastfetch)
- [Packages](#-packages)
- [Installation](#-installation)
- [Philosophy](#-philosophy)

---

## ⚡ Overview

The configuration is intentionally modular:

| Component | Purpose |
|---|---|
| **Omarchy** | Base Arch Linux desktop environment |
| **Hyprland** | Wayland compositor |
| **Neovim** | Primary terminal editor |
| **Tmux** | Terminal multiplexer |
| **Zsh** | Interactive shell |
| **Starship** | Shell prompt |
| **Fastfetch** | System information fetcher with Predator emblem |
| **lazy.nvim** | Neovim plugin manager |
| **Catppuccin Mocha** | Visual theme |

The goal is not to reproduce the entire system package-for-package.

Instead, this repository contains the configuration that is worth version controlling and restoring.

---

## 📁 Repository Structure

```text
.
├── fastfetch/
│   ├── config.jsonc
│   ├── predator.txt
│   └── predator3d.py
│
├── hypr/
│   ├── autostart.lua
│   ├── bindings.lua
│   ├── hyprland.lua
│   ├── input.lua
│   ├── looknfeel.lua
│   └── monitors.lua
│
├── nvim/
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua/
│       └── config/
│           ├── init.lua
│           ├── lazy.lua
│           ├── remap.lua
│           ├── set.lua
│           └── plugins/
│
├── packages/
│   ├── arch-packages.txt
│   └── aur-packages.txt
│
├── starship/
│   └── starship.toml
│
├── tmux/
│   ├── .tmux.conf
│   └── which-key.json
│
├── zsh/
│   └── .zshrc
│
├── .gitignore
└── README.md
````

---

## 🪟 Hyprland

The Hyprland configuration is split into focused Lua modules instead of maintaining one large configuration file.

### Configuration

* `hyprland.lua` — main Hyprland configuration
* `autostart.lua` — startup applications and services
* `bindings.lua` — keyboard shortcuts
* `input.lua` — keyboard, mouse and touchpad settings
* `looknfeel.lua` — visual appearance and layout
* `monitors.lua` — monitor configuration

This keeps individual changes isolated and makes the configuration easier to maintain.

---

## 💻 Neovim

Neovim uses a custom modular configuration managed by `lazy.nvim`.

The configuration lives under the `config` Lua namespace.

```text
nvim/
├── init.lua
├── lazy-lock.json
└── lua/
    └── config/
        ├── init.lua
        ├── lazy.lua
        ├── remap.lua
        ├── set.lua
        └── plugins/
            ├── autopairs.lua
            ├── blink.lua
            ├── comment.lua
            ├── conform.lua
            ├── flash.lua
            ├── fugitive.lua
            ├── gitsigns.lua
            ├── harpoon.lua
            ├── lazygit.lua
            ├── lsp.lua
            ├── lualine.lua
            ├── mason.lua
            ├── mason-lspconfig.lua
            ├── oil.lua
            ├── surround.lua
            ├── telescope.lua
            ├── telescope-fzf.lua
            ├── todo-comments.lua
            ├── treesitter.lua
            ├── trouble.lua
            ├── undotree.lua
            ├── vim-tmux-navigator.lua
            └── which-key.lua
```

### Core Plugins

* `blink.cmp` — completion
* `nvim-lspconfig` — LSP
* `mason.nvim` — external tooling
* `nvim-treesitter` — syntax and AST features
* `telescope.nvim` — fuzzy finding
* `harpoon` — quick file navigation
* `flash.nvim` — motion and navigation
* `oil.nvim` — file management
* `gitsigns.nvim` — Git integration
* `lazygit.nvim` — LazyGit integration
* `conform.nvim` — formatting
* `trouble.nvim` — diagnostics
* `which-key.nvim` — keymap discovery
* `lualine.nvim` — statusline

Plugin versions are pinned through `lazy-lock.json`.

---

## 🪟 Tmux

Tmux provides the terminal workspace layer.

```text
tmux/
├── .tmux.conf
└── which-key.json
```

The configuration includes:

* Vim-style pane navigation
* Custom prefix configuration
* Pane splitting
* Window management
* Interactive which-key menu
* Neovim/Tmux navigation integration

The configuration is intentionally kept small and focused.

---

## 🐚 Zsh

The Zsh configuration is stored in:

```text
zsh/.zshrc
```

Current setup includes:

* Oh-My-Zsh
* `git` plugin
* `zsh-autosuggestions`
* `zsh-syntax-highlighting`
* Neovim as `$EDITOR`
* Starship prompt
* NVM
* Automatic `.nvmrc` handling
* Local binary path
* `newnode` project helper

### `.nvmrc` Handling

Entering a directory containing an `.nvmrc` automatically triggers:

```bash
nvm use
```

This keeps Node.js versions aligned with individual projects.

### Node Project Helper

The `newnode` helper creates a Node.js TypeScript project from the local template:

```bash
newnode <project-name>
```

It then:

1. Enters the project directory
2. Selects the appropriate Node.js version
3. Installs dependencies with pnpm
4. Initializes a Git repository

---

## 🚀 Starship

Starship provides the shell prompt.

Configuration:

```text
starship/starship.toml
```

The prompt uses **Catppuccin Mocha** and displays useful contextual information such as:

* Operating system
* Username
* Current directory
* Git branch and status
* Programming language versions
* Docker context
* Command duration
* Current time
* Battery state

The configuration is designed to provide useful information without overwhelming the terminal.

---

## 🏎️ Fastfetch

Fastfetch displays system information along with a custom Acer Predator emblem.

```text
fastfetch/
├── config.jsonc
├── predator.txt
└── predator3d.py
```

The configuration includes:

* Custom bilateral-symmetric half-block **Predator emblem** in signature cyan accent
* Structured **Hardware**, **Software**, and **Age / Uptime / Update** modules
* Integration with Omarchy theme and package version utilities

---

## 📦 Packages

Package manifests are intentionally minimal.

```text
packages/
├── arch-packages.txt
└── aur-packages.txt
```

They currently act as **personal package manifests**, not a complete dump of the installed system.

This is intentional.

Omarchy already provides a substantial base environment. Packages are added to these files only when they become intentional, permanent parts of this dotfiles setup.

### Official Repository Packages

```text
packages/arch-packages.txt
```

This file is reserved for packages from the official Arch repositories that are intentionally part of the personal setup.

### AUR Packages

```text
packages/aur-packages.txt
```

This file is reserved for AUR packages that are intentionally part of the personal setup.

### Adding a Package

When a new tool becomes a permanent part of the environment, add it to the appropriate manifest.

Do not add packages simply because they happen to be installed as dependencies or because they were installed by Omarchy.

---

## 🔗 Configuration Symlinks

The repository is designed to be linked into the standard configuration locations.

### Fastfetch

```bash
ln -sfn ~/dotfiles/fastfetch ~/.config/fastfetch
```

### Hyprland

```bash
ln -sfn ~/dotfiles/hypr ~/.config/hypr
```

### Neovim

```bash
ln -sfn ~/dotfiles/nvim ~/.config/nvim
```

### Starship

```bash
ln -sfn ~/dotfiles/starship/starship.toml ~/.config/starship.toml
```

### Tmux

```bash
ln -sfn ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config/tmux
ln -sfn ~/dotfiles/tmux/which-key.json ~/.config/tmux/which-key.json
```

### Zsh

```bash
ln -sfn ~/dotfiles/zsh/.zshrc ~/.zshrc
```

---

## 🚀 Installation

This repository assumes a fresh **Arch Linux / Omarchy** installation.

### 1. Clone the Repository

```bash
git clone https://github.com/Guneshbari/arch-dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Create Configuration Directory

```bash
mkdir -p ~/.config
```

### 3. Create Symlinks

```bash
ln -sfn ~/dotfiles/fastfetch ~/.config/fastfetch
ln -sfn ~/dotfiles/hypr ~/.config/hypr
ln -sfn ~/dotfiles/nvim ~/.config/nvim
ln -sfn ~/dotfiles/starship/starship.toml ~/.config/starship.toml

ln -sfn ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/tmux
ln -sfn ~/dotfiles/tmux/which-key.json ~/.config/tmux/which-key.json

ln -sfn ~/dotfiles/zsh/.zshrc ~/.zshrc
```

### 4. Restart Zsh

```bash
exec zsh
```

### 5. Start Neovim

```bash
nvim
```

`lazy.nvim` will bootstrap and install the configured plugins.

---

## 🔍 Verification

After linking the configuration, verify the important paths:

```bash
ls -ld ~/.config/fastfetch
ls -ld ~/.config/hypr
ls -ld ~/.config/nvim
ls -l ~/.config/starship.toml
ls -l ~/.tmux.conf
ls -l ~/.config/tmux/which-key.json
ls -l ~/.zshrc
```

All should point into:

```text
~/dotfiles/
```

### Check Neovim

```bash
XDG_CONFIG_HOME=~/dotfiles nvim --headless "+qa"
```

### Check Starship

```bash
starship --version
```

### Check Zsh

```bash
zsh -ic 'echo "Zsh $ZSH_VERSION"; echo "ZDOTDIR=$ZDOTDIR"'
```

---

## 🧹 Repository Maintenance

Before committing changes:

```bash
git status
git diff --check
```

Check for broken symlinks:

```bash
find . -xtype l -print
```

Check for temporary or runtime files:

```bash
find . -type f \
    \( -name '*.log' -o -name '*.tmp' -o -name '*.swp' -o -name '*~' \) \
    -not -path './.git/*' \
    -print
```

Check for stale configuration references:

```bash
grep -RniE 'trespasser|aether|shaders/|screen_shader' . \
    --exclude-dir=.git
```

The repository should contain only configuration that is actively used or intentionally documented.

---

## 🧠 Philosophy

### 1. Configuration over installation dumps

Do not blindly track every package installed on the system.

The package manifest should represent intentional software choices, not the complete output of:

```bash
pacman -Qqe
```

### 2. Start minimal

A fresh Omarchy installation already provides a working desktop environment.

There is no reason to immediately recreate every package from an old installation.

### 3. Install software when required

If a development project requires a new tool, install it when needed.

After determining that the tool is permanently useful, add it to the appropriate package manifest.

### 4. Keep configuration modular

Each subsystem should be easy to understand and modify independently.

### 5. Avoid unnecessary dependencies

Every additional package, plugin, or configuration layer adds maintenance cost.

Only keep things that provide real value.

### 6. Keep the repository reproducible

Anything that is genuinely part of the personal environment should eventually be represented here.

### 7. Prefer a clean rebuild over legacy baggage

Old configuration should not be carried forward simply because it existed on a previous installation.

If something is no longer used, remove it.

---

## 📜 License

This configuration is provided for personal use and experimentation.

```
```
