{ config, lib, pkgs, ... }:

{
networking.hostName = "nixos"; # Define your hostname.

  networking = {
    # interfaces.wlp0s29u1u3 = {
    #   ipv4.addresses = [{
    #     address = "192.168.1.111";
    #     prefixLength = 24;
    #   }];
    # };
  };
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 21 ];
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
      {from = 51000; to = 51999; }
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # services.vsftpd = {
  #   enable = true;
  #   localUsers = true;
  #   writeEnable = true;
  #   userlist = [ "abhi" ];
  #   anonymousUser = true;
  #   anonymousUserNoPassword = true;
  # };

}
