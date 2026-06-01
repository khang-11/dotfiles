{ pkgs, ... }:

{
  home.packages = with pkgs; [
    black
    isort
    python3
  ];
}
