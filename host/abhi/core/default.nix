{ config, ... }:
{
	imports = [
		./audio.nix
		./bootloader.nix
		./fonts.nix
		./locale.nix
		./network.nix
		./polkit.nix
		./xserver.nix
	];
}

