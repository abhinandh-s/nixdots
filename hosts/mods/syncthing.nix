{ ... }:
{
  services = {
    syncthing = {
      enable = true;
      user = "abhi";
      dataDir = "/home/abhi/docs";
      configDir = "/home/abhi/documents/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      settings = {
        devices = {
          "abhiRedmi" = { id = "LF2YTKF-EVNXLBP-6WQXGAL-L7W4RWO-6ZI5IWE-BOW5MPS-NSB33OL-CI4LTA5"; };
        };
        folders = {
          "docs" = {         # Name of folder in Syncthing, also the folder ID
            path = "/home/abhi/docs";    
            devices = [ "abhiRedmi" ];
            ignorePerms = false;  # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
          };
          "music" = {
            path = "/home/abhi/music";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "pictures" = {
            path = "/home/abhi/pics/pictures";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "dcim" = {
            path = "/home/abhi/pics/dcim";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "sync" = {
            path = "/home/abhi/sync";
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

  #  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  #  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
