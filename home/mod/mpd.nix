{ pkgs, ... }:
{
  services.mpd = {
    enable = true;
    package = pkgs.mpd;
    network = {
      listenAddress = "127.0.0.1"; # or "any"
      port = 6600;
      startWhenNeeded = true;
    };
    musicDirectory = "/home/abhi/music";
    # playlistDirectory = "\${dataDir}/playlists";
    # dbFile = "\${dataDir}/tag_cache";
    # dataDir = "$XDG_DATA_HOME/mpd";
    extraArgs = [
      "--verbose"
    ];
    extraConfig = ''
audio_output {
    type "pipewire"
    name "My PipeWire Output"
  }
    '';
  };
}
