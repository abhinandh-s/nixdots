{lib, pkgs, ...}: {
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;

    wireplumber = {
      enable = true;
      configPackages = [
        (pkgs.writeTextDir "share/bluetooth.lua.d/51-bluez-config.lua" ''
          bluez_monitor.properties = {
            ["bluez5.enable-sbc-xq"] = true,
            ["bluez5.enable-msbc"] = true,
            ["bluez5.enable-hw-volume"] = true,
            ["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
          }
        '')
      ];
    };
  };

  hardware.pulseaudio.enable = lib.mkForce false;
}

  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

  # # rtkit is optional but recommended
  # sound.enable = true;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa = {
  #     enable = true;
  #     support32Bit = true;
  #   };
  #   pulse.enable = true;
  #   jack.enable = false;
  # };
  #


  # sound.enable = true;
  # hardware.pulseaudio = {
  #   enable = true;
  #   systemWide = true;
  #   package = pkgs.pulseaudioFull;
  #   support32Bit = true;    ## If compatibility with 32-bit applications is desired.
  #   extraConfig = "load-module module-combine-sink module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  # };
  # users.extraUsers.abhi.extraGroups = [ "audio" ];
  # nixpkgs.config.pulseaudio = true;
  #

  # security.rtkit.enable = true;
  # services = {
    # pipewire = {
    #   enable = true;
    #   # systemWide = true; not recommended
    #   audio.enable = true;
    #   pulse.enable = true;
    #   alsa = {
    #     enable = true;
    #     support32Bit = true;
    #   };
    #   jack.enable = false;
    # };
  # };
# }


#
# { ... }:
# {
#   sound.enable = true;
#   # security.rtkit.enable = true;
#   services = {
#     pipewire = {
#       enable = true;
#       # systemWide = true; not recommended
#       audio.enable = true;
#       pulse.enable = true;
#       alsa = {
#         enable = true;
#         support32Bit = true;
#       };
#       jack.enable = false;
#     };
#   };
# }
