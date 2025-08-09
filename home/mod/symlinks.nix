{
  config,
  pkgs,
  ...
}: let
#  selectedColor = config.my.colorpencil.option;
#
#  wallpaper = if selectedColor == "red"
#      then pkgs.lib.cleanSource ../../assets/wallpaper/wallpaper-pink.avif
#    else if selectedColor == "black"
#      then pkgs.lib.cleanSource ../../assets/wallpaper/kali-linux-wallpaper-v1.png
  #    else pkgs.lib.cleanSource ../../assets/wallpaper/wallpaper-pink.avif;

  wallpaper = pkgs.lib.cleanSource ../../assets/wallpaper/wallpaper-pink.avif;

  kdeconnect_config = ''    [General]
    name=nixos'';
in {
  home.file = {
    # ".local/bin/slstatus".source = ../../custom/bin/slstatus;
    ".background-image".source = "${wallpaper}";
    ".local/bin/autostart.sh".source = ../../custom/bin/autostart.sh;
    # ".ssh/id_ed25519.pub".source = ../../secrets/id_ed25519.pub;
    ".config/kdeconnect/config".text = kdeconnect_config;
  };

  xdg.configFile = {
    "calibre/themes/catppuccin/mocha/red.calibre-palette".source = let
      repo = pkgs.fetchFromGitHub {
        "owner" = "catppuccin";
        "repo" = "calibre";
        "rev" = "27bd12d2d8dcd24b9ce7cae32135fbd41b896921";
        "hash" = "sha256-JnovYvkIjQXHMFWsmAYIKiA1aexDI3+IkuwwpRdMIcs=";
      };
    in "${repo}/themes/mocha/catppuccin-mocha-red.calibre-palette";
  };

  home.file = {
    "templates/rust/flake.nix".source = ../../shells/rust/flake.nix;
    # "templates/rust/flake.lock".source = ../../shells/rust/flake.lock; lock file must not be a symlink
    "templates/rust/rust-toolchain.toml".source = ../../shells/rust/rust-toolchain.toml;
  };
}
