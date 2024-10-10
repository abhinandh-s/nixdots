{ pkgs, lib, ... }:

  {








  home = {
    username = "abhi";
    homeDirectory = "/home/abhi";
    stateVersion = "24.05";
  };

  imports = [
    ./mods
    ./core
    ./pkgs.nix
  ];

  my.colorpencil.option = "red";

  programs = {
  };


  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.neovim.defaultEditor = true;

  programs.home-manager.enable = true;

}
