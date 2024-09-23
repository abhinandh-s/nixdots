{ pkgs }
:
{
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

}
