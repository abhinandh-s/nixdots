self: super: {
  betterlockscreen = super.betterlockscreen.overrideAttrs (oldAttrs: {
    postInstall = ''
# Run betterlockscreen command to set background
      if [ -f "${toString ./assets/background.png}" ]; then
        $out/bin/betterlockscreen -u ${toString ../../../assets/vivid_rainwld.jpg}
      else
        echo "Background image not found!"
      fi
      # Add your additional install phase command here
      # echo "Setting the background image using -u flag"
      #betterlockscreen -u ${toString ../../../assets/vivid_rainwld.jpg}
    '';
  });
}

