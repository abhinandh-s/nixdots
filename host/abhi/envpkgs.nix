{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim
    killall
    wget
  ];
}
