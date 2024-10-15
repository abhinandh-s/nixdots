{ pkgs, config, ... }:
{
  imports =
    [
      ./core
      ./mods
    ];

  boot.kernelModules = ["i2c-dev"];
  services.udev.extraRules = ''
        KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  environment = {
    shells = with pkgs; [ fish ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };
  };

  programs.fish.enable = true;

#   system.userActivationScripts = { homeManagerBackupSetup = {
#     text = ''
#    #   mkdir -p ~/.local/share/homeManagerBackupSetup
#    #   ${pkgs.coreutils.all}/bin/shuf -i 1000-99999999 -n 1 > ~/.local/share/homeManagerBackupSetup/random.txt"
#     '';
#     deps = [];
#   };
# };


  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [
        "kitty.desktop"
      ];
    };
  };




  programs.mtr.enable = true; # A network diagnostics tool
  programs.gnupg.agent = {
    enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
  };

  services.udisks2 = {
    enable = true;
    mountOnMedia = true; 
  };

  security.sudo.extraRules= [
    {
      users = [ "abhi" ];
      commands = [
        { command = "ALL" ;
          options= [ "NOPASSWD" ]; # not working its still asking for pass every time i mount my harddisk, but now it not asking any password for sudo in terminal!
        }
      ];
    }
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      system-features = [
        "big-parallel"
      ];
    };
    gc = {
      # automatic = true;
      # dates = "weekly";
      # options = "--delete-older-than 7d";
    };
  };

  sops.secrets.abhi_password.neededForUsers = true;
  sops.secrets.abhinav_password.neededForUsers = true;
  sops.secrets.caretaker_password.neededForUsers = true;

  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;
# If set to true, you are free to add new users and groups to the system with the ordinary useradd and groupadd commands.
# must set to false for sops
    users.abhi = {
	    isNormalUser = true;
	    hashedPasswordFile = config.sops.secrets.abhi_password.path;
	    extraGroups = [ "wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio" ];
    };
    users.abhinav = {
	    isNormalUser = true;
	    hashedPasswordFile = config.sops.secrets.abhinav_password.path;
	    extraGroups = [ "wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio" ];
    };
    users.caretaker = {
	    isNormalUser = true;
	    hashedPasswordFile = config.sops.secrets.caretaker_password.path;
	    extraGroups = [ "wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio" ];
    };
    extraGroups.vboxusers.members = [ "abhi" ];
  };

  programs.neovim.defaultEditor = true;
  programs.nano.enable = false;




  system.stateVersion = "24.05";
}

