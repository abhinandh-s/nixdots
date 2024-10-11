{ pkgs, ... }:{
  imports = [
    ../../custom/options/youtube-music.nix
  ];

  programs.youtube-music = {
    enable = true;
    package = pkgs.youtube-music;
    settings = {
      window-size = {
        width = 1038;
        height = 1032;
      };
      window-maximized =  false;
      window-position =  {
        x =  11;
        y =  37;
      };
      url = "https://music.youtube.com/watch?v=4ZfATiCxsmw&list=RDAMVMYALvuUpY_b0&index=0";
      options = {
        tray = false;
        appVisible = true;
        autoUpdates = true;
        alwaysOnTop = false;
        hideMenu = true;
        hideMenuWarned = true;
        startAtLogin = false;
        disableHardwareAcceleration = false;
        removeUpgradeButton = false;
        restartOnConfigChanges = false;
        trayClickPlayPause = false;
        autoResetAppCache = false;
        resumeOnStart = true;
        likeButtons = "hide";
        proxy = "";
        startingPage = "";
        overrideUserAgent = false;
        usePodcastParticipantAsArtist = false;
        themes = [
          #   "/home/abhi/.config/YouTube Music/youtubemusic/src/mocha.css"
        ];
      };
      plugins =   {
        notifications =   {
          enabled =   true;
          unpauseNotification =   true;
          rgency =   "normal";
          interactive =   true;
          toastStyle =   1;
          refreshOnPlayPause =   false;
          trayControls =   true;
          hideButtonText =   false;
        };
        video-toggle =   {
          mode =   "custom";
        };
        precise-volume =   {
          globalShortcuts =   {};
        };
        discord =   {
          listenAlong =   true;
        };
        adblocker =   {
          enabled =   true;
          cache =   true;
          blocker =   "With blocklists";
          additionalBlockLists =   [
            "https://github.com/uBlockOrigin/uAssets/blob/master/filters/annoyances-others.txt"
            "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/annoyances-cookies.txt"
            "https://raw.githubusercontent.com/uBlockOrigin/uAssets/refs/heads/master/filters/badlists.txt"
          ];
          disableDefaultLists =   false;
        };
        album-actions =   {
          enabled =   true;
        };
        album-color-theme =   {
          enabled =   true;
        };
        ambient-mode =   {
          enabled =   true;
        };
        blur-nav-bar =   {
          enabled =   true;
        };
        bypass-age-restrictions =   {
          enabled =   true;
        };
        compact-sidebar =   {
          enabled =   true;
        };
        downloader =   {
          enabled =   true;
          downloadFolder =   "/home/abhi/downloads";
          selectedPreset =   "Custom";
          customPresetSetting =   {
            extension =   "mp3";
            ffmpegArgs =   [
              "-b = a"
              "256k"
            ];
          };
          skipExisting =   true;
        };
        lyrics-genius =   {
          enabled =   true;
        };
        no-google-login =   {
          enabled =   true;
        };
        shortcuts =   {
          enabled =   true;
          overrideMediaKeys =   false;
          global =   {
            previous =   "Num4";
            playPause =   "Num6";
            next =   "Num5";
          };
          local =   {
            previous =   "";
            playPause =   "";
            next =   "";
          };
        };
      };
      __internal__ =   {
        migrations =   {
          version =   "3.3.6";
        };
      };
    };
  };
}
