{ pkgs ? import <nixpkgs> {} }:

let
  rustPlatform = pkgs.rustPlatform;
in
  rustPlatform.buildRustPackage {
    pname = "spotify-adblock";
    version = "0.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "abhi";
      repo = "brightness";
      rev = "8d6a6b0493949f09b0e619ea1f671b61491d4986";
      hash = "";
    };

    cargoSha256 = "";

    installPhase = ''
     # mkdir -p $out/lib
     # cp -r target/x86_64-unknown-linux-gnu/release/ $out/bin/
      '';

    meta = with pkgs.lib; {
      description = "Spotify adblocker for Linux (macOS untested) that works by wrapping getaddrinfo and cef_urlrequest_create. It blocks requests to domains that are not on the allowlist, as well as URLs that are on the denylist.";
      homepage = "https://github.com/abba23/spotify-adblock";
      changelog = "https://github.com/abba23/spotify-adblock/releases";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ abba23 ];
      platforms = platforms.linux; # Specify supported platforms
      mainProgram = "spotify-adblock";
    };
  }
