{...}: {
  imports = [
    ./users.nix
    ./secrets.nix
    ./syncthing.nix
    ./audio.nix
    ./bootloader.nix
    ./direnv.nix
    ./fonts.nix
    ./ftp.nix
    ./network.nix
    ./jellyfin.nix
    ./locale.nix
    ./pkgs.nix
    ./picom.nix
    ./polkit.nix
    ./qt.nix
    ./userenv.nix
    ./xserver.nix
    ./xdg.nix
  ];
}
