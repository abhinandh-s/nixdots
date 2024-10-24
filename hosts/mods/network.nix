# TODO:
# write good docummentation
# refs: https://nixos.org/manual/nixos/stable/#sec-ipv4
{lib, ... }:
{
  networking = {
    hostName = "nixos";
    enableIPv6 = lib.mkForce false;
    nameservers = [
      # "194.242.2.6" #family.dns.mullvad.net
      # "194.242.2.9" # all.dns.mullvad.net
      # "194.242.2.5" #extended.dns.mullvad.net
      # FIXME:
      # i have no idea why this is not working when i put mullvad dns in /etc/resolv.conf
      "8.8.8.8" # this is default [ google ]
      "8.8.4.4" # this is default [ google ] 
    ];
    networkmanager = {
      enable = true;
      dns = "none";
    };
    interfaces = {
      wlp0s26u1u3 = {
        ipv4 = {
          addresses = [{
            address = "192.168.1.200";
            prefixLength = 24;
          }];
        };
      };
    };
    /*

* If you are using WPA2 you can generate pskRaw key using wpa_passphrase:

usage: wpa_passphrase <ssid> [passphrase]

abhi@nixos ~> wpa_passphrase "abhi@redmi" "abhinandh"

network={
ssid="abhi@redmi"
#psk="abhinandh"
psk=9e2b7d851682746ce121cd1c93d49813eab11b6c94746c8c46afe93883d703f0
}

*/
    wireless.networks = { # wpa_supplicant
      "abhi@redmi" = { # SSID with spaces & special characters
        pskRaw = "9e2b7d851682746ce121cd1c93d49813eab11b6c94746c8c46afe93883d703f0";
      };
    };
    firewall = {
      enable = lib.mkForce true;
      allowedTCPPorts = [ 80 443 ];
      allowedTCPPortRanges = [
        { from = 4000; to = 4007; }
        { from = 8000; to = 8010; }
      ];
    };
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true; # this will open TCP port 22 (ssh)

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

