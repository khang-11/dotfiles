link:
	stow --target=$(HOME) fish hammerspoon nvim tmux tmuxinator wezterm

install:
	brew install cmake bat eza fd fzf hammerspoon jordanbaird-ice luarocks neovim node ripgrep stow tmux tmuxinator wezterm wget zoxide
	brew install --cask rectangle

setup-shell:
	brew install fish
	touch fish/.config/fish/local_config.fish
	fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
	rm $(HOME)/.config/fish/fish_plugins

setup-fish:
	fish -c "fisher update"
	fish -c  "tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=No"

setup-tmux:
	fish -c "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
	fish -c "~/.tmux/plugins/tpm/scripts/install_plugins.sh"

setup:
	make setup-shell
	fish -c "make install"
	fish -c "make link"
	fish -c "make setup-fish"
	fish -c "make setup-tmux"
