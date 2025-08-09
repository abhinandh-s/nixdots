{
  description = "A very basic flake";

  inputs = {
    catppuccin.url = "/home/abhi/git/catppuccin-nix";
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs-unstable";  
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    dwm = {
      url = "github:abhinandh-s/dwm";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    brightness = {
      url = "github:abhinandh-s/brightness";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-fonts = {
      url = "github:abhinandh-s/nix-fonts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sddm-sugar-candy-nix = {
      url = "gitlab:Zhaith-Izaliel/sddm-sugar-candy-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    inherit (self) outputs;
    variables = (import ./variables.nix);
    performFullSetup = true;
  in {

  overlays = import ./overlays { inherit inputs; };
 
  nixosConfigurations = {
      abhi = nixpkgs.lib.nixosSystem {
          specialArgs = { 
            inherit inputs outputs;
            performFullSetup = performFullSetup;  
            variables = variables;  
          };
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
            inputs.sops-nix.nixosModules.sops
            inputs.sddm-sugar-candy-nix.nixosModules.default
            home-manager.nixosModules.home-manager (import ./home/home-manager.nix)
          ];
        };
     };
  };
}
