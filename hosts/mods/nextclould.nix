{ config, pkgs, ... }:
{

  imports = [
    "${fetchTarball {
      url = "https://github.com/onny/nixos-nextcloud-testumgebung/archive/fa6f062830b4bc3cedb9694c1dbf01d5fdf775ac.tar.gz";
      sha256 = "0gzd0276b8da3ykapgqks2zhsqdv4jjvbv97dsxg0hgrhb74z0fs";}}/nextcloud-extras.nix"
  ];

  environment.etc."nextcloud-user-pass".text = "6282356475abhi"; # password

  services.nextcloud = {
    ensureUsers = {
      abhi = {
        email = "ugabhi@proton.me";
        passwordFile = "/etc/nextcloud-user-pass";
      };
    };
  };


  environment.etc."nextcloud-admin-pass".text = "6282356475abhi";

  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud29;
    hostName = "localhost";
    # https = true;
    datadir = "/run/media/abhi/server/nextcloud";
    maxUploadSize = "1G";
    # Redis can be enabled as a performant caching backend
    # This will bring faster page loads to your Nextcloud instance.
    configureRedis = true;
    config.adminpassFile = "/etc/nextcloud-admin-pass";
    settings = let
    prot = "http"; # or https
    host = "127.0.0.1";
    dir = "/nextcloud";
  in {
      mail_smtpmode = "sendmail";
      mail_sendmailmode = "pipe";
      enabledPreviewProviders = [
        "OC\\Preview\\BMP"
        "OC\\Preview\\GIF"
        "OC\\Preview\\JPEG"
        "OC\\Preview\\Krita"
        "OC\\Preview\\MarkDown"
        "OC\\Preview\\MP3"
        "OC\\Preview\\OpenDocument"
        "OC\\Preview\\PNG"
        "OC\\Preview\\TXT"
        "OC\\Preview\\XBitmap"
        "OC\\Preview\\HEIC"
      ];
    };
    # Instead of using pkgs.nextcloud28Packages.apps,
    # we'll reference the package version specified above
    extraApps = {
      inherit (config.services.nextcloud.package.packages.apps) contacts calendar tasks bookmarks deck mail notes onlyoffice polls twofactor_webauthn;
      # -------------------------------------------------------------------------
      # memories need hash update to work curent nixversion doesnt match now.
      # memories = pkgs.fetchNextcloudApp {
      #   sha256 = "sha256-Xr1SRSmXo2r8yOGuoMyoXhD0oPVm/0/ISHlmNZpJYsg=";
      #   url = "https://github.com/pulsejet/memories/releases/download/v6.2.2/memories.tar.gz";
      #   license = "gpl3";
      # };
      # -------------------------------------------------------------------------
      # fetch and build an app from source, in this example the development app hmr_enabler. 
      #   hmr_enabler = pkgs.php.buildComposerProject (finalAttrs: {
      #     pname = "hmr_enabler";
      #     version = "1.0.0";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "nextcloud";
      #       repo = "hmr_enabler";
      #       rev = "b8d3ad290bfa6fe407280587181a5167d71a2617";
      #       hash = "sha256-yXFby5zlDiPdrw6HchmBoUdu9Zjfgp/bSu0G/isRpKg=";
      #     };
      #     composerNoDev = false;
      #     vendorHash = "sha256-PCWWu/SqTUGnZXUnXyL8c72p8L14ZUqIxoa5i49XPH4=";
      #     postInstall = ''
      #     cp -r $out/share/php/hmr_enabler/* $out/
      #     rm -r $out/share
      #     '';
      #   });
      # -------------------------------------------------------------------------
    };
    extraAppsEnable = true;
  };

  # to setup Nextcloud with Let's Encrypt TLS certificates
  # or certs from any other certificate authority
  # services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
  #  forceSSL = true;
    # enableACME = true;
  # };
  services.nginx.virtualHosts."localhost".listen = [ { addr = "127.0.0.1"; port = 443; } ];
  # security.acme = {
  #   defaults.email = "ugabhi@proton.me";
  #     acceptTerms = true;   
  #   # certs = { 
  #   #   ${config.services.nextcloud.hostName}.email = "ugabhi@proton.me";
  #   # }; 
  # };
}
