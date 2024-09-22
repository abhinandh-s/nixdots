{
config,
... 
}
:
{
	systemd.services.mpd.environment = {
		XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.abhi.uid}";
	};
	services.mpd = {
		enable = true;
		musicDirectory = "/home/abhi/music";
		playlistDirectory = "/home/abhi/music";
		network.port = 6600;
		startWhenNeeded = true;
		extraConfig = ''
		auto_update "yes"
			audio_output {
        type            "pipewire"
        name            "PipeWire Sound Server"
}

audio_output {
       type	"fifo"
       name	"Visualizer feed"
       path	"/tmp/mpd.fifo"
       format	"44100:16:2"
}
		'';
	network.listenAddress = "127.0.0.1"; # if you want to allow non-localhost connections
	};
	# recomented workaround from wiki
	services.mpd.user = "abhi";
}

		# type         "pipewire"
		# name         "My PipeWire Output"
		# path         "/tmp/mpd.fifo"
		# format       "44100:16:2"
					 
		# 1
		
		# type        "alsa"
		# name        "My ALSA"
		# device      "default"  # or "hw:0,0" based on your setup
		# mixer_type  "software"  # or "hardware" depending on your system<D-g>

		# 2

		# type "alsa"
		# name "My ALSA"
		# device			"hw:0,0"	# optional 
		# format			"44100:16:2"	# optional
		# mixer_type		"hardware"
		# mixer_device	"default"
		# mixer_control	"PCM"

		# Optional:
		# network.listenAddress = "any"; # if you want to allow non-localhost connections

