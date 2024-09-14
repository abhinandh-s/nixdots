{ config, pkgs, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      publicShare = null;
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/documents";
      music = "${config.home.homeDirectory}/music";
      videos = "${config.home.homeDirectory}/videos";
      pictures = "${config.home.homeDirectory}/pictures";
      templates = "${config.home.homeDirectory}/templates";
      extraConfig = {
        XDG_MISC_DIR = "${config.home.homeDirectory}/misc";
        XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/archive";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/media/books";
      };
    };
  };
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.associations.added = {
    # "application/octet-stream" = "flstudio.desktop;";
  };
}
