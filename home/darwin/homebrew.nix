{ config, ... }:

{
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap";
      extraFlags = [
        "--force"
      ];
    };

    taps = builtins.attrNames config.nix-homebrew.taps;

    brews = [
      "borders"
      "gh"
    ];

    casks = [
      "aerospace"
      "bitwarden"
      "discord"
      "docker-desktop"
      "ghostty"
      "google-chrome"
      "helium-browser"
      "homerow"
      "iina"
      "moonlight"
      "notion"
      "obsidian"
      "qbittorrent"
      "raycast"
      "spotify"
      "stremio"
      "visual-studio-code"
    ];
  };
}
