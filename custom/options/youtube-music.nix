{ pkgs, lib, config, ... }:

let
  inherit (lib) mkEnableOption mkPackageOption mkOption mkIf literalExpression;

  cfg = config.programs.youtube-music;

  jsonFormat = pkgs.formats.json { };
in {
  meta.maintainers = with lib.hm.maintainers; [ abhinandh ];

  options.programs.youtube-music = {
    enable = mkEnableOption "youtube-music";

    package = mkPackageOption pkgs "youtube-music" { };

    settings = mkOption {
      type = jsonFormat.type;
      default = { };
      example = literalExpression ''
        {
          sync_interval = 3600;
        };
      '';
      description = ''
        Configuration written to {file}`$XDG_CONFIG_HOME/Youtube Music/config.json`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."YouTube Music/config.json" = mkIf (cfg.settings != { }) {
      source = jsonFormat.generate "config.json" cfg.settings;
    };
  };
}
