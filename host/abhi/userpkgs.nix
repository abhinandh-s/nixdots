{ config, pkgs, ... }:
{
   nixpkgs.overlays = [
    (import ../../custom/overlays/betterlockscreen)
  ];

  users.users.abhi.packages = with pkgs; [
    # vim
  ];
}
