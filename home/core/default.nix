{ config, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./dunst.nix
    ./flameshot.nix
    ./firefox.nix
    ./git.nix
    ./rofi.nix
  ];

}
