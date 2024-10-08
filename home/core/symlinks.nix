{ ... }
:
{
  home.file = {
    ".local/bin/slstatus".source = ../../custom/bin/slstatus;
    ".background-image".source = ../../assets/wallpaper/wallpaper-pink.avif;
    ".local/bin/autostart.sh".source = ../../custom/bin/autostart.sh;
    ".local/lib/spotifyadblock.so".source = ../../custom/bin/libspotifyadblock.so;
    ".ssh/id_ed25519.pub".source = ../../secrets/id_ed25519.pub;
  };
}
