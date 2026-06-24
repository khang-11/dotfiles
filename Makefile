DOTFILES_PATH ?= $(CURDIR)
USERNAME ?= khang
SYSTEM ?= $(shell if command -v nix >/dev/null 2>&1; then nix eval --extra-experimental-features "nix-command flakes" --impure --raw --expr 'builtins.currentSystem'; elif [ "$$(uname -s)" = Darwin ] && [ "$$(uname -m)" = arm64 ]; then printf aarch64-darwin; elif [ "$$(uname -s)" = Darwin ] && [ "$$(uname -m)" = x86_64 ]; then printf x86_64-darwin; elif [ "$$(uname -s)" = Linux ] && [ "$$(uname -m)" = aarch64 ]; then printf aarch64-linux; elif [ "$$(uname -s)" = Linux ] && [ "$$(uname -m)" = x86_64 ]; then printf x86_64-linux; else printf unknown; fi)
HOME_CONFIGURATION ?= $(USERNAME)@$(SYSTEM)
DARWIN_CONFIGURATION ?= $(USERNAME)@$(SYSTEM)
DARWIN_REBUILD ?= darwin-rebuild
DARWIN_REBUILD_FRESH ?= nix --extra-experimental-features "nix-command flakes" run github:nix-darwin/nix-darwin/master\#darwin-rebuild --
NIX_DAEMON_PROFILE ?= /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

.PHONY: check darwin fresh-mac home install-nix install-xcode

check:
	DOTFILES_PATH="$(DOTFILES_PATH)" nix flake check path:. --impure

home:
	DOTFILES_PATH="$(DOTFILES_PATH)" home-manager switch --flake path:.#$(HOME_CONFIGURATION) --impure

darwin:
	sudo env DOTFILES_PATH="$(DOTFILES_PATH)" $(DARWIN_REBUILD) switch --flake path:.#$(DARWIN_CONFIGURATION) --impure

darwin-init:
	sudo rm -f /etc/bashrc /etc/zshrc
	. "$(NIX_DAEMON_PROFILE)" 2>/dev/null || true; sudo env DOTFILES_PATH="$(DOTFILES_PATH)" PATH="$$PATH" $(DARWIN_REBUILD_FRESH) switch --flake path:.#$(DARWIN_CONFIGURATION) --impure

install-xcode:
	xcode-select -p >/dev/null 2>&1 || xcode-select --install

install-nix:
	command -v nix >/dev/null 2>&1 || sh -c "$$(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)"
