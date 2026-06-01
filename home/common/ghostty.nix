{ config, ... }:

{
  home.file.".config/ghostty".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/dotfiles/ghostty/.config/ghostty";
}
