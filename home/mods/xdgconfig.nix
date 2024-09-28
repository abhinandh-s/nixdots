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
        "application/pdf" = ["org.kde.okular.desktop" "zathura.desktop" "firefox.desktop"]; # .pdf
        "application/zip" = ["xarchiver.desktop"];
        "text/*" = ["nvim.desktop"]; # Any text files
        "video/*" = ["mpv.desktop"]; # Any video files
        "x-scheme-handler/https" = ["firefox.desktop"]; # Links
        "x-scheme-handler/http" = ["firefox.desktop"]; # Links
        "x-scheme-handler/mailto" = ["firefox.desktop"]; # Links
        "image/*" = ["oculante.desktop"]; # Images
        "image/png" = ["oculante.desktop"];
        "image/avif" = ["oculante.desktop"];
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
      documents = "${config.home.homeDirectory}/docs";
      music = "${config.home.homeDirectory}/music";
      videos = "${config.home.homeDirectory}/videos";
      pictures = "${config.home.homeDirectory}/pics";
      templates = "${config.home.homeDirectory}/templates";
      extraConfig = {
        XDG_MISC_DIR = "${config.home.homeDirectory}/misc";
        XDG_ARCHIVE_DIR = "${config.home.homeDirectory}/archive";
        XDG_DOCS_ARCHIVE_DIR = "${config.home.homeDirectory}/docs/archive";
        XDG_BOOK_DIR = "${config.home.homeDirectory}/docs/books";
        XDG_ACADEMIC_DIR = "${config.home.homeDirectory}/docs/academic";
        XDG_ACADEMIC_10_DIR = "${config.home.homeDirectory}/docs/academic/ten";
        XDG_ACADEMIC_CMA_DIR = "${config.home.homeDirectory}/docs/academic/cma";
        XDG_ACADEMIC_CMA_REF_DIR = "${config.home.homeDirectory}/docs/academic/cma/refs";
        XDG_ACADEMIC_CMA_CAPTURE_DIR = "${config.home.homeDirectory}/docs/academic/cma/capture";
      };
    };
  };
}
