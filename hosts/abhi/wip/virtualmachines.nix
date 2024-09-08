{ config, pkgs, ... }:
{
    virtualisation.virtualbox.host.enable = true;
   virtualisation.virtualbox.guest.enable = true;
   #virtualisation.virtualbox.host.enable = true;
   #virtualisation.virtualbox.host.enableExtensionPack = false;
   #virtualisation.virtualbox.host.enableKvm = true;
   #users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];
}
