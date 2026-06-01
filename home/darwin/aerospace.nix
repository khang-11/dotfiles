{ config, ... }:

{
  home.file.".config/aerospace".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/dotfiles/aerospace/.config/aerospace";
}
