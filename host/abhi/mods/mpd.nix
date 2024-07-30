{ config, pkgs, ... }:
{
	services.mpd = {
		enable = true;
		musicDirectory = "/home/abhi/Music";
		playlistDirectory = "/home/abhi/Music";
		dbFile = "/home/abhi/.local/share/mpd/cache";
		dataDir = "/home/abhi/.local/share/mpd/data";
		network.port = 6600;
		startWhenNeeded = true;
		extraConfig = ''
			auto_update "yes"
				audio_output {
					type         "pipewire"
					name         "PipeWire Sound Server"
					path         "/tmp/mpd.fifo"
					format       "44100:16:2"
				}
		'';

		# Optional:
		network.listenAddress = "127.0.0.1"; # if you want to allow non-localhost connections

	};
	# recomented workaround from wiki
	services.mpd.user = "abhi";
}
