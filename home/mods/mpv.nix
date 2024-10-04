{
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
    config = {
      sub-auto = "fuzzy";
      slang = "en,eng,enUS,en-US";
      ytdl-raw-options = "";
      # profile = "high-quality";
      ytdl-format = "bestvideo[height<=?480]+bestaudio/best";
      # ytdl-format = "bestvideo+bestaudio";
      # cache-default = 4000000;
    };
    bindings = {
      WHEEL_UP = "seek 10";
      WHEEL_DOWN = "seek -10";
      "Alt+0" = "set window-scale 0.5";
    };
  };

  programs.yt-dlp = {
    enable = true;
    package = pkgs.yt-dlp;
    settings = {
      embed-thumbnail = true;
      embed-subs = true;
      write-auto-sub = true; #
      add-metadata = true; #
      sub-langs = "all";
      downloader = "aria2c";
      downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
    };
    extraConfig = ''
      # --update
      # -F
      --ignore-errors
      -o ~/videos/%(title)s.%(ext)s
    '';
  };
}
