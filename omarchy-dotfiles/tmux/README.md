# 🖥️ Tmux Configuration — Omarchy

## Installation

```bash
# Symlink to home directory
ln -sf ~/dotfiles/omarchy-dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Launch tmux — plugins will auto-install on first run
tmux
```

> TPM (Tmux Plugin Manager) and all plugins will be **automatically installed** on first launch. No manual setup needed.

## Key Bindings

The prefix key is `Ctrl+b` (default). An alternative `Ctrl+a` is also available.

All keybindings below are in the format: `prefix + key`, meaning press `Ctrl+b` first, release, then press the key.

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

| Keybind      | Action                              |
| ------------ | ----------------------------------- |
| `prefix + c` | New window (in current directory)   |
| `Shift + ←`  | Previous window                     |
| `Shift + →`  | Next window                         |
| `Alt + 1`    | Jump to window 1                    |
| `Alt + 2`    | Jump to window 2                    |
| `Alt + 3`    | Jump to window 3                    |
| `Alt + 4`    | Jump to window 4                    |
| `Alt + 5`    | Jump to window 5                    |
| `prefix + ,` | Rename current window               |
| `prefix + &` | Close current window (with confirm) |

### Session Management

| Keybind      | Action                              |
| ------------ | ----------------------------------- |
| `prefix + S` | Create new named session            |
| `prefix + X` | Kill current session (with confirm) |
| `prefix + s` | List/switch sessions                |
| `prefix + d` | Detach from session                 |
| `prefix + $` | Rename session                      |

### Copy Mode (Vi-style)

| Keybind      | Action                                    |
| ------------ | ----------------------------------------- |
| `prefix + [` | Enter copy mode                           |
| `v`          | Start selection (in copy mode)            |
| `y`          | Copy selection to clipboard via `wl-copy` |
| `q`          | Exit copy mode                            |

Mouse selection also auto-copies to clipboard.

### Utility

| Keybind      | Action                        |
| ------------ | ----------------------------- |
| `prefix + r` | Reload tmux config            |
| `prefix + ?` | Show all keybindings          |
| `prefix + z` | Toggle pane zoom (fullscreen) |

## Plugins

| Plugin           | What It Does                                |
| ---------------- | ------------------------------------------- |
| `tmux-sensible`  | Sensible default settings                   |
| `tmux-yank`      | Better clipboard integration                |
| `tmux-resurrect` | Save/restore sessions (`prefix + Ctrl+s/r`) |
| `tmux-continuum` | Auto-save sessions every 15 minutes         |

### Session Save/Restore

Your tmux sessions are **automatically saved** every 15 minutes and **restored on next launch**.

```bash
# Manual save
prefix + Ctrl+s

# Manual restore
prefix + Ctrl+r
```

## Status Bar

The status bar at the top shows:

- **Left**: Session name (green pill)
- **Center**: Window list (peach = active, grey = inactive)
- **Right**: Hostname (blue) → Time (purple) → Date (peach)

## Common Workflows

### Development Layout

```bash
# Create a 3-pane dev layout
tmux new -s dev
# prefix + | → editor on left, terminal on right
# prefix + - → split right pane: top for commands, bottom for logs
```

### Multiple Projects

```bash
tmux new -s project1    # start session for project 1
# Ctrl+b d              → detach
tmux new -s project2    # start session for project 2
tmux ls                 # list all sessions
tmux a -t project1      # reattach to project 1
```

## Plugin Management

```bash
# Install new plugins (after adding to .tmux.conf)
prefix + I

# Update plugins
prefix + U

# Remove unused plugins
prefix + Alt + u
```
