{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    (dmenu.overrideAttrs (oldAttrs: rec {
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      # me added this now
      src = ../../custom/overlays/dmenu;
      patches = [
        #./path/to/local.diff

        (fetchpatch {
          url = "https://tools.suckless.org/dmenu/patches/center/dmenu-center-5.2.diff";
          sha256 = "sha256-g7ow7GVUsisR2kQ4dANRx/pJGU8fiG4fR08ZkbUFD5o=";
        })
        (fetchpatch {
          url = "https://tools.suckless.org/dmenu/patches/dracula/dmenu-dracula-20211128-d78ff08.diff";
          sha256 = "sha256-gdWMymgGNfU0rA2inl1bqlGyLMKyBpB3zhDuPn61Ga8=";
        })
      ];
      configFile = writeText "config.def.h" (builtins.readFile ../../../custom/overlays/dmenu/config.h);
      postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))
  ];
}
