{ config, pkgs, ... }:
{
  services.conky = {
  enable = true;
  package = pkgs.conky;
  extraConfig = ''
conky.config = {
--==============================================================================

--==============================================================================
    '';
  };
}
