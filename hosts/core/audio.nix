{ ... }:
{
  # sound.enable = true;
  # security.rtkit.enable = true;
  services = {
    pipewire = {
      enable = true;
      # systemWide = true; not recommended
      audio.enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      jack.enable = false;
    };
  };


  # Remove sound.enable or set it to false if you had it set previously, as sound.enable is only meant for ALSA-based configurations

  # rtkit is optional but recommended
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # If you want to use JACK applications, uncomment this
  #jack.enable = true;
  # };
}
