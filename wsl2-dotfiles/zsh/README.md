# 🐚 ZSH Configuration — WSL2

## Installation

```bash
# Symlink to home directory
ln -sf ~/dotfiles/wsl2-dotfiles/zsh/.zshrc ~/.zshrc

# Install Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install custom plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Reload
source ~/.zshrc
```

## Plugins

| Plugin                    | What It Does                      | Usage                             |
| ------------------------- | --------------------------------- | --------------------------------- |
| `git`                     | Git aliases & functions           | Built-in, see git aliases below   |
| `zsh-autosuggestions`     | Fish-like suggestions as you type | Press `→` to accept               |
| `zsh-syntax-highlighting` | Colors valid/invalid commands     | Automatic                         |
| `sudo`                    | Prepend sudo to last command      | Press `Esc` twice                 |
| `extract`                 | Extract any archive               | `extract file.tar.gz`             |
| `web-search`              | Search from terminal              | `google "search term"`            |
| `copypath`                | Copy current path to clipboard    | `copypath`                        |
| `dirhistory`              | Navigate dir history              | `Alt+Left/Right`                  |
| `command-not-found`       | Suggest package for unknown cmd   | Automatic                         |
| `jsontools`               | JSON utilities                    | `pp_json`, `is_json`, `urlencode` |

## Aliases Quick Reference

### Navigation

```bash
..          # cd ..
...         # cd ../..
....        # cd ../../..
```

### Modern `ls` (eza)

```bash
ls          # eza with icons
ll          # long listing with git status
la          # show hidden files
lt          # tree view (2 levels)
lta         # tree view (3 levels, hidden files)
```

### Modern Tool Replacements

```bash
cat file    # → bat (syntax highlighting)
grep text   # → ripgrep (faster)
find name   # → fd (faster, friendlier)
du          # → dust (visual disk usage)
top         # → btop (prettier system monitor)
```

### Git

```bash
gs          # git status
ga file     # git add <file>
gaa         # git add --all
gc          # git commit
gcm "msg"   # git commit -m "msg"
gp          # git push
gpl         # git pull
gd          # git diff
gds         # git diff --staged
gco branch  # git checkout <branch>
gcb newbr   # git checkout -b <new-branch>
gb          # git branch
glg         # pretty log (20 entries)
gla         # pretty log all branches (30)
gst         # git stash
gstp        # git stash pop
grbi HEAD~3 # interactive rebase last 3
```

### Docker

```bash
dps         # docker ps
dpsa        # docker ps -a
dimg        # docker images
dlog name   # docker logs -f <name>
dexe name   # docker exec -it <name>
dcup        # docker compose up -d
dcdown      # docker compose down
dclog       # docker compose logs -f
dcbuild     # docker compose build
dcrestart   # docker compose restart
```

### System (Pacman / Yay)

```bash
update      # full system update (yay -Syu)
install pkg # install a package (yay -S)
remove pkg  # remove package + deps (yay -Rns)
search term # search packages (yay -Ss)
pkginfo pkg # show package info (yay -Qi)
cleanup     # clean package cache
orphans     # list orphan packages
rmorphans   # remove all orphan packages
```

### Quick Config Edit

```bash
ezsh        # edit this .zshrc
etmux       # edit tmux config
estarship   # edit starship config
envim       # edit nvim config directory
reload      # source .zshrc
```

### WSL2 Integrations

```bash
# Clipboard
pbcopy      # copy stdin to Windows clipboard (pipe into it)
pbpaste     # paste from Windows clipboard

# Example: copy file contents to clipboard
cat file.txt | pbcopy

# Open files/URLs with Windows default app
open file.pdf           # opens in Windows default app
open https://google.com # opens in Windows browser

# Windows drive shortcuts
cdwin       # cd /mnt/c
cdhome      # cd to your Windows user folder
cddesk      # cd to Windows Desktop
cddown      # cd to Windows Downloads

# Run Windows apps
explorer .  # open current dir in Windows Explorer
notepad file.txt
```

### Utilities

```bash
c           # clear
q           # exit
h           # last 30 history entries
ports       # show listening ports
myip        # show public IP
weather     # current weather one-liner
sizeof dir  # show directory size
ff          # fastfetch
lg          # lazygit
ld          # lazydocker
y           # yazi file manager
```

## Custom Functions

### `mkcd` — Create and enter directory

```bash
mkcd my-project        # creates and cd into my-project
mkcd a/b/c             # creates nested dirs and enters
```

### `take` — Clone repo and enter it

```bash
take https://github.com/user/repo.git   # clones + cd into repo
take my-folder                           # same as mkcd
```

### `portcheck` — See what's using a port

```bash
portcheck 8080         # shows process on port 8080
```

### `backup` — Quick backup with timestamp

```bash
backup important.conf  # creates important.conf.bak.20260301_164400
```

### `cheatsheet` — Show alias cheatsheet

```bash
cheatsheet             # prints a summary of all custom aliases
```

## Tool Integrations

### Zoxide (Smart `cd`)

```bash
z projects     # jump to most visited "projects" directory
z dot          # jump to most visited dir matching "dot"
zi             # interactive selection with fzf
```

### FZF (Fuzzy Finder)

```bash
Ctrl+T         # search files in current directory
Ctrl+R         # search command history
Alt+C          # cd into a subdirectory
```

### Yazi File Manager

```bash
y              # open yazi
yy             # open yazi and cd to navigated dir on exit
```
