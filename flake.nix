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
    brew-src = {
      url = "github:Homebrew/brew/master";
      flake = false;
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      inputs.brew-src.follows = "brew-src";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    nikitabobko-tap = {
      url = "github:nikitabobko/homebrew-tap";
      flake = false;
    };
    felixkratz-tap = {
      url = "github:FelixKratz/homebrew-formulae";
      flake = false;
    };
    anomalyco-tap = {
      url = "github:anomalyco/homebrew-tap";
      flake = false;
    };
  };

  outputs = inputs@{ home-manager, nix-darwin, nix-homebrew, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      username = "khang";
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      darwinSystems = [
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      dotfilesPathEnv = builtins.getEnv "DOTFILES_PATH";
      dotfilesPath =
        if dotfilesPathEnv == "" then null else dotfilesPathEnv;
      isDarwin = system: builtins.match ".*-darwin" system != null;

      mkHomeModules = system: [
        ./home/common
        {
          home = {
            inherit username;
            homeDirectory =
              if isDarwin system
              then "/Users/${username}"
              else "/home/${username}";
            stateVersion = "25.05";
          };

          programs.home-manager.enable = true;
        }
      ] ++ lib.optionals (isDarwin system) [
        ./home/darwin/darwin.nix
      ];

      mkHome = system: home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { inherit system; };
        extraSpecialArgs = {
          inherit dotfilesPath;
        };
        modules = mkHomeModules system;
      };

      mkDarwin = system: nix-darwin.lib.darwinSystem {
        inherit system;
        specialArgs = {
          inherit username;
        };
        modules = [
          nix-homebrew.darwinModules.nix-homebrew
          home-manager.darwinModules.home-manager
          ./systems/darwin
          ./home/darwin/homebrew.nix
          {
            nixpkgs.hostPlatform = system;

            nix-homebrew = {
              enable = true;
              enableRosetta = system == "aarch64-darwin";
              user = username;
              autoMigrate = true;
              mutableTaps = false;
              package = inputs.brew-src // {
                name = "brew-master";
                version = "master";
              };
              taps = {
                "homebrew/homebrew-core" = inputs.homebrew-core;
                "homebrew/homebrew-cask" = inputs.homebrew-cask;
                "nikitabobko/homebrew-tap" = inputs.nikitabobko-tap;
                "FelixKratz/homebrew-formulae" = inputs.felixkratz-tap;
                "anomalyco/homebrew-tap" = inputs.anomalyco-tap;
              };
            };

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit dotfilesPath;
              };
              users.${username}.imports = mkHomeModules system;
            };
          }
        ];
      };
    in
    {
      homeConfigurations = builtins.listToAttrs (map (system: {
        name = "${username}@${system}";
        value = mkHome system;
      }) supportedSystems);

      darwinConfigurations = builtins.listToAttrs (map (system: {
        name = "${username}@${system}";
        value = mkDarwin system;
      }) darwinSystems);
    };
}
