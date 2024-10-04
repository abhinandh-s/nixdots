{ pkgs, ... }:
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


programs.gnupg.agent = {
   enable = true;
    # pinentryPackage = pkgs.pinentry-gnome3;
   enableSSHSupport = true;
};


  services.udisks2.enable = true;

  security.sudo.extraRules= [
    {  users = [ "abhi" ];
      commands = [
        { command = "ALL" ;
          options= [ "NOPASSWD" ]; # not working its still asking for pass every time i mount my harddisk
        }
      ];
    }
  ];

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      # automatic = true;
      # dates = "weekly";
      # options = "--delete-older-than 7d";
    };
  };

  users.users.abhi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "netdev" "root" "i2c" "mpd" "audio" ];
  };

  programs.neovim.defaultEditor = true;
  programs.nano.enable = false;

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };


  users.extraGroups.vboxusers.members = [ "abhi" ];
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "24.05";
}

