{ config, lib, pkgs, ... }:
{
  option.is_full_install = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "TODO";
  };

  config = lib.mkIf 
    config.is_full_install [
      ./pkgs.nix 
    ];
}
