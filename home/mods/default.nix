{ config, pkgs, ... }:
{
  imports = [
    ./fastfetch.nix
    ./ncmpcpp.nix
    ./spotify.nix
    ./newsboat.nix
    ./nushell.nix
    ./zathura.nix
    ./qutebrowser.nix
    ./aria2.nix
    ./xdgconfig.nix
    ./yazi.nix
    ./mpv.nix
    #./betterlockscreen.nix
    #./cava.nix
    #./mimeapps.nix
    #./mpd.nix
    #./kitty.nix
    # ./slstatus.nix
    # ./thunderbird.nix
  ];
}
