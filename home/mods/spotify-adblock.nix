{ pkgs, lib, callPackage, ... }:
let
  spitify-adblock = pkgs.callPackage ../../custom/pkgs/spotify-adblock/default.nix { };
in 
  {
  home_pkgs = with pkgs; [
    spitify-adblock
  ];
}
