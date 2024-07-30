
{ config, lib, pkgs, ... }:
{
  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    audio.enable = true;
  };

}
