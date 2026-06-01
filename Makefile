DOTFILES_PATH ?= $(CURDIR)
USERNAME ?= khang
SYSTEM ?= $(shell nix eval --impure --raw --expr 'builtins.currentSystem')
HOME_CONFIGURATION ?= $(USERNAME)@$(SYSTEM)
DARWIN_CONFIGURATION ?= $(USERNAME)@$(SYSTEM)

.PHONY: check darwin home

check:
	DOTFILES_PATH="$(DOTFILES_PATH)" nix flake check path:. --impure

home:
	DOTFILES_PATH="$(DOTFILES_PATH)" home-manager switch --flake path:.#$(HOME_CONFIGURATION) --impure

darwin:
	DOTFILES_PATH="$(DOTFILES_PATH)" nix run github:nix-darwin/nix-darwin/master#darwin-rebuild -- switch --flake path:.#$(DARWIN_CONFIGURATION) --impure
