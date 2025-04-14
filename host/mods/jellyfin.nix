{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    package = pkgs.unstable.jellyfin;
    group = "jellyfin";
    user = "abhi";  
    openFirewall = true;
/*
    logDir = "/home/abhi/.jellyfin/state/log";
    cacheDir = "/home/abhi/.jellyfin/state/cache";
    dataDir = "/home/abhi/.jellyfin/state/data";
    configDir = "/home/abhi/.jellyfin/state/config";
*/
  };
  environment.systemPackages = with pkgs.unstable; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
