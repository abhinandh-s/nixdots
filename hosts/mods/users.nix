{
  pkgs,
  config,
  ...
}: {
  sops.secrets.abhi_password.neededForUsers = true;
  sops.secrets.abhinav_password.neededForUsers = true;
  sops.secrets.caretaker_password.neededForUsers = true;

  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;
    # If set to true, you are free to add new users and groups to the system with the ordinary useradd and groupadd commands.
    # must set to false for sops
    users = {
      abhi = {
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets.abhi_password.path;
        extraGroups = ["wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio"];
      };
      caretaker = {
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets.caretaker_password.path;
        extraGroups = ["wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio"];
      };
    };

    extraGroups.vboxusers.members = ["abhi"];
  };
  security.sudo.extraRules = [
    {
      users = ["abhi"];
      commands = [
        {
          command = "ALL";
          options = ["NOPASSWD"]; # not working its still asking for pass every time i mount my harddisk, but now it not asking any password for sudo in terminal!
        }
      ];
    }
  ];
}
