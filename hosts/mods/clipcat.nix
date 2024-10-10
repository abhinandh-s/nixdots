{ pkgs, ... }:{
	services.clipcat = {
		enable = true;
		package = pkgs.clipcat;
	};
}
