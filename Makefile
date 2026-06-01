DOTFILES_PATH ?= $(CURDIR)
USERNAME ?= khang
SYSTEM ?= $(shell nix eval --impure --raw --expr 'builtins.currentSystem')
HOME_CONFIGURATION ?= $(USERNAME)@$(SYSTEM)

.PHONY: check home

check:
	DOTFILES_PATH="$(DOTFILES_PATH)" nix flake check path:. --impure

home:
	DOTFILES_PATH="$(DOTFILES_PATH)" home-manager switch --flake path:.#$(HOME_CONFIGURATION) --impure
