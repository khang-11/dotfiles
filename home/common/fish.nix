{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fish
  ];

  home.file.".config/fish".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/dotfiles/fish/.config/fish";
}
