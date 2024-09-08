
{ config, pkgs, ... }:

let
  userName = "abhi";
in
{
  home.username = userName;
  home.homeDirectory = "/home/${userName}";
  
  services.mpd = {
    enable = true;
    dataDir = "/home/abhi/.local/share/mpd/data";
    dbFile = "/home/abhi/.local/share/mpd/db";
    musicDirectory = "/home/${userName}/Music";
    # playlistDirectory = "/home/${userName}/mus/playlists"; # Uncomment if needed
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
      startWhenNeeded = true;
    };
    extraConfig = ''
      audio_output {
        type      "httpd"
        name      "net_music"
        encoder   "vorbis"
        port      "8000"
        bitrate   "128"
        format    "44100:16:1"
        always_on "no"
        tags      "yes"
      }
      audio_output {
        type      "pipewire"
        name      "pipewire"
      }
      audio_output {
        type      "fifo"
        name      "my_fifo"
        path      "/tmp/mpd.fifo"
        format    "44100:16:2"
      }
    '';
  };

}

