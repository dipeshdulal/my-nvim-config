## Configuration for my nvim setup

```
git clone https://github.com/dipeshdulal/my-nvim-config ~/.config/nvim
```

## Sessionizer

```bash
#!/bin/bash

# Original Source
# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer

selected=$(find ~/projects -mindepth 1 -maxdepth 2 -type d | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# if not inside tmux session, and not running
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

# if outside just attach
if [[ -z $TMUX ]]; then
  tmux attach -t $selected_name
  exit 0
fi

tmux switch-client -t $selected_name
```

## Alacritty Setup

```toml
[window]
decorations = "Buttonless"
padding = { y = 5 }

[font]
normal = { family = "Hack Nerd Font" }
size = 12
```


## Tmux Setup `~/.tmux.conf` 
```
set -g mouse on
unbind '"'
unbind %

bind | split-window -h
bind - split-window -v

# Set hyperlinks
set -ga terminal-features "*:hyperlinks"

# Vi mode
setw -g mode-keys vi

# List of plugins
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator'

set -g @catppuccin_flavour 'latte'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

```
