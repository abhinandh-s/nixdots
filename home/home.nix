{ config, ... }: {
  home = {
    stateVersion = "24.05";
    username = "abhi";
    homeDirectory = "/home/abhi";
  };

  imports = [
    ./mods
    ./pkgs.nix
  ];

  my.colorpencil.option = "black";

  home.sessionVariables = {
    # remain backwards compatible with qt5
    DISABLE_QT5_COMPAT = "0";
    CALIBRE_USE_SYSTEM_THEME = 1;
    # tell calibre to use the dark theme
    CALIBRE_USE_DARK_PALETTE = "1";
  };

  program.brightness.enable = true;

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.neovim.defaultEditor = true;

  programs.home-manager.enable = true;
}
