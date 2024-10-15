{
  description = "Abhi's NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    self,
    nur,
    nixpkgs,
    nixpkgs-unstable,
    sops-nix,
    agenix,
    firefox-addons,
    home-manager,
    sddm-sugar-candy-nix,
    spicetify-nix,
    ...
    }:
    let
      # to get random numbers
      seed = builtins.readFile ./random.txt;
      system = "x86_64-linux";
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

      };
    in {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ({ ... }: { nixpkgs.overlays = [ overlay-unstable ]; })
          ./hosts/configuration.nix

          sops-nix.nixosModules.sops
          agenix.nixosModules.default
          nur.nixosModules.nur

          sddm-sugar-candy-nix.nixosModules.default
          {
            nixpkgs = {
              overlays = [
                sddm-sugar-candy-nix.overlays.default
              ];
            };
          }

          home-manager.nixosModules.home-manager
          {
            home-manager.backupFileExtension = seed;
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.abhi = {
                imports = [
                  ./home/home.nix
                  spicetify-nix.homeManagerModules.default
                  agenix.homeManagerModules.default
                ];
                _module.args.colorpencil = import ./custom/themes/colorpencil;
              };
              sharedModules = [
                inputs.sops-nix.homeManagerModules.sops
              ];
              extraSpecialArgs = {
                inherit self inputs;
              };
            };
          }
        ];
      };
    };
}
