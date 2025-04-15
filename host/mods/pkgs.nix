{ pkgs, ... }:
let
  # clipCat = pkgs.callPackage ../../custom/pkgs/clipcat/default.nix {};
in 
  {
  environment.systemPackages = with pkgs; [
    tmux
    _7zz
    starship
    alsa-utils
    age 
    ark
    # clipCat
    cryptsetup
    dconf
    eww
    fzf
    fd
    feh
    font-manager
    ffmpeg-full
    ghostty	
    git
    gcc
    gnupg
    gnumake
    gcc
    killall
    librewolf
    mpc-cli
    nixd
    nemo-with-extensions
    neovim
    pinentry-all
    pinentry-tty# GnuPG’s interface to passphrase input
    playerctl
    pavucontrol
    pass
    pulsemixer
    ripgrep
    sops
    tmux
    tree
    unzip
    vlc
    vim
    wget
    xsel # for clipboard
    xclip
    xdotool
    xarchiver
    zip
  ];
}
