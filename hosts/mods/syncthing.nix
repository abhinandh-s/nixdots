{ ... }:
{
  services = {
    syncthing = {
      enable = true;
      user = "abhi";
      # dataDir = "/home/abhi/docs";
      configDir = "/home/abhi/.config/syncthing";
      overrideDevices = true;     # overrides any devices added or deleted through the WebUI
      overrideFolders = true;     # overrides any folders added or deleted through the WebUI
      settings = {
        gui = {
          user = "abhi";
          password = "1234";
        };
        devices = {
          "abhiRedmi" = { id = "SAXOZRZ-UGHROMQ-4C6JFNA-PX4IMZK-Z2M74CN-6GYOUDM-RLTPU3B-DVOYCQZ"; };
        };
        folders = {
          "docs" = {         # Name of folder in Syncthing, also the folder ID
            enable = true;
            path = "/home/abhi/docs";    
            devices = [ "abhiRedmi" ];
            ignorePerms = false;  # By default, Syncthing doesn't sync file permissions. This line enables it for this folder.
            versioning = {
              type = "trashcan";
              params.cleanoutDays = "365";
            };
          };
          "music" = {
            enable = true;
            path = "/home/abhi/music";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "pictures" = {
            enable = true;
            path = "/home/abhi/pics/pictures";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "dcim" = {
            enable = true;
            path = "/home/abhi/pics/dcim";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
          "sync" = {
            enable = true;
            path = "/home/abhi/sync";
            devices = [ "abhiRedmi" ];
            ignorePerms = false;
          };
        };
      };
    };
  };
  #  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  #  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
}
