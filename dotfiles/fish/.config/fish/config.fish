if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
    fish_vi_key_bindings

    # Gruvbox Material Dark Color Palette
    set -l background 282828
    set -l foreground d4be98
    set -l selection d4be98
    set -l comment 7c6f64
    set -l red ea6962
    set -l orange e78a4e
    set -l yellow d8a657
    set -l green a9b665
    set -l purple d3869b
    set -l cyan 89b482
    set -l blue 7daea3

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $green
    set -g fish_color_keyword $red
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $blue
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection --foreground=$background
    set -g fish_color_search_match --background=$selection --foreground=$background
    set -g fish_color_operator $green
    set -g fish_color_escape $purple
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $green
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection --foreground=$background

    alias cat="bat"
    alias ls="eza"
    alias vim="nvim"

    set -Ux EDITOR nvim

    if test -x /opt/homebrew/bin/brew
        eval "$(/opt/homebrew/bin/brew shellenv)"
    end

    if test -f "$HOME/.config/fish/local_config.fish"
        source "$HOME/.config/fish/local_config.fish"
    end
    zoxide init fish | source
end

set -u tide_right_prompt_items status cmd_duration time
