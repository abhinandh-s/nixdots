{ lib, pkgs, ...}: {
  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

  # rtkit is optional but recommended
  security.rtkit.enable = lib.mkForce true;
  services.pipewire = {
    enable = true;
    # audio.enable = true; # Whether to use PipeWire as the primary sound server
    # package = pkgs.pipewire;
    /*
If true, a system-wide PipeWire service and socket is enabled 
allowing all users in the “pipewire” group to use it simultaneously. 
If false, then user units are used instead, restricting access to only one user.
*/
    alsa.enable = true;
    # alsa.support32Bit = true;
    pulse.enable = true; # Whether to enable PulseAudio server emulation.
    # If you want to use JACK applications, uncomment this
    jack.enable = false;
  };
}

#   configPackages = [
#     (pkgs.writeTextDir "share/bluetooth.lua.d/51-bluez-config.lua" ''
#       bluez_monitor.properties = {
#         ["bluez5.enable-sbc-xq"] = true,
#         ["bluez5.enable-msbc"] = true,
#         ["bluez5.enable-hw-volume"] = true,
#         ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
#       }
#     '')
#   ];
