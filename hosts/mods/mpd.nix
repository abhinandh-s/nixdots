{ ... }:
{
	services.mpd = {
		enable = true;
		musicDirectory = "/home/abhi/music";
		playlistDirectory = "/home/abhi/music";
		# dbFile = "/home/abhi/.local/share/mpd/cache";
		# dataDir = "/home/abhi/.local/share/mpd/data";
		network.port = 6600;
		startWhenNeeded = true;
		extraConfig = ''
			auto_update "yes"
				audio_output {
					 # type        "alsa"
					 # name        "My ALSA"
					 # device      "default"  # or "hw:0,0" based on your setup
					 # mixer_type  "software"  # or "hardware" depending on your system<D-g>


					type "alsa"
					name "My ALSA"
					device			"hw:0,0"	# optional 
					format			"44100:16:2"	# optional
					mixer_type		"hardware"
					mixer_device	"default"
					mixer_control	"PCM"
  			}
		'';
		# type         "pipewire"
		# name         "My PipeWire Output"
		# path         "/tmp/mpd.fifo"
		# format       "44100:16:2"

		# Optional:
		network.listenAddress = "127.0.0.1"; # if you want to allow non-localhost connections
		# network.listenAddress = "any"; # if you want to allow non-localhost connections
	};
	# recomented workaround from wiki
	services.mpd.user = "abhi";
}
