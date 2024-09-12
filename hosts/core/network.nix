{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    # interfaces.wlp0s26u1u3 = {
    #   ipv4.addresses = [{
    #     address = "192.168.1.200";
    #     prefixLength = 24;
    #   }];
    # };
    firewall.enable = false;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}

#   # Open ports in the firewall
#   firewall = {
#     enable = true;
#     allowedTCPPorts = [ 53 21 ];
#     allowedUDPPorts = [ 53 51820 ];
#     allowedTCPPortRanges = [
#       { from = 1714; to = 1764; } # KDE Connect
#       {from = 51000; to = 51999; }
#     ];
#     allowedUDPPortRanges = [
#       { from = 1714; to = 1764; } # KDE Connect
#     ];
#   };

# Or disable the firewall altogether.

# services.vsftpd = {
#   enable = true;
#   localUsers = true;
#   writeEnable = true;
#   userlist = [ "abhi" ];
#   anonymousUser = true;
#   anonymousUserNoPassword = true;
# };

