# tmux-sessionizer-tweaked

A portable, zero-config enhancement of [ThePrimeagen's `tmux-sessionizer`](https://github.com/ThePrimeagen/tmux-sessionizer).

Seamlessly jump between projects as independent tmux sessions across **any machine** (Linux, macOS, WSL) without having to manually edit hardcoded directories.

---

## Features

- **Zero-Config Auto-Discovery:** Automatically scans common developer folders that exist on the host:
  - `~/projects`, `~/code`, `~/dev`, `~/developer`, `~/src`, `~/repos`, `~/workspace`, `~/work`, `~/personal`, `~/git`, `~/dotfiles`, `~/.config`, `$HOME`.
- **Zoxide Integration:** If [`zoxide`](https://github.com/ajeetdsouza/zoxide) is present, your frequently visited project directories are automatically included.
- **`ghq` Integration:** If [`ghq`](https://github.com/x-motemen/ghq) is present, all cloned repositories are included.
- **Active Sessions:** Lists currently running tmux sessions so you can switch directly to them.
- **Direct CLI Navigation:** Run `tmux-sessionizer .` or `tmux-sessionizer /path/to/project` to jump directly without fzf.
- **Sanitized Session Naming:** Automatically normalizes illegal tmux characters (`.`, `:`, spaces) into valid session names (e.g. `~/.config` cleanly becomes `config`).
- **Flexible Attach/Switch:** Automatically switches if inside tmux or attaches if running from a regular terminal shell.
- **Optional Config Support:** Still supports custom paths and search depths via `~/.config/tmux-sessionizer/tmux-sessionizer.conf`.

---

## Installation

```bash
git clone git@github.com:Dodoprospy3/tmux-sessionizer-tweaked.git ~/projects/tmux-sessionizer-tweaked
cd ~/projects/tmux-sessionizer-tweaked
./install.sh
```

Or manually link the script:
```bash
ln -sf "$(pwd)/tmux-sessionizer" ~/.local/bin/tmux-sessionizer
```

Ensure `~/.local/bin` is in your `$PATH`.

---

## Tmux Keybinding

Add to your `~/.config/tmux/tmux.conf` or `~/.tmux.conf`:

```tmux
# Floating popup with Ctrl+f (or prefix + f)
bind-key -n C-f display-popup -E -w 75% -h 65% "~/.local/bin/tmux-sessionizer"
bind-key f display-popup -E -w 75% -h 65% "~/.local/bin/tmux-sessionizer"
```

Then reload tmux:
```bash
tmux source ~/.config/tmux/tmux.conf
```

---

## Requirements

- `tmux`
- `fzf`
- `bash` (3.2+ for macOS, Linux, WSL)
- Optional: `zoxide`, `ghq`
