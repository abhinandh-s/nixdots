{
pkgs,
...
}: let
  mint-pink = {
    name = "Mint-Y-Pink";
    package = pkgs.mint-y-icons;
  };
  catppuccin = {
    package = (pkgs.catppuccin-papirus-folders.override {
      flavor = "mocha";
      accent = "red";
    });
  };


in {
  home = {
    # pointerCursor = {
    # name =  "Catppuccin-Mocha-Red";
    # package = pkgs.catppuccin-cursors.mochaRed;
    # gtk.enable = true;
    # x11.enable = true;
    # size = 32;
    # };
  };
  gtk = {
    enable = true;
    theme = {
      name = "Orchis-Pink-Dark-Dracula";
      package = (pkgs.orchis-theme.override {
        border-radius = 3;
        tweaks = [ "solid" "compact" "black" "primary" "macos" "submenu" "dracula" ];
      });
    };
    iconTheme = {
      name = "Mint-Y-Pink";
      package = pkgs.mint-y-icons;
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Red";
      package = pkgs.catppuccin-cursors.mochaRed;
      size = 14;
    };
    gtk2.extraConfig = "gtk-application-prefer-dark-theme = true";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
  };
}
