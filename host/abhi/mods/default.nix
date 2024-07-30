{ config, ... }:
{
	imports = [
		#	./emacs.nix
		#./ftp.nix
		#./kdeconnect.nix
		#./mpd.nix
		#./picom.nix
		./st.nix
		./syncthing.nix
		./qt.nix
		./userenv.nix
		# ./wireguard.nix
		#./virtualmachines.nix
		./xdg.nix
	];
}

