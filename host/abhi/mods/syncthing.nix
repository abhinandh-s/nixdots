{ config, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      user = "abhi";
      dataDir = "/home/abhi/Documents";
      configDir = "/home/abhi/Documents/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
        overrideFolders = true;     # overrides any folders added or deleted through the WebUI
        settings = {
          devices = {
            "abhiRedmi" = { id = "HYIGN63-BVCE5Z4-DITWB6P-UXEEAMI-OZEXFFZ-HLOFJJP-PILOGS6-Z54U6AX"; };
          };
          folders = {
            "Documents" = {         # Name of folder in Syncthing, also the folder ID
              path = "/home/abhi/Documents";                                    devices = [ "abhiRedmi" ];
              ignorePerms = false;  # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
            };
            "Music" = {
            path = "/home/abhi/Music";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "Sync" = {
            path = "/home/abhi/Sync";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
        };
      };
    };
  };

  services.syncthing.settings.gui = {
    user = "abhi";
    password = "1234";
  };

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
