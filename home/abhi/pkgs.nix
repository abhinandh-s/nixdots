{ config, pkgs, ... }:
{
  home.packages = with pkgs; [

    alacritty
    # cmake
    # ripgrep
    # playerctl
    # neofetch
    # xclip
    # gcc
    # pkg-config
    # gnumake
    # gnupatch
    # git
    # feh
    # fzf
    # vlc
    # dconf
    rofi
    networkmanager
    # unzip
    # hashcat
    # hashcat-utils
    # john
    # nmap
    # font-manager
    # tree-sitter-grammars.tree-sitter-latex
    # kdePackages.okular
    # fd
    # ffmpeg
    # pulsemixer
    # #lxappearance
    # tree-sitter
    # #virtualbox
    # calibre
    # cinnamon.nemo-with-extensions
    # texlive.combined.scheme-full
    # zathura
    # tree
    # betterlockscreen
    # vim
    # btop
    # htop
    # cava
    # xsel # for clipboard
    # mpc-cli
    # rofimoji
    # rofi-calc
    # openssl_3_3
    #
    # xorg.libxcb
    # xorg.libXrender
    # xorg.libXfixes
    # xorg.libXext
    # xorg.libX11
    # xorg.libXft
    # xorg.libXinerama
    #
    #
    # unstable.neovim
    # unstable.libreoffice-fresh
    # unstable.librewolf
    # unstable.youtube-music
    # unstable.yazi
    # unstable.telegram-desktop
    # unstable.krita
    # unstable.inkscape-with-extensions
    # unstable.gimp
    # unstable.binutils_nogold
    # unstable.rust-analyzer
    # unstable.python3
    # unstable.lua-language-server
    # unstable.nil
    # unstable.ltex-ls
    # unstable.lua
    # unstable.luajitPackages.luarocks
    # unstable.luajitPackages.jsregexp
    # unstable.nodePackages_latest.nodejs
    # unstable.nodejs_22
    # unstable.pyright
    # unstable.rustc
    # unstable.rustfmt
    # unstable.cargo
    # unstable.clippy
    # unstable.libudev-zero

    # (ncmpcpp.override { visualizerSupport = true; })
  ];
}
