{ pkgs, ... }:
{
  services.flameshot = {
    enable = true;
    package = pkgs.flameshot;
    settings = {
      General = {
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        savePath = "/home/abhi/pics/screenshots";
        savePathFixed = true;
        saveAsFileExtension = ".png";
        filenamePattern = "%F_%H-%M";
        drawThickness = 1;
        copyPathAfterSave = true;
      };
      #   Shortcuts = {
      #  YPE_EXIT = "q";
      # };
    };
  };
}
