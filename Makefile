link:
	stow fish hammerspoon nvim tmux tmuxinator wezterm

install:
	brew install bat eza fd fzf hammerspoon neovim node ripgrep stow tmux tmuxinator wezterm zoxide

setup-shell:
	brew install fish

setup-fish:
	fish -c "fisher update"
	fish -c  "tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=No"

setup:
	make setup-shell
	fish -c "make install"
	fish -c "make link"
	fish -c "make setup-fish"
