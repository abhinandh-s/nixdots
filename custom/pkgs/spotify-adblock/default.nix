{ pkgs ? import <nixpkgs> {} }:

let
  rustPlatform = pkgs.rustPlatform;
in
  rustPlatform.buildRustPackage {
    pname = "spotify-adblock";
    version = "0.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "abba23";
      repo = "spotify-adblock";
      rev = "7391666109c8f9d0ccc8254dc0ff7e28139c663b";
      hash = "sha256-OjbJAn/QWXxaARyiKDBLdxCRscC+ZdaCRoBhINkmfHM=";
    };

    cargoSha256 = "sha256-xc0B00JAzGlbn7IoB56pDlLq1LCF3418RBfKYekQx2Y=";

    installPhase = ''
      mkdir -p $out/lib
      cp -r target/x86_64-unknown-linux-gnu/release/libspotifyadblock.so $out/lib/spotifyadblock.so
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
