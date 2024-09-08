{ config, ... }:
{
	imports = [
		./audio.nix
		./bootloader.nix
		./fonts.nix
		./hardware-configuration.nix
		./locale.nix
		./network.nix
		./pkgs.nix
		./polkit.nix
		./xserver.nix
	];
}

