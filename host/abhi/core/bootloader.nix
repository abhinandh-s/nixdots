
{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 7;
  };

  boot.loader.efi.canTouchEfiVariables = true;

}
