{ ... }
:
let
  kdeconnect_config = ''[General]
name=nixos'';
in 
  {
  home.file = {
    # ".local/bin/slstatus".source = ../../custom/bin/slstatus;
    ".background-image".source = ../../assets/wallpaper/wallpaper-pink.avif;
    ".local/bin/autostart.sh".source = ../../custom/bin/autostart.sh;
    ".ssh/id_ed25519.pub".source = ../../secrets/id_ed25519.pub;
    ".config/kdeconnect/config".text = kdeconnect_config;

  };
}
