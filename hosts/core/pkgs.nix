{ config, pkgs, ... }:
let
in
{
  environment.systemPackages = with pkgs; [
    cinnamon.nemo-with-extensions

    (slstatus.overrideAttrs {
      src = ../../custom/overlays/slstatus;
    })


    (leftwm.overrideAttrs {
      src = ../../custom/overlays/leftwm;
      cargoPatches = ../../custom/overlays/leftwm/Cargo.lock;
    })



    # brightness
    lxappearance
    feh
    ddcutil
    # audio 
    pulsemixer
    mpc-cli
    # editor
    vim
    # zip
    unzip
    _7zz
    # keys
    sops
    age
    gnupg
    pinentry-all # GnuPG’s interface to passphrase input
    cryptsetup

    # utils
    vlc
    wget
    killall
    networkmanagerapplet
    tree
    htop
    cava
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

    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
