{ config, pkgs, ... }:
{
  xdg = {
    userDirs = {
      enable = true;

      desktop = "${config.home.homeDirectory}/desktop";
      download = "${config.home.homeDirectory}/downloads";
      documents = "${config.home.homeDirectory}/documents";
      music = "${config.home.homeDirectory}/music";
      videos = "${config.home.homeDirectory}/videos";
      pictures = "${config.home.homeDirectory}/pictures";
      templates = "${config.home.homeDirectory}/templates";
      publicShare = "${config.home.homeDirectory}/public";
      extraConfig = {
        XDG_MISC_DIR = "${config.home.homeDirectory}/misc";
      };
      createDirectories = true;

    };
  };
  #   xdg.desktopEntries = {
  #   spotify-adblock = {
  #     name = "Spotify (adblock)";
  #     genericName = "Music Player";
  #     exec = "env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U";
  #     terminal = false;
  #     categories = [ "Audio" "Music" "Player" "AudioVideo" ];
  #     mimeType = [ "x-scheme-handler/spotify" ];
  #   };
  # };
  #
  #  EDITOR = "nvim";
  # TERMINAL = "alacritty";

  #xdg.configFile."emacs/init.el".source  = ./init.el;
}
