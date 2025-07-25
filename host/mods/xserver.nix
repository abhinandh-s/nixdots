{
  lib,
  pkgs,
  inputs,
  ...
}: let
  # default_dwmPackage = inputs.dwm.packages.x86_64-linux.default;
  dwmPackage = import inputs.dwm {
    inherit pkgs;
    configFile = lib.cleanSource ./../../dots/dwm/config.h;
  };
in {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "caps:escape_shifted_capslock";
    windowManager = {
      qtile.enable = true;
      leftwm.enable = true;
      dwm = {
        enable = true;
        package = dwmPackage;
      };
    };
  };

  services.displayManager.sddm = {
    enable = true;
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        Background = lib.cleanSource ../../assets/wallpaper/wall-sddm.jpg;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
