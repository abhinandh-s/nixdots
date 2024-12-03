# Chapter 1

This chapter walks you through setting up a basic NixOS system. We'll aim to create a system setup comparable to a standard Linux distribution

0. Flake

Why Flakes?

Flakes provide a structured way to manage configurations, packages, and environments in NixOS. They enable reproducible builds, improve modularity, and offer a cleaner workflow for managing system and user configurations.

## Enable flakes permanently in NixOS

Add the following to the system configuration:

```nix
# configuration.nix

nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

While we're here, let me show you something.

You can also write the above code like this:


```nix
# configuration.nix

nix = {
    settings = {
        experimental-features = [ "nix-command" "flakes" ];
    };
};
```

This might not make sense right now, but it will help a lot in the readability of your code. This way, you can combine many options with the same root, like this: 

```nix
nix.settings.auto-optimise-store = true;
nix.settings.experimental-features = ["nix-command" "flakes"];
nix.settings.system-features = [ "big-parallel" ];
nix.gc.automatic = true;
nix.gc.dates = "weekly";
nix.gc.options = "--delete-older-than 7d";
```

is same as:

```nix
nix = {
    settings = {
        auto-optimise-store = true;
        experimental-features = ["nix-command" "flakes"];
        system-features = [
            "big-parallel"
        ];
    };
    gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
    };
};
```
By grouping related settings together, the nested structure improves readability and makes it easier to manage configurations as they grow in complexity.

Feel free to copy the files from /etc/nixos/ to your home/user/some/dir.

> Note: If Nix complains about missing files during a build (e.g., I can't find that file), it's often because the files haven't been staged or committed. Always check whether the files are properly staged.

Once flakes are enabled, set up your file structure like this:


```bash
.
├── flake.nix 
├── configuration.nix
└── hardware-configuration.nix
```

ref: https://nixos.wiki/wiki/Flakes#Importing_packages_from_multiple_channels

```nix
{
  description = "NixOS configuration with two or more channels";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
        # unstable = import nixpkgs-unstable {
        #   inherit system;
        #   config.allowUnfree = true;
        # };

      };
    in {
      nixosConfigurations."<hostname>" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./configuration.nix
        ];
      };
    };
}
```

A lot is happenning here.


```nix
{
  description = "NixOS configuration with two or more channels";
```
Just a description can be anything
```nix
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11"; # pinning branch # https://github.com/NixOS/nixpkgs/tree/nixos-24.11
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # https://github.com/NixOS/nixpkgs/tree/nixos-unstable
  };
```

`inputs` are were you describe from where you need to install pkgs. And for inputs to work we need to pass in source (eg: github, gitlab, local, etc), url and in some cases rev and hash etc. here since its from nixpkgs itself we dont need to pass in full url and source. nix will infer it. all we need is repo name/branch name.
ie, if you need an old package from nixpkgs branch 23.05 we can add 

```nix
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11"; # pinning branch https://github.com/NixOS/nixpkgs/tree/nixos-24.11
    nixpkgs-23-05.url = "nixpkgs/nixos-23.05"; # pinning branch https://github.com/NixOS/nixpkgs/tree/nixos-23.05
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # https://github.com/NixOS/nixpkgs/tree/nixos-unstable
  };
```

and to install programs from github repos which have flake 
```nix
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11"; # pinning branch https://github.com/NixOS/nixpkgs/tree/nixos-24.11
    nixpkgs-23-05.url = "nixpkgs/nixos-23.05"; # pinning branch https://github.com/NixOS/nixpkgs/tree/nixos-23.05
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # https://github.com/NixOS/nixpkgs/tree/nixos-unstable
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs"; # putting this on every input is a good practice.
          # cuz, while building the flake that user have also specified inputs in the flake just like us.
          # So, when we put his flake here nix will add those inputs to our config.
          #
          ## How thats a bad thing
          #
          # For the reproductive thing to work nix takes the hash of commits from github and store it in flake.lock
          # so when you add input nix will look in the github repo and identify the latest commit hash and lock it in flake.lock file.
          # ie, our packeges version is locked by that commit.
          # then every time you do rebuild your system, your packages won't be updated as the commit is locked.
          # Hence your configuration wont break when you or someone else use the same flake as both are downloading packages from same commit.
          # On a high level this is the reproducive nix offering.
          #
          # here when we put `inputs.nixpkgs.follows = "nixpkgs";` we are telling nix to take commits of nixpkgs for building firefox from our flake.
          # otherwise nix will take commits from the firefox's flake and result in downloading appro. 50mb snapshot in nixpkgs of that input commit.
          # it will led to long rebuild time in future.
    };
  };
```


```nix

  outputs = { self, nixpkgs, nixpkgs-unstable }:
    let
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = nixpkgs-unstable.legacyPackages.${prev.system};
        # use this variant if unfree packages are needed:
        # unstable = import nixpkgs-unstable {
        #   inherit system;
        #   config.allowUnfree = true;
        # };

      };
    in {
      nixosConfigurations."<hostname>" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # Overlays-module makes "pkgs.unstable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./configuration.nix
        ];
      };
    };
}
```







1. wallpaper

2. audio
3. rofi
4. display manager
5. sops

