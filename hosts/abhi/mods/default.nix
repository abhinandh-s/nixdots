{ config, ... }:
{
	imports = [
		./emacs.nix
		./ftp.nix
		#./kdeconnect.nix
		./mpd.nix
		./jellyfin.nix
		# ./nextclould.nix
		./picom.nix
		#./dmenu.nix
		#	./slstatus.nix
		./st.nix
		./syncthing.nix
		./qt.nix
		./userenv.nix
		# ./wireguard.nix
		#./virtualmachines.nix
		./xdg.nix
	];
}

