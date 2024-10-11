{ pkgs, lib, config, ... }:

let
  inherit (lib) mkEnableOption mkPackageOption mkOption mkIf literalExpression;

  cfg = config.services.rbw;

  jsonFormat = pkgs.formats.json { };
in {
  meta.maintainers = with lib.hm.maintainers; [ abhinandh ];

  options.services.rbw = {
    enable = mkEnableOption "Rbw";

    package = mkPackageOption pkgs "rbw" { };

    settings = mkOption {
      type = jsonFormat.type;
      default = { };
      example = literalExpression ''
        {
          email = "usename@example.com";
          sync_interval = 3600;
        };
      '';
      description = ''
        Configuration written to {file}`$XDG_CONFIG_HOME/rbw/config.json`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."rbw/config.json" = mkIf (cfg.settings != { }) {
      source = jsonFormat.generate "config.json" cfg.settings;
    };
  };
}
