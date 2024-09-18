{ config, lib, pkgs, ... }:
{
#  services.desktopManager.cosmic.enable = true;
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "caps:escape_shifted_capslock";
    windowManager = {
      qtile = {
        enable = true;
        backend = "x11";
      };
      dwm.enable = true;
      leftwm.enable = true;
      awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks # is the package manager for Lua modules
          luadbi-mysql # Database abstraction layer
        ];

      };
    };
  };

  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ../../custom/overlays/dwm;
  };

  services.displayManager.sddm = {
    enable = true; # Enable SDDM.
    sugarCandyNix = {
      enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
      settings = {
        Background = lib.cleanSource ../../assets/wallpaper/wall-sddm.png;
        #Background = lib.cleanSource ../../../assets/vivid_rainwld.jpg;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
