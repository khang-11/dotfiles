{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
  ];

  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.dotfiles.path}/dotfiles/nvim/.config/nvim";
}
