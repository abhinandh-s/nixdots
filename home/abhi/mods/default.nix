{ config, pkgs, ... }:
{
  imports = [
    ./aria2.nix
    # ./conky.nix
 #   ./multimedia
    #./betterlockscreen.nix
      #./cava.nix
    #./emacs/emacs.nix
    ./fastfetch.nix
    #./mimeapps.nix
    ./newsboat.nix
    #./mpd.nix
 #   ./nautilus.nix
    ./ncmpcpp.nix
    #./kitty.nix
    ./slstatus.nix
    #./sxhkd.nix
    ./xdgconfig.nix
    ./spotify.nix
 #   ./thunderbird.nix
    ./qutebrowser.nix
    # ./yazi.nix
    ./zathura.nix
  ];

  # services.emacs.enable = true;

}
