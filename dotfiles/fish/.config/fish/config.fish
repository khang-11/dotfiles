if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_vi_key_bindings
fish_add_path /opt/homebrew/bin/brew
eval "$(/opt/homebrew/bin/brew shellenv)"
alias vim="nvim"

# Gruvbox
set -l foreground ebdbb2
set -l selection 282828
set -l comment 928374
set -l red ea6962
set -l orange e78a4e
set -l yellow d8a657
set -l green a9b665
set -l aqua 89b482
set -l blue 7daea3
set -l purple d3869b

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $aqua
set -g fish_color_keyword $blue
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $blue
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $aqua
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

source "$HOME/.config/fish/local_config.fish"
