{ config, pkgs, ... }:
{
  services.gvfs = {
    enable = true;
    package = pkgs.gnome.gvfs;
  };

  services.gnome.gnome-keyring.enable = true; 
}

/*

For me this solved this error on nemo while connecting to server ( FTP )

The error:

Can't load the supported server method list.
Please check your GVfs installation.

gnome.gnome-keyring

For storing store secrets, passwords, keys, certificates and make them available to applications

*/
