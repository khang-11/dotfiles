link:
	stow --target=$(HOME) aerospace fish ghostty nvim tmux tmuxinator

install:
	brew tap FelixKratz/formulae
	brew install cmake bat borders eza fd fzf jordanbaird-ice luarocks neovim node ripgrep stow tmux tmuxinator wget zoxide

setup-shell:
	brew install fish
	touch fish/.config/fish/local_config.fish
	fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
	rm $(HOME)/.config/fish/fish_plugins

setup-fish:
	fish -c "fisher update"
	fish -c  "tide configure --auto --style=Lean --prompt_colors='16 colors' --show_time='24-hour format' --lean_prompt_height='Two lines' --prompt_connection=Disconnected --prompt_spacing=Sparse --icons='Few icons' --transient=No"

setup-tmux:
	fish -c "[ -d "~/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
	fish -c "~/.tmux/plugins/tpm/scripts/install_plugins.sh"

setup:
	make setup-shell
	fish -c "make install"
	fish -c "make link"
	fish -c "make setup-fish"
	fish -c "make setup-tmux"
