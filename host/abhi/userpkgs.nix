{ config, pkgs, ... }:
{
   nixpkgs.overlays = [
    (import ../../custom/overlays/betterlockscreen)
  ];

   nixpkgs.config.packageOverrides = pkgs: {
    spotify-adblock = pkgs.callPackage ../../custom/overlays/spotify-adblock/spotifyadblock.nix { };
   };

  users.users.abhi.packages = with pkgs; [


    betterlockscreen
    vim
    #   (import ../../home/abhi/mods/spotify-adblock/default.nix )
    unstable.neovim
    #spotify-adblock
    alacritty
    cmake
    ripgrep
    playerctl
    neofetch
    #unstable.librewolf
    #unstable.youtube-music
    xclip
    gcc
    pkg-config
    gnumake
    gnupatch
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
    #pcmanfm
    git
    feh
    fzf
    #mpv
    #vlc
    dconf
    rofi
    networkmanager
    #unstable.telegram-desktop

    unstable.lua
    unstable.luajitPackages.luarocks
    unstable.luajitPackages.jsregexp
    unstable.nodePackages_latest.nodejs
    unstable.nodejs_22

    unzip
    hashcat
    hashcat-utils
    john
    nmap

    #font-manager
    tree-sitter-grammars.tree-sitter-latex
    #calibre
    #kdePackages.okular
    #libreoffice-fresh
    fd
    ffmpeg
    pulsemixer
    #lxappearance
    tree-sitter

    #unstable.krita
    #unstable.inkscape-with-extensions
    #unstable.gimp


    #where-is-my-sddm-theme
    #sddm-chili-theme

    unstable.rustc
    unstable.rustfmt
    unstable.cargo
    unstable.clippy
    unstable.libudev-zero

    unstable.yazi

    #virtualbox


    #calibre
    cinnamon.nemo-with-extensions

    texlive.combined.scheme-full
    #zathura


    tree
  ];
}
