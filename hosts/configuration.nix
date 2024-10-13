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

  # programs.nushell.enable = true;
  environment.shells = with pkgs; [ fish ];
  users.defaultUserShell = pkgs.fish;
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

  sops = {
    defaultSopsFile = ./../secrets/secrets.yaml;
    age.keyFile = "/home/abhi/.config/sops/age/keys.txt";
    # This is the actual specification of the secrets.
    secrets = {
      y-key = {
        owner = "abhi";
        path = "/home/abhi/.local/share/age/key.txt";
        mode = "0600";
      };
      srht_access_token = {
        owner = "abhi";
        path = "/home/abhi/.config/hut/config";
        mode = "0600";
      };
      neomutt-pass = {
        owner = "abhi";
        path = "/home/abhi/.config/neomutt/password";
        mode = "4440"; # file permision
      };
      github_ssh_key = {
        owner = "abhi";
        path = "/home/abhi/.ssh/id_ed25519";
        mode = "0600"; # owner = rw- , group = ---, others = --- 
      };
      mobile_ssh_key = {
        owner = "abhi";
        path = "/home/abhi/.ssh/id_rsa";
        mode = "0644"; # owner = rw- , group = r--, others = r--
      };
      "kde_connect/trusted_device_keys" = {
        owner = "abhi";
        path = "/home/abhi/.config/kdeconnect/trusted_devices";
        mode = "0644";
      };
      "kde_connect/certificate_pem" = {
        owner = "abhi";
        path = "/home/abhi/.config/kdeconnect/certificate.pem";
        mode = "0644";
      };
      "kde_connect/privateKey_pem" = {
        owner = "abhi";
        path = "/home/abhi/.config/kdeconnect/privateKey.pem";
        mode = "0644";
      };
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
    {  users = [ "abhi" ];
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

  users = {
    mutableUsers = false;
    # If set to true, you are free to add new users and groups to the system with the ordinary useradd and groupadd commands.
    # must set to false for sops
    users.abhi = {
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.abhi_password.path;
      extraGroups = [ "wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio" ];
    };
    extraGroups.vboxusers.members = [ "abhi" ];
  };

  programs.neovim.defaultEditor = true;
  programs.nano.enable = false;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };



  system.stateVersion = "24.05";
}

