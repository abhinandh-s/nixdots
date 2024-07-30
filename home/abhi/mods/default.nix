{ config, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./bash.nix
    # ./conky.nix
    #./betterlockscreen.nix
    #./cava.nix
    #./dunst.nix
    #./emacs/emacs.nix
    #./fastfetch.nix
    #./firefox.nix
    ./git.nix
    #./mimeapps.nix
    #./newsboat.nix
    #./mpd.nix
    #./ncmpcpp.nix
    #./kitty.nix
    #./rofi.nix
    #./slstatus.nix
    #./sxhkd.nix
    #./spotify-adblock
    #./qutebrowser.nix
    #./yazi.nix
    #./zathura.nix
  ];

  # services.emacs.enable = true;

}
