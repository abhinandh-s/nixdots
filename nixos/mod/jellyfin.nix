{ pkgs, ... }:
{
  services.jellyfin = {
    enable = true;
    package = pkgs.unstable.jellyfin;
    group = "jellyfin";
    user = "abhi";  
    openFirewall = true;
  };
  environment.systemPackages = with pkgs.unstable; [
    # jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
