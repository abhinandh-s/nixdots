{ ... }:
{


  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };



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
}


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
