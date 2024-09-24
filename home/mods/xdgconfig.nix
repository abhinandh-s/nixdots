{ config, ... }:
{
  xdg = {
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["nemo.desktop"]; # Directories
        "text/plain" = ["nvim.desktop"]; # Plain text
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["onlyoffice-desktopeditors.desktop"]; # .docx
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["onlyoffice-desktopeditors.desktop"]; # .pptx
        "application/pdf" = ["zathura.desktop"]; # .pdf
        "application/zip" = ["xarchiver.desktop"];
        "text/*" = ["nvim.desktop"]; # Any text files
        "video/*" = ["mpv.desktop"]; # Any video files
        "x-scheme-handler/https" = ["firefox.desktop"]; # Links
        "x-scheme-handler/http" = ["firefox.desktop"]; # Links
        "x-scheme-handler/mailto" = ["firefox.desktop"]; # Links
        "image/*" = ["oculante.desktop"]; # Images
        "image/png" = ["oculante.desktop"];
        "image/svg+xml" = ["oculante.desktop"]; # Correct MIME type for SVG
        "image/jpeg" = ["oculante.desktop"];
      };
      associations.added = {
        # "application/octet-stream" = "flstudio.desktop;";
      };
    };
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
}
