{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    tmux
  ];

  home.file.".config/tmux".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/dotfiles/tmux/.config/tmux";
}
