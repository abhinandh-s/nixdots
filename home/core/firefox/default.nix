{ config, pkgs, lib, ... }:
let
in
  {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    policies = lib.mkMerge [
      (import ./policies.nix {
        inherit config pkgs lib;
      })
      (import ./extensions.nix {
        inherit config pkgs lib;
      })
      {
      }
    ];
    profiles = {
      "abhi" = {
        id = 0;
        isDefault = true;
        userContent = import ./userContent.nix;
        userChrome = import ./userChrome.nix;
        settings = {

          "browser.translations.automaticallyPopup" = true;
          "browser.aboutConfig.showWarning" = false; # disable about:config warning
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.startup.page" = 1; # 0=blank, 1=home, 2=last visited page, 3=resume previous session
          "browser.startup.homepage" = "about:home"; #

          "browser.newtabpage.activity-stream.feeds.weatherfeed" = false;
          "browser.newtabpage.activity-stream.showWeather" = false;
          "browser.newtabpage.activity-stream.sectionOrder" = "topsites";
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.default.sites" = [];


          # NOTE:
          # ------------------------------ #
          # -- Vertical Tabs ------------- #
          # ------------------------------ #
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
          "browser.ml.chat.enabled" = true;
          "browser.ml.chat.provider" = "https://chatgpt.com";

          "reader.color_scheme" = "custom";
          "reader.colors_menu.enabled" = true; # what does this do ?
          "reader.content_width" = 4;
          "reader.custom_colors.background" = "#11111b";
          "reader.custom_colors.foreground" = "#cdd6f4";
          "reader.custom_colors.selection-highlight" = "#f9e2af";
          "reader.custom_colors.unvisited-links" = "#b4befe";
          "reader.custom_colors.visited-links" = "#f38ba8";
          "reader.errors.includeURLs" = true;



          "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"; # use Mozilla geolocation service instead of Google if permission is granted
          # ------------------------------------------- #
          # -- ETP (ENHANCED TRACKING PROTECTION) ----- #
          # ------------------------------------------- #

          "browser.contentblocking.category" = "strict"; # enable ETP Strict Mode [HIDDEN PREF]

          "browser.newtabpage.activity-stream.topSitesRows" = 4; # how many rows for shortcut new tab
          # -- topbar
          "extensions.pocket.enabled" = false; # disables pocket
          # -- Locale
          "browser.search.region" = "US";
          "browser.search.isUS" = false;
          "distribution.searchplugins.defaultLocale" = "en-US";
          "general.useragent.locale" = "en-Us";
          # -- set the font
          # "font.name.monospace.x-western" = font;
          # "font.name.sans-serif.x-western" = font;
          # "font.name.serif.x-western" = font;
          
          # turn of google safebrowsing (it literally sends a sha sum of everything you download to google)
          "browser.safebrowsing.downloads.remote.block_dangerous" = false;
          "browser.safebrowsing.downloads.remote.block_dangerous_host" = false;
          "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
          "browser.safebrowsing.downloads.remote.block_uncommon" = false;
          "browser.safebrowsing.downloads.remote.url" = false;
          "browser.safebrowsing.downloads.enabled" = false;
          # -- experiments
          "experiments.supported" = false;
          "experiments.enabled" = false;
          "experiments.manifest.uri" = "";
          "extensions.shield-recipe-client.enabled" = false;
          "loop.logDomains" = false;
          # -- third party cookies
          "network.cookie.cookieBehavior" = 1;
          # -- default browser
          "browser.shell.checkDefaultBrowser" = false;
          # -- sponsors
          "browser.newtabpage.activity-stream.system.showSponsored" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
          "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          # --
          # -- Pinned shortcuts
          # --
          "browser.newtabpage.pinned" = [
            { title = "Abhinandh"; url = "https://abhinandh.srht.site/";} #25
            { title = "My website"; url = "https://abhi-xyz.github.io/site/";} #20
            { title = "Github"; url = "https://github.com/abhi-xyz";} #8
            { title = "NixOS"; url = "https://nixos.org";} #1
            { title = "MyNixOs"; url = "https://mynixos.com";} #2
            { title = "NixOS Search"; url = "https://search.nixos.org/packages";} #10
            { title = "Nix Pills"; url = "https://nixos.org/guides/nix-pills/";} #15
            { title = "NixOS WiKi"; url = "https://nixos.wiki/";} #14
            { title = "Arch WiKi"; url = "https://wiki.archlinux.org/title/Main_page";} #13
            { title = "Rust Doc"; url = "https://doc.rust-lang.org/stable/book";} #3
            { title = "Rust stdlib Docs"; url = "https://doc.rust-lang.org/std/index.html";} #30
            { title = "Rust by Examples"; url = "https://doc.rust-lang.org/rust-by-example/index.html";} #31
            { title = "Rustlings"; url = "https://github.com/rust-lang/rustlings";} #32
            { title = "Crates"; url = "https://crates.io";} #4
            { title = "Youtube"; url = "https://www.youtube.com";} #5
            { title = "Reddit"; url = "https://www.reddit.com";} #6
            { title = "ChatGPT"; url = "https://chatgpt.com";} #7
            { title = "Catppuccin"; url = "https://catppuccin.com/palette";} #9
            { title = "X"; url = "https://x.com";} #11
            { title = "Hianime"; url = "https://hianime.to/home";} #12
            { title = "Jellyfin Server"; url = "http://localhost:8096/web/index.html#/home.html";} #16
            { title = "Nerd Icons"; url = "https://www.nerdfonts.com/cheat-sheet";} #17
            { title = "Unsplash"; url = "https://unsplash.com/t/wallpapers";} #18
            { title = "Pinterest"; url = "https://www.pinterest.com/";} #19
            { title = "Flipkart"; url = "https://www.flipkart.com/";} #21
            { title = "Amazon"; url = "https://www.amazon.in/";} #22
            { title = "proton mail"; url = "https://mail.proton.me/u/0/inbox";} #23
            { title = "proton drive"; url = "https://drive.proton.me/u/0/o9nuqW7Gp1ylV4va0CoH_jprUWbtjIqbNW92RS7Cd-y74X10XrlOQQ7IJuN7kGpeGeNI0zxuVx5mxZdUXOWxpQ==/folder/Won0u630O7IEf1vKCNcuYoDCLcCnxTv6JLPxR3o_TH7ZJUTuz6OM72G04qm4Sp4roRmN9GwEPSvaFsBvBodCCQ==";} #24
            { title = "Color Picker"; url = "https://hslpicker.com/";} #26
            { title = "Localhost:8080"; url = "127.0.0.1:8080";} #27
            { title = "Org-roam"; url = "https://www.orgroam.com/manual.html";} #28
            { title = "Org mode"; url = "https://orgmode.org/manual/index.html#SEC_Contents";} #29
          ];
        };
        bookmarks = [
          {
            name = "wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&amp;go=Go";
          }
          {
            name = "kernel.org";
            url = "https://www.kernel.org";
          }
          {
            name = "Nix sites";
            toolbar = true;
            bookmarks = [
              {
                name = "homepage";
                url = "https://nixos.org/";
              }
              {
                name = "wiki";
                tags = [ "wiki" "nix" ];
                url = "https://wiki.nixos.org/";
              }
            ];
          }
        ];
        # -- INFO: icon = Can be fingerprint, briefcase, dollar, cart, vacation, gift, food, fruit, pet, tree, chill, circle, fence
        # -- INFO: color =	Can be blue, turquoise, green, yellow, orange, red, pink, purple, toolbar

        containers = {
          dangerous = {
            color = "red";
            icon = "fruit";
            id = 2;
          };
          coding = {
            color = "green";
            icon = "chill"; 
            id = 3;
          };
          shopping = {
            color = "blue";
            icon = "cart";
            id = 1;
          };
        };
        search = {
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              definedAliases = [ "@no" ];
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
            };
          };
        };
      };
    };
  };
}
