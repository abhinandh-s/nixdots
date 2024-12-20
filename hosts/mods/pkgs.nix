{ pkgs, ... }:
let
  clipCat = pkgs.callPackage ../../custom/pkgs/clipcat/default.nix {};
in 
  {
  environment.systemPackages = with pkgs; [
    # clipCat
    eww
    xdotool
    nemo-with-extensions
    alsa-utils
    pass
    feh
    pulsemixer
    mpc-cli
    vim
    xarchiver
    ark
    zip
    unzip
    _7zz
    sops
    age
    gnupg
    pinentry-all
    pinentry-tty# GnuPG’s interface to passphrase input
    cryptsetup

    vlc
    wget
    killall
    tree
    xsel # for clipboard
    openssl_3_3
    fzf
    dconf
    fd
    cmake
    pkg-config
    gnumake
    gnupatch
    ripgrep
    playerctl
    xclip
    gcc
    pavucontrol
    font-manager
    ffmpeg-full

    xorg.libxcb
    xorg.libXrender
    xorg.libXfixes
    xorg.libXext
    xorg.libX11
    xorg.libXft
    xorg.libXinerama
  ];
}
