# tmux-sessionizer plugin for Oh My Zsh

# Ensure ~/.local/bin is in PATH
if [[ -d "$HOME/.local/bin" && ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Bind Ctrl+F to launch tmux-sessionizer
# ^U clears any typed command on the prompt line before running
bindkey -s '^f' '^Utmux-sessionizer\n'

# Quick alias
alias tms="tmux-sessionizer"
