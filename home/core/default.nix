{ config, pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./dunst.nix
    ./flameshot.nix
    ./firefox.nix
    ./git.nix
    ./nushell.nix
    ./rofi.nix
  ];

}
