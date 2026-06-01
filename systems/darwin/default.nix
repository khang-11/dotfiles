{ pkgs, username, ... }:

{
  nix = {
    enable = true;
    package = pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        username
      ];
      builders-use-substitutes = true;
      auto-optimise-store = false;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };

  users = {
    knownUsers = [
      username
    ];
    users.${username} = {
      home = "/Users/${username}";
      description = username;
      uid = 501;
      shell = pkgs.fish;
    };
  };

  system = {
    primaryUser = username;
    stateVersion = 6;
    defaults = {
      controlcenter = {
        BatteryShowPercentage = true;
      };
      dock = {
        autohide = true;
        orientation = "left";
        persistent-apps = [
          {
            app = "/Applications/Google Chrome.app";
          }
          {
            app = "/Applications/Ghostty.app";
          }
          {
            app = "/Applications/Bitwarden.app";
          }
        ];
        persistent-others = [];
        show-recents = false;
      };
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };
      smb.NetBIOSName = username;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  programs = {
    fish.enable = true;
    zsh.enable = true;
  };

  environment.shells = [ pkgs.fish ];
}
