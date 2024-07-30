{ config, pkgs, ... }:
{
  home.packages = with pkgs; [

    #(import ../abhi/mods/spotify-adblock/default.nix { inherit pkgs; })
    btop
    htop
    cava
    xsel # for clipboard
    mpc-cli
    rofimoji
    rofi-mpd
    picard
    gtk-engine-murrine # picard depentancy
    rofi-calc
    openssl_3_3
    unstable.rust-analyzer
    unstable.python3
    unstable.lua-language-server
    unstable.nil
    xorg.libxcb
    xorg.libXrender
    xorg.libXfixes
    xorg.libXext
    unstable.binutils_nogold
    unstable.pyright
    unstable.ltex-ls
    (ncmpcpp.override { visualizerSupport = true; })
  ];
}
