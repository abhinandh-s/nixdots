{ pkgs }:
{
# covered all options
  services.redshift = {
    enable = true;
    tray = false;
    package = pkgs.redshift;
    provider = "manual"; # one of "manual", "geoclue2"
    latitude = 9.5475023;
    longitude = 76.7777895;
    # dawnTime = "6:00-7:45"; # must be HH:MM in 24-hour format
    # duskTime = "18:35-20:15";
    # settings = {
    #   redshift = {
    #     adjustment-method = "randr";
    #   };
    #   randr = {
    #     screen = 0;
    #   };
    # };
    # temperature.night = 3700;
    # temperature.day = 5500;
    # enableVerboseLogging = false;
  };
}
