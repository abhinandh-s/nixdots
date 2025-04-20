{
  lib,
  inputs,
  ...
}: let
  dwmPackage = inputs.dwm.packages.x86_64-linux.default;
  # how to properly patch this?
  dwmPackage2 = inputs.dwm.packages.x86_64-linux.default.overrideAttrs (oldAttrs: {
    postPatch = ''
      cp ${./../../custom/pkgs/dwm/config.h} $out/config.h
    '';
  });
in {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    xkb.options = "caps:escape_shifted_capslock";
    windowManager = {
      qtile.enable = true;
      leftwm.enable = true;
      dwm.enable = true;
    };
  };
  services.xserver.windowManager.dwm.package = dwmPackage;
  # pkgs.dwm.overrideAttrs {
  #   src = pkgs.fetchFromSourcehut {
  #     owner = "~abhinandh";
  #     repo = "dwm";
  #     rev = "0031712dcf6dd51de6d347bdf7f7c6b57bdeb6e3";
  #     sha256 = "sha256-R5r8CwE33XsxwJflEd2KKea4RyYC0ob9cyGyx6VO78E=";
  #   };
  #   postPatch = ''
  # echo "-----------------------------------------------"
  # echo "Copying config.h directly to the src directory"
  # '';
  # };

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
