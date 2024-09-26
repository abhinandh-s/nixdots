{
... 
}
:
{
	services.mpd = {
		enable = true;
		musicDirectory = "/path/to/music";
		extraConfig = ''
			audio_output {
				type "pulse"
				name "Pulseaudio"
				mixer_type      "hardware"      # optional
				mixer_device    "default"       # optional
				mixer_control   "PCM"           # optional
				mixer_index     "0"             # optional
			}
		audio_output {
			type "pipewire"
			name "My PipeWire Output"
		}
		'';
		# Optional:
		network.listenAddress = "any"; # if you want to allow non-localhost connections
		startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
	};
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
#
# luke smith 
#
# 		auto_update "yes"
# 			audio_output {
# 	type            "pipewire"
# 	name            "PipeWire Sound Server"
# }
#
# audio_output {
#        type	"fifo"
#        name	"Visualizer feed"
#        path	"/tmp/mpd.fifo"
#        format	"44100:16:2"
# }
# 		'';
#
