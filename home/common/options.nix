{ config, lib, dotfilesPath ? null, ... }:

let
  hasDotfilesPath = dotfilesPath != null && dotfilesPath != "";
in
{
  options.dotfiles.path = lib.mkOption {
    type = lib.types.str;
    default = "${config.home.homeDirectory}/dotfiles";
    description = "Path to mutable dotfiles checkout.";
  };

  config = lib.mkIf hasDotfilesPath {
    dotfiles.path = lib.mkDefault dotfilesPath;
  };
}
