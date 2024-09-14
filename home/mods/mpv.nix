{
lib,
config,
pkgs,
...
}:
{
  programs.mpv = {
    enable = true;
    package = pkgs.mpv;
    scripts = with pkgs.mpvScripts; [
      mpris # MPRIS plugin for mpv
      uosc # Feature-rich minimalist proximity-based UI for MPV player
      memo # A recent files menu for mpv
      sponsorblock # Skips sponsored segments of YouTube videos
      quality-menu # Allows you to change youtube video quality (ytdl-format) on the fly
      visualizer # Various audio visualization
    ];
    # config is making mpv slower :( , but why?
    # config = {
    #   profile = "high-quality";
    #   ytdl-format = "bestvideo+bestaudio";
    #   cache-default = 4000000;
    # };
    bindings = {
      WHEEL_UP = "seek 10";
      WHEEL_DOWN = "seek -10";
      "Alt+0" = "set window-scale 0.5";
    };
  };
}
