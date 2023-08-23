if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_vi_key_bindings
fish_add_path /opt/homebrew/bin/brew
eval "$(/opt/homebrew/bin/brew shellenv)"
alias vim="nvim"

source "$HOME/.config/fish/local_config.fish"