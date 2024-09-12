{ pkgs, ... }:{
	services.jellyfin = {
		enable = true;
		group = "jellyfin";
		user = "abhi";
	};

  hardware.opengl = {
    enable = true;
  };

	#      logDir =
	#      cacheDir =
	#      openFirewall =
	#      dataDir =
	#      configDir =
}
