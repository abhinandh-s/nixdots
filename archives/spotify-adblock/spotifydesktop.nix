{ config, pkgs, ... }:
{
  xdg.desktopEntries = {
    spotify-adblock = {
      name = "Spotify";
      genericName = "Spotify (adblock)";
      exec = "env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U";
      terminal = false;
      categories = [ "Audio" "Music" "Player" "AudioVideo" ];
      mimeType = [ "x-scheme-handler/spotify" ];
    };
    #  spotify.noDisplay = true;
  };
}
