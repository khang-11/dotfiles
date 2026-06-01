{
  description = "Khang's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ home-manager, nixpkgs, ... }:
    let
      username = "khang";
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      dotfilesPathEnv = builtins.getEnv "DOTFILES_PATH";
      dotfilesPath =
        if dotfilesPathEnv == "" then null else dotfilesPathEnv;

      mkHome = system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        extraSpecialArgs = {
          inherit dotfilesPath;
        };
        modules = [
          ./home/common
          {
            home = {
              inherit username;
              homeDirectory =
                if builtins.match ".*-darwin" system != null
                then "/Users/${username}"
                else "/home/${username}";
              stateVersion = "25.05";
            };

            programs.home-manager.enable = true;
          }
        ];
      };
    in
    {
      homeConfigurations = builtins.listToAttrs (map (system: {
        name = "${username}@${system}";
        value = mkHome system;
      }) supportedSystems);
    };
}
