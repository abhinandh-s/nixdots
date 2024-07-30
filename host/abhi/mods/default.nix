{ config, ... }:
{
	imports = [
		./audio.nix
		./bootloader.nix
		#	./emacs.nix
		./fonts.nix
		./ftp.nix
		./locale.nix
		./kdeconnect.nix
		#./mpd.nix
		./network.nix
		./picom.nix
		./polkit.nix
		./st.nix
		./syncthing.nix
		./qt.nix
		./userenv.nix
		# ./wireguard.nix
		#./virtualmachines.nix
		./xdg.nix
		./xserver.nix
	];
}

