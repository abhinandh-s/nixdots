{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "abhi";
    userEmail = "ugabhi@proton.me";
  };
}
