{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    prettierd
  ];
}
