# 🖥️ Tmux Configuration — WSL2

## Installation

```bash
# Symlink to home directory
ln -sf ~/dotfiles/wsl2-dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Launch tmux — plugins will auto-install on first run
tmux
```

> TPM and all plugins will be **automatically installed** on first launch.

## Key Bindings

Prefix key: `Ctrl+b` (default) or `Ctrl+a` (alternative).

Format: `prefix + key` = press `Ctrl+b`, release, then press key.

### Pane Management

| Keybind       | Action                            |
| ------------- | --------------------------------- |
| `prefix + \|` | Split vertically (side by side)   |
| `prefix + -`  | Split horizontally (top/bottom)   |
| `prefix + h`  | Move to left pane                 |
| `prefix + j`  | Move to pane below                |
| `prefix + k`  | Move to pane above                |
| `prefix + l`  | Move to right pane                |
| `prefix + H`  | Resize pane left (repeatable)     |
| `prefix + J`  | Resize pane down (repeatable)     |
| `prefix + K`  | Resize pane up (repeatable)       |
| `prefix + L`  | Resize pane right (repeatable)    |
| `prefix + x`  | Close current pane (with confirm) |

### Window Management

| Keybind      | Action                            |
| ------------ | --------------------------------- |
| `prefix + c` | New window (in current directory) |
| `Shift + ←`  | Previous window                   |
| `Shift + →`  | Next window                       |
| `Alt + 1-5`  | Jump to window N                  |
| `prefix + ,` | Rename current window             |
| `prefix + &` | Close window (with confirm)       |

### Session Management

| Keybind      | Action                              |
| ------------ | ----------------------------------- |
| `prefix + S` | Create new named session            |
| `prefix + X` | Kill current session (with confirm) |
| `prefix + s` | List/switch sessions                |
| `prefix + d` | Detach from session                 |

### Copy Mode (Vi-style)

| Keybind      | Action                                                 |
| ------------ | ------------------------------------------------------ |
| `prefix + [` | Enter copy mode                                        |
| `v`          | Start selection                                        |
| `y`          | Copy selection to **Windows clipboard** via `clip.exe` |
| `q`          | Exit copy mode                                         |

Mouse selection also copies to Windows clipboard.

### Utility

| Keybind      | Action               |
| ------------ | -------------------- |
| `prefix + r` | Reload config        |
| `prefix + ?` | Show all keybindings |
| `prefix + z` | Toggle pane zoom     |

## WSL2 Clipboard

This config uses `clip.exe` for clipboard integration so your tmux copies go directly to **Windows clipboard**. You can paste with `Ctrl+V` in any Windows app.

## Plugins

| Plugin           | What It Does                                       |
| ---------------- | -------------------------------------------------- |
| `tmux-sensible`  | Sensible defaults                                  |
| `tmux-yank`      | Clipboard integration (uses `clip.exe`)            |
| `tmux-resurrect` | Save/restore sessions: `prefix + Ctrl+s/r`         |
| `tmux-continuum` | Auto-save every 15 minutes, auto-restore on launch |

## Status Bar

Top bar showing: Session (green) → Windows → Hostname (blue) → Time (purple) → Date (peach)

## Common Workflows

### Dev Layout

```bash
tmux new -s dev
# prefix + |  → vertical split
# prefix + -  → horizontal split
```

### Multi-Project

```bash
tmux new -s project1   # start session
# Ctrl+b d             → detach
tmux new -s project2   # another session
tmux ls                # list sessions
tmux a -t project1     # reattach
```

## Plugin Management

```bash
prefix + I       # install new plugins
prefix + U       # update plugins
prefix + Alt+u   # remove unused plugins
```
