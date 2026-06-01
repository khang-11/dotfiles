{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    cmake
    eza
    fd
    fzf
    git
    ripgrep
    wget
    zoxide
  ];
}
