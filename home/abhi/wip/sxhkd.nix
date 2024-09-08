{
config,
pkgs,
...
}:
{
  services.sxhkd = {
    enable = true;
    package = pkgs.sxhkd;
    keybindings = {
      "super + g" = "firefox";
      "super + F1" = "firefox";
    };
  };
}
