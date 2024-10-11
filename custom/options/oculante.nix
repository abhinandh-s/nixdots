{ pkgs, lib, config, ... }:

let
  inherit (lib) mkEnableOption mkPackageOption mkOption mkIf literalExpression;

  cfg = config.programs.oculante;

  jsonFormat = pkgs.formats.json { };
in {
  meta.maintainers = with lib.hm.maintainers; [ abhinandh ];

  options.programs.oculante = {
    enable = mkEnableOption "Oculante";

    package = mkPackageOption pkgs "oculante" { };

    settings = mkOption {
      type = jsonFormat.type;
      default = { };
      example = literalExpression ''
        {
          accent_color = [250,131,202],
          background_color = [0,0,0],
        };
      '';
      description = ''
        Configuration written to {file}`$XDG_CONFIG_HOME/oculante/config.json`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ cfg.package ];

    xdg.configFile."oculante/config.json" = mkIf (cfg.settings != { }) {
      source = jsonFormat.generate "config.json" cfg.settings;
    };
  };
}
