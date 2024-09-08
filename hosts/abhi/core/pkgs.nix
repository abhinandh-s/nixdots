{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nil
    vim
    _7zz
    killall
    sops
    age
    ddcutil
    gnupg
    pinentry-all # GnuPG’s interface to passphrase input
    cryptsetup
    networkmanagerapplet
    xorg.libX11
    wget
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
