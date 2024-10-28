{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    package = pkgs.jellyfin;
    group = "jellyfin";
    user = "abhi";  
    #  openFirewall = true;
    logDir = "/media/server/jellyfin/state/log";
    cacheDir = "/media/server/jellyfin/state/cache";
    dataDir = "/media/server/jellyfin/state/data";
    configDir = "/media/server/jellyfin/state/config";

  };
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
  hardware.opengl = {
    enable = true;
  };
}
