{ config, pkgs, ... }:
let
    # font = "Cascadia Code";
in
{
    programs.firefox = {
        enable = true;
        package = pkgs.unstable.firefox;
        profiles = {
            "abhi" = {
                id = 0;
                isDefault = true;

                settings = {

                    # enable custom userchrome
                    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

                    # -- Wallpaper ( not working, dont know why!)
                    "browser.newtabpage.activity-stream.newtabWallpapers.enabled"=	true;
                    "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper" = "~/Pictures/wallhaven-3led2d.jpg";
                    "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper-dark" = "~/Pictures/wallhaven-3led2d.jpg";
                    "browser.newtabpage.activity-stream.newtabWallpapers.wallpaper-light" = "~/Pictures/wallhaven-3led2d.jpg";

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
                    "browser.safebrowsing.downloads.remote.enabled" = false;
                    "browser.safebrowsing.downloads.enabled" = false;

                    # -- telemetry
                    "toolkit.telemetry.enabled" = false;
                    "toolkit.telemetry.unified" = false;
                    "toolkit.telemetry.archive.enabled" = false;
                    "datareporting.healthreport.uploadEnabled" = false;
                    "datareporting.healthreport.service.enabled" = false;
                    "datareporting.policy.dataSubmissionEnabled" = false;

                    # -- experiments
                    "experiments.supported" = false;
                    "experiments.enabled" = false;
                    "experiments.manifest.uri" = "";

                    "browser.discovery.enabled" = false;
                    "extensions.shield-recipe-client.enabled" = false;
                    "app.shield.optoutstudies.enabled" = false;
                    "loop.logDomains" = false;

                    # -- iirc hides pocket stories
                    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;

                    # -- third party cookies
                    "network.cookie.cookieBehavior" = 1;

                    # -- default browser
                    "browser.shell.checkDefaultBrowser" = false;

                    # -- download location
                    "browser.download.dir" = "/home/abhi/Downloads";
                    "browser.download.folderList" = 2;

                    # -- disable clipboard api
                    "dom.event.clipboardevents.enabled" = false;

                    # -- firefox signing
                    "identity.fxaccounts.toolbar.defaultVisible" = false;	
                    "identity.fxaccounts.toolbar.enabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled.monitorEnabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled.relayEnabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled.vpnEnabled" = false;

                    # -- sponsors
                    "browser.newtabpage.activity-stream.showSponsored" = false;
                    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                    "browser.newtabpage.activity-stream.system.showSponsored" = false;
                    "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
                    "browser.urlbar.suggest.quicksuggest.sponsored" = false;
                    "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored" = false;
                    "services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

                    # -- New tab page
                    "browser.newtabpage.activity-stream.topSitesRows" = 2; # ho many rows for shortcut new tab

                    # -- topbar
                    "extensions.pocket.enabled" = false; # disables pocket

                    # -- Pinned shortcuts
                    "browser.newtabpage.pinned" = [
                        { title = "NixOS"; url = "https://nixos.org";} #1
                        { title = "MyNixOs"; url = "https://mynixos.com";} #2
                        { title = "NixOS Search"; url = "https://search.nixos.org/packages";} #10
                        { title = "Nix Pills"; url = "https://nixos.org/guides/nix-pills/";} #15
                        { title = "NixOS WiKi"; url = "https://nixos.wiki/";} #14
                        { title = "Arch WiKi"; url = "https://wiki.archlinux.org/title/Main_page";} #13
                        { title = "Rust Doc"; url = "https://doc.rust-lang.org/stable/book";} #3
                        { title = "Crates"; url = "https://crates.io";} #4
                        { title = "Youtube"; url = "https://www.youtube.com";} #5
                        { title = "Reddit"; url = "https://www.reddit.com";} #6
                        { title = "ChatGPT"; url = "https://chatgpt.com";} #7
                        { title = "Github"; url = "https://github.com/abhi-xyz";} #8
                        { title = "Catppuccin"; url = "https://catppuccin.com/palette";} #9
                        { title = "X"; url = "https://x.com";} #11
                        { title = "Hianime"; url = "https://hianime.to/home";} #12
                        { title = "Hacker News"; url = "https://thehackernews.com/";} #16

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
                containers = {
                    dangerous = {
                        color = "red";
                        icon = "fruit";
                        id = 2;
                    };
                    shopping = {
                        color = "blue";
                        icon = "cart";
                        id = 1;
                    };
                };

                search.default = "DuckDuckGo";
                search.privateDefault = "DuckDuckGo";
                search.engines = {
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
                userContent = ''
          /*================ GLOBAL COLORS ================*/
          :root {
            --accent-color: 54, 54, 54;
            --secondary-accent-color: 140, 140, 140;
            --third-accent-color: 190, 190, 190;
            --light-color: 255, 255, 255;
            --dark-color: 36, 36, 36;
            --caption-min-color: 255, 133, 94;
            --caption-max-color: 255, 100, 159;
            --caption-close-color: 153, 132, 255;
          }

          /*================ DARK THEME ================*/
          :root:-moz-lwtheme-brighttext,
          .sidebar-panel[lwt-sidebar-brighttext],
          body[lwt-sidebar-brighttext] {
            --main-bgcolor: var(--dark-color);
            --transparent-bgcolor: var(--accent-color);
          }


          /*================== NEW TAB BG COLOR ==================*/
          @media (prefers-color-scheme: dark) {
          @-moz-document url("about:newtab"), url("about:home"), url("about:blank") {
           body.activity-stream { background-color: rgba(var(--dark-color), 1) !important;}
          }
          }

          @media (prefers-color-scheme: light) {
          @-moz-document url("about:newtab"), url("about:home"), url("about:blank") {
           body.activity-stream { background-color: rgba(var(--light-color), 1) !important;}
          }
          }

          /*================== SEARCH BAR ==================*/
          #root .search-wrapper input {
            transition: all 0.3s ease !important;
              background: rgba(var(--accent-color), 0.2) var(--newtab-search-icon) 12px center no-repeat !important;
            background-size: 20px !important;
            border: 2px solid !important;
            border-color: rgba(var(--accent-color), 0.3) !important;
            box-shadow: none !important;
          }
          #root .search-wrapper .search-inner-wrapper:hover input,
          #root .search-wrapper .search-inner-wrapper:active input,
          #root .search-wrapper input:focus {
            border-color: rgba(var(--accent-color), 0.6) !important;
          }

          #root .search-wrapper .search-button,
          #root .search-wrapper .search-button {
            transition: all 0.3s ease !important;
          }
          #root .search-wrapper .search-button:focus,
          #root .search-wrapper .search-button:hover {
              background-color: rgba(var(--accent-color), 1) !important;
          }

          /*================== SEARCH BAR RESULTS ==================*/
          .contentSearchSuggestionTable .contentSearchSuggestionsContainer,
          .contentSearchSuggestionTable .contentSearchHeader {
              background-color: rgba(var(--accent-color), 1) !important;
          }
          .contentSearchSuggestionTable .contentSearchSuggestionRow.selected,
          .contentSearchSuggestionTable .contentSearchOneOffItem.selected {
            background-color: rgba(var(--secondary-accent-color), 0.2) !important;
          }

          .contentSearchSuggestionTable .contentSearchHeader,
          .contentSearchSuggestionTable .contentSearchSettingsButton,
          .contentSearchSuggestionTable .contentSearchOneOffsTable {
            border-color: rgba(var(--secondary-accent-color), 0.2) !important;
          }

          .contentSearchSuggestionTable {
            box-shadow: none !important;
            border: 2px solid rgba(var(--secondary-accent-color), 0.2) !important;
            border-radius: 3px !important;
          }
                '';

                userChrome = ''
                    // pdf reader
              #viewerContainer > #viewer > .page > .canvasWrapper > canvas {
                 filter: grayscale(100%);
                 filter: invert(100%);
              }

               /*================== Simplify Darkish Purple for Firefox ==================
              Author: dpcdpc11.gumroad.com
              ENJOY!
              */

              /*================ GLOBAL COLORS ================*/
              :root {
                --accent-color: 54, 54, 54;
                --secondary-accent-color: 255, 33, 124;
                --third-accent-color: 255, 33, 142;
                --light-color: 255, 255, 255;
                --dark-color: 24, 26, 27;
                --caption-min-color: 255, 133, 94;
                --caption-max-color: 255, 100, 159;
                --caption-close-color: 153, 132, 255;
              }

              /*================ DARK THEME ================*/
              :root:-moz-lwtheme-brighttext,
              .sidebar-panel[lwt-sidebar-brighttext],
              body[lwt-sidebar-brighttext] {
                --main-bgcolor: var(--dark-color);
                --transparent-bgcolor: var(--accent-color);
              }


              /*================== MAIN HEADER ==================*/
              toolbox#navigator-toolbox  {
                border: 0 !important;
              }
                '';

            };
        };
        policies = {
            ExtensionSettings = with builtins;
                let extension = shortId: uuid: {
                    name = uuid;
                    value = {
                        install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                        installation_mode = "normal_installed";
                    };
                };
                in listToAttrs [
                        (extension "darkreader" "addon@darkreader.org")
                        (extension "rsshub-radar" "i@diygod.me")
                        (extension "awesome-rss" "{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}")
                        (extension "imagetotext-io" "{1ad6743a-129b-4f99-bab1-f1d168169499}")
                        (extension "tree-style-tab" "treestyletab@piro.sakura.ne.jp")
                        (extension "ublock-origin" "uBlock0@raymondhill.net")
                        (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
                        (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
                        (extension "vim-vixen" "vim-vixen@i-beam.org")
                    ];
            # To add additional extensions, find it on addons.mozilla.org, find
            # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
            # Then, download the XPI by filling it in to the install_url template, unzip it,
            # run `jq .browser_specific_settings.gecko.id manifest.json` or
            # `jq .applications.gecko.id manifest.json` to get the UUID
            #(extension "" "")
        };
        # DefaultDownloadDirectory = "\${home}/Downloads";

        # comment: You don’t need to get the UUID from the xpi. You can install it then find the UUID in about:debugging#/runtime/this-firefox.
        # ref link: https://discourse.nixos.org/t/declare-firefox-extensions-and-settings/36265/17
    };
}
