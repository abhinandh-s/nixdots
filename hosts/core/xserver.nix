{ lib, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "caps:escape_shifted_capslock";
    windowManager = {
      qtile = {
        enable = true;
        backend = "wayland";
      };
      dwm.enable = true;
    };
  };
  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    # src = ../../custom/overlays/dwm;
    src = pkgs.fetchFromSourcehut {
      owner = "~abhinandh";
      repo = "dwm";
      rev = "5eb0555300516d088b77beec5d94acb88dfb037d";
      sha256 = "sha256-ZHzMMffWKuU0WcPPYWJdHMWuZnAn9CF/0g4Xktsf+Ic=";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        Background = lib.cleanSource ../../assets/wallpaper/wall-sddm.png;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
