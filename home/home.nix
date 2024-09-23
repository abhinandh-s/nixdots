{ config, pkgs, ... }:
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

  home.file = {
    ".local/bin/slstatus".source = ../custom/bin/slstatus;
    ".background-image".source = ../assets/wallpaper/macos-blue.png;
  };

  programs = {
  };


  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Tokyonight-Dark-BL-LB";
      package = pkgs.pop-gtk-theme;
    };
    iconTheme = {
      name= "Papirus-Dark"; # Mint-Y-Pink
      package = pkgs.nordzy-icon-theme; # nordzy-icon-theme # cinnamon.mint-y-icons
    };
    cursorTheme = {
      name = "Bibata-Original-Ice";
      # package = pkgs.catppuccin-cursors.mochaPink      
      # package = pkgs.bibata-cursors;
      size = 14;
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme = true";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  programs.neovim.defaultEditor = true;

  programs.home-manager.enable = true;

}
