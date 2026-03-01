# ✏️ Neovim Configuration

## Installation

```bash
# Symlink nvim config directory
ln -sf ~/dotfiles/omarchy-dotfiles/nvim ~/.config/nvim
# (or wsl2-dotfiles/nvim for WSL2)

# Launch nvim — plugins will auto-install on first run
nvim
```

## Overview

This is a [LazyVim](https://www.lazyvim.org/) based configuration. LazyVim provides a full IDE experience out of the box with LSP, treesitter, telescope, and more. Our config adds custom options, keymaps, and plugins on top.

## Custom Configuration

### Options (`lua/config/options.lua`)

| Option           | Value   | Description                         |
| ---------------- | ------- | ----------------------------------- |
| `relativenumber` | `false` | Absolute line numbers               |
| `title`          | `true`  | Show project name in terminal title |

### Custom Keymaps (`lua/config/keymaps.lua`)

| Keybind     | Mode     | Action                             |
| ----------- | -------- | ---------------------------------- |
| `Esc`       | Terminal | Exit terminal mode                 |
| `<leader>t` | Normal   | Open terminal at bottom (15 lines) |

### Auto Commands (`lua/config/autocmds.lua`)

| Trigger      | Description                                                                               |
| ------------ | ----------------------------------------------------------------------------------------- |
| `BufEnter`   | Auto-detect project root (`.git`, `package.json`, `pyproject.toml`, `go.mod`) and set cwd |
| `DirChanged` | Update terminal title when changing directories                                           |

## Custom Plugins

| Plugin         | File              | Description                |
| -------------- | ----------------- | -------------------------- |
| Theme selector | `all-themes.lua`  | Multiple theme options     |
| Code Runner    | `code-runner.lua` | Run code from within nvim  |
| Express        | `express.lua`     | Express.js utilities       |
| Live Server    | `live-server.lua` | Browser live reload        |
| ToggleTerm     | `toggleterm.lua`  | Better terminal management |
| Vite           | `vite.lua`        | Vite.js integration        |

## Essential LazyVim Keybindings

These come from LazyVim and are available by default:

### General

| Keybind      | Action                   |
| ------------ | ------------------------ |
| `Space`      | Leader key               |
| `<leader>l`  | Lazy plugin manager      |
| `<leader>e`  | File explorer (neo-tree) |
| `<leader>ff` | Find files (Telescope)   |
| `<leader>fg` | Live grep (Telescope)    |
| `<leader>fb` | Find buffers             |
| `<leader>fh` | Find help tags           |

### Code/LSP

| Keybind      | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Go to references     |
| `K`          | Hover documentation  |
| `<leader>ca` | Code action          |
| `<leader>cr` | Rename symbol        |
| `<leader>cf` | Format document      |
| `]d` / `[d`  | Next/prev diagnostic |

### Windows & Buffers

| Keybind       | Action                   |
| ------------- | ------------------------ |
| `<C-h/j/k/l>` | Navigate between windows |
| `<leader>bd`  | Delete buffer            |
| `<leader>-`   | Horizontal split         |
| `<leader>\|`  | Vertical split           |
| `H` / `L`     | Prev/next buffer         |

### Git

| Keybind      | Action             |
| ------------ | ------------------ |
| `<leader>gg` | Open LazyGit       |
| `<leader>gf` | Git file history   |
| `]h` / `[h`  | Next/prev git hunk |

## Adding Plugins

Create a new file in `lua/plugins/`:

```lua
-- lua/plugins/my-plugin.lua
return {
  "author/plugin-name",
  opts = {
    -- plugin options
  },
}
```

Then restart nvim or run `:Lazy sync`.

## Plugin Management

```
:Lazy          # open plugin manager
:Lazy sync     # install/update all plugins
:Lazy health   # check plugin health
:Mason         # manage LSP servers, formatters, linters
```
