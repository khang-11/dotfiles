{ config, ... }:

{
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    taps = builtins.attrNames config.nix-homebrew.taps;

    brews = [
      "anomalyco/tap/opencode"
      "borders"
      "flyctl"
      "gh"
    ];

    casks = [
      "aerospace"
      "bitwarden"
      "caffeine"
      "discord"
      "docker-desktop"
      "ghostty"
      "google-chrome"
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
      "zoom"
    ];
  };
}
