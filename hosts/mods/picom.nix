{pkgs, ...}:
{
	services.picom = {
		enable = true;
		# package = pkgs.picom-pijulius;
		package = pkgs.picom;
		settings = {
			#################################
			#       General Settings        #
			#################################
			backend = "glx";
			vsync = false;
			mark-wmwin-focused = true;
			mark-ovredir-focused = true;
			detect-rounded-corners = true;
			detect-client-opacity = true;
			refresh-rate = 60;
			detect-transient = true;
			detect-client-leader = true;
			log-level = "info";
	  };
	};
}
