{
  ...
}:
{
  home = {
    username = "abhi";
    homeDirectory = "/home/abhi";
    # stateVersion = "24.11";
    stateVersion = "24.05";
  };

  imports = [
    ./mods
    ./pkgs.nix
  ];
  
  home.sessionVariables = {
    # remain backwards compatible with qt5
    DISABLE_QT5_COMPAT = "0";
    CALIBRE_USE_SYSTEM_THEME = 1;
    # tell calibre to use the dark theme
    CALIBRE_USE_DARK_PALETTE = "1";
  };
  
  program.brightness.enable = true;
  program.otter = {
    enable = true;
    settings = {
      directories = {
        images = {
          path = "/home/abhi/pics/pictures/images";
          tree = false;
        };
        documents = {
          path = "/home/abhi/docs/lib";
          tree = false;
        };
        videos = {
          path = "/home/abhi/videos";
          tree = true;
        };
        archives = {
          path = "/home/abhi/archive";
          tree = false;
        };
      };
      input_dirs = {
        dirs = [
          "/home/abhi/videos"
          "/home/abhi/archive"
          "/home/abhi/downloads"
        ];
      };
    };
  };

  my.colorpencil.option = "red";

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  programs.neovim.defaultEditor = true;

  programs.home-manager.enable = true;
}
