{lib, ... }:
{
  # WARN: not tested!
  
  # systemd.network.networks.wlp0s26u1u3 = {
  #   enable = false;
  #   dns = [ "194.242.2.6" ];
  #   gateway = [];
  # };
  networking = {
    hostName = "nixos";
    enableIPv6 = lib.mkForce false;
    nameservers = [
      # "194.242.2.6" #family.dns.mullvad.net
      # "194.242.2.9" # all.dns.mullvad.net
      # "194.242.2.5" #extended.dns.mullvad.net
      # TODO:
      # i have no idea why this is working when i put mullvad dns in /etc/resolv.conf
      # its not working
      "8.8.8.8" # google default
      "8.8.4.4" # google default
    ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
    interfaces = {
      # wlp0s26u1u3 = {
      #   ipv4 = {
      #     addresses = [{
      #       address = "192.168.1.200";
      #       prefixLength = 25;
      #     }];
      #   };
      # };
    };
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

