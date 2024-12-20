{ pkgs ? <nixpkgs> {} }:
let
  stdenv = pkgs.stdenv;
in 

stdenv.mkDerivation {
  pname = "dwm";
  version = "6.5.abhi";

  src = pkgs.fetchFromSourcehut {
    owner = "~abhinandh";
    repo = "dwm";
    rev = "0031712dcf6dd51de6d347bdf7f7c6b57bdeb6e3";
    sha256 = "sha256-R5r8CwE33XsxwJflEd2KKea4RyYC0ob9cyGyx6VO78E=";
  };

  buildInputs = [ pkgs.xorg.libX11 pkgs.xorg.libXinerama pkgs.xorg.libXft ];

  prePatch = ''
    sed -i "s@/usr/local@$out@" config.mk
  '';

  # Allow users to set the config.def.h file containing the configuration
  postPatch = let
      conf = ./config.h;
      configFile =
        if pkgs.lib.isDerivation conf || builtins.isPath conf
        then conf else pkgs.writeText "config.def.h" conf;
    in
    pkgs.lib.optionalString (conf != null) "cp ${configFile} config.def.h";

  makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];

  passthru.updateScript = pkgs.gitUpdater {
    url = "git://git.suckless.org/dwm";
  };

  meta = with pkgs.lib; {
    homepage = "https://dwm.suckless.org/";
    description = "Extremely fast, small, and dynamic window manager for X";
    license = licenses.mit;
    maintainers = with maintainers; [ abhinandh ];
    platforms = platforms.all;
    mainProgram = "dwm";
  };
}
