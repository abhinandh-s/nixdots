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
		./st.nix
		./syncthing.nix
		./qt.nix
		./userenv.nix
		# ./wireguard.nix
		#./virtualmachines.nix
		./xdg.nix
	];
}

