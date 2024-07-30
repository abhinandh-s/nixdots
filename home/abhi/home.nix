{ config, pkgs, lib, ... }:
{



  home.username = "abhi";
  home.homeDirectory = "/home/abhi";
  home.stateVersion = "24.05";


  imports = [
    ./mods/default.nix
    ./pkgs.nix
  ];


    xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark-BL-LB";
      package = pkgs.tokyonight-gtk-theme;
    };
    iconTheme = {
      name= "Mint-Y-Pink";
      package = pkgs.cinnamon.mint-y-icons;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      # package = pkgs.catppuccin-cursors.mochaPink      
      package = pkgs.bibata-cursors;
      size = 14;
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme = true";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };


  programs.home-manager.enable = true;

}
