{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      # ligatures dependency
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
      # src = ../../custom/overlays/st;
      src = pkgs.fetchFromSourcehut {
        owner = "~abhinandh";
        repo = "st";
        rev = "7acc2e3d2d0c930bb1c318c2320265d76d015504";
        sha256 = "sha256-6GDLIVl0N1Dee08OPTGQpqTulGjvbE4E+va61RTJwEo=";
      };
      patches = [
        # ligatures patch
        #   (fetchpatch {
        #  url = "https://st.suckless.org/patches/blinking_cursor/st-blinking_cursor-20230819-3a6d6d7.diff";
        #  sha256 = "sha256-f79RFl4JFKNF4cAl8WsfNC2Zx5nd8lQ8TuSxl2rBxfY=";
        #})
      ];
      # Using a local file
      # configFile = writeText "config.def.h" (builtins.readFile ../../custom/overlays/st/config.h);
      # postPatch = "${oldAttrs.postPatch}\n cp ${configFile} config.def.h";
    }))
  ];
}
