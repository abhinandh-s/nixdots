{ config, pkgs, ... }:
{
    xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = ["nemo.desktop"]; # Directories
        "text/plain" = ["nvim.desktop"]; # Plain text
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = ["onlyoffice-desktopeditors.desktop"]; # .docx
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" = ["onlyoffice-desktopeditors.desktop"]; # .pptx
        "application/pdf" = ["onlyoffice-desktopeditors.desktop"]; # .pdf
        "application/zip" = ["xarchiver.desktop"];
        "text/*" = ["emacsclient.desktop"]; # Any text files
        "video/*" = ["mpv.desktop"]; # Any video files
        "x-scheme-handler/https" = ["firefox.desktop"]; # Links
        "x-scheme-handler/http" = ["firefox.desktop"]; # Links
        "x-scheme-handler/mailto" = ["firefox.desktop"]; # Links
        "image/*" = ["feh.desktop"]; # Images
        "image/png" = ["feh.desktop"];
        "image/jpeg" = ["feh.desktop"];
      };
    };
  };
}
