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
      "pi-coding-agent"
    ];

    casks = [
      "aerospace"
      "autodesk-fusion"
      "bitwarden"
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
      "tailscale-app"
      "visual-studio-code"
    ];
  };
}
