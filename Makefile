link:
	stow fish hammerspoon nvim starship tmux tmuxinator wezterm

install:
	brew install bat eza fd fzf hammerspoon neovim node ripgrep starship stow tmux tmuxinator wezterm zoxide

shell:
	brew install fish
	chsh -s $(which fish)

setup:
	make shell
	fish
	make install
	make link
