{ config, ... }:
{
  home.file.".local/bin/slstatus".source  = ../../../custom/patches/slstatus/slstatus;
}
