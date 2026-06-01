{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    claude-code
    cmake
    codex
    eza
    fd
    firebase-tools
    fzf
    git
    opencode
    ripgrep
    wget
    zoxide
  ];
}
