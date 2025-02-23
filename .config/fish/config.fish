command fastfetch -c /usr/share/fastfetch/presets/examples/8.jsonc
# remove the default fish greeting
set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Start a tmux 
# checking if tmux is not already running
if type -q tmux
    if not test -n "$TMUX"
        tmux attach-session -t default; or tmux new-session -s default
    end
end

# Set up fzf key bindings
fzf --fish | source

# Command aliases

# warp-cli aliases
alias vpn-on="warp-cli connect"
alias vpn-off="warp-cli disconnect"
alias vpn-status="warp-cli status"

# ls aliases
alias fastfetch="fastfetch -c /usr/share/fastfetch/presets/examples/13.jsonc"
alias lsA="ls --color=auto -lA --sort=extension"
