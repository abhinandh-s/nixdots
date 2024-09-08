{ pkgs, ... }:
let
    # font = "Cascadia Code";
in
    {
    programs.firefox = {
        enable = true;
        package = pkgs.firefox-beta-bin;
        profiles = {
            "abhi" = {
                id = 0;
                isDefault = true;

                settings = {
                    # --
                    # -- STARTUP
                    # --
                    "browser.aboutConfig.showWarning" = false; # disable about:config warning
                    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                    "browser.startup.page" = 1; # 0=blank, 1=home, 2=last visited page, 3=resume previous session
                    "browser.startup.homepage" = "about:home"; #
                    "browser.newtabpage.enabled" = true; #
                    "browser.newtabpage.activity-stream.showSponsored" = false; # disable sponsored content on Firefox Home
                    "browser.newtabpage.activity-stream.showSponsoredTopSites" = false; # clear default topsites, This does not block you from adding your own.
                    "browser.newtabpage.activity-stream.default.sites" = ""; # ;;
                    "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%"; # use Mozilla geolocation service instead of Google if permission is granted
                    "geo.provider.ms-windows-location" = false; # [WINDOWS]
                    "geo.provider.use_corelocation" = false; # [MAC]
                    "geo.provider.use_gpsd" = false; # [LINUX] [HIDDEN PREF]
                    "geo.provider.use_geoclue" = false; # [FF102+] [LINUX]
                    "extensions.getAddons.showPane" = false; # disable recommendation pane in about:addons (uses Google Analytics) [HIDDEN PREF]
                    "extensions.htmlaboutaddons.recommendations.enabled" = false; # disable personalized Extension Recommendations in about:addons' Extensions and Themes panes
                    "browser.discovery.enabled" = false; #
                    "browser.shopping.experience2023.enabled" = false; # disable shopping experience -> [DEFAULT: false]
                    # --
                    # -- TELEMETRY
                    # --

                    "sidebar.revamp" = true;
                    "sidebar.verticalTabs" = true;


                    "datareporting.policy.dataSubmissionEnabled" = false; # disable new data submission, If disabled, no policy is shown or upload takes place, ever.
                    "datareporting.healthreport.uploadEnabled" = false; # disable Health Reports
                    "toolkit.telemetry.unified" = false; # The "unified" pref affects the behavior of the "enabled" pref. If "unified" is false then "enabled" controls the telemetry module. If "unified" is true then "enabled" only controls whether to record extended data.
                    # [NOTE] "toolkit.telemetry.enabled" is now LOCKED to reflect prerelease (true) or release builds
                    "toolkit.telemetry.enabled" = false; # // see [NOTE]
                    "toolkit.telemetry.server" = "data:,"; #
                    "toolkit.telemetry.archive.enabled" = false; #
                    "toolkit.telemetry.newProfilePing.enabled" = false; # // [FF55+]
                    "toolkit.telemetry.shutdownPingSender.enabled" = false; # // [FF55+]
                    "toolkit.telemetry.updatePing.enabled" = false; # // [FF56+]
                    "toolkit.telemetry.bhrPing.enabled" = false; # // [FF57+] Background Hang Reporter
                    "toolkit.telemetry.firstShutdownPing.enabled" = false; # // [FF57+]
                    "toolkit.telemetry.coverage.opt-out" = true; # disable Telemetry Coverage [HIDDEN PREF]
                    "toolkit.coverage.opt-out" = true; # // [FF64+] [HIDDEN PREF]
                    "toolkit.coverage.endpoint.base" = ""; #
                    "browser.newtabpage.activity-stream.feeds.telemetry" = false; # disable Firefox Home (Activity Stream) telemetry
                    "browser.newtabpage.activity-stream.telemetry" = false; #
                    # --
                    # -- STUDIES
                    # --
                    "app.shield.optoutstudies.enabled" = false; # Shield is a telemetry system that can push and test "recipes"
                    "app.normandy.enabled" = false; #
                    "app.normandy.api_url" = ""; #
                    # --
                    # -- CRASH REPORTS
                    # --
                    "breakpad.reportURL" = ""; # disable Crash Reports
                    "browser.tabs.crashReporting.sendReport" = false; # // [FF44+]
                    "browser.crashReports.unsubmittedCheck.autoSubmit2" = false; # // [DEFAULT: false]
                    "captivedetect.canonicalURL" = ""; #
                    "network.captive-portal-service.enabled" = false; # disable Captive Portal detection
                    "network.connectivity-service.enabled" = false; # disable Network Connectivity checks
                    # --
                    # -- SAFE BROWSING
                    # --
                    "browser.safebrowsing.downloads.remote.enabled" = false; # To verify the safety of certain executable files, Firefox may submit some information about the file, including the name, origin, size and a cryptographic hash of the contents, to the Google Safe Browsing service which helps Firefox determine whether or not the file should be blocked
                    "network.prefetch-next" = false; # disable link prefetching
                    "network.dns.disablePrefetch" = true; # disable DNS prefetching
                    "network.predictor.enabled" = false; # disable predictor / prefetching
                    "network.predictor.enable-prefetch" = false; # disable link-mouseover opening connection to linked server [DEFAULT: false]
                    "network.http.speculative-parallel-limit" = 0; # disable mousedown speculative connections on bookmarks and history
                    "browser.places.speculativeConnect.enabled" = false; # enforce no "Hyperlink Auditing" (click tracking)
                    "network.proxy.socks_remote_dns" = true; # set the proxy server to do any DNS lookups when using SOCKS
                    # e.g. in Tor, this stops your local DNS server from knowing your Tor destination as a remote Tor node will handle the DNS request
                    "network.file.disable_unc_paths" = true; # disable using UNC (Uniform Naming Convention) paths. Can break extensions for profiles on network shares [HIDDEN PREF]
                    "network.gio.supported-protocols" = ""; # disable GIO as a potential proxy bypass vector
                    # Gvfs/GIO has a set of supported protocols like obex, network, archive, computer,
                    # dav, cdda, gphoto2, trash, etc. From FF87-117, by default only sftp was accepted [HIDDEN PREF] [DEFAULT: "" FF118+]
                    "browser.urlbar.speculativeConnect.enabled" = false; # disable location bar contextual suggestions
                    "browser.search.suggest.enabled" = true; # Override these if you trust and use a privacy respecting search engine ( true since i use duckduckgo)
                    "browser.urlbar.suggest.searches" = true;
                    "browser.urlbar.trending.featureGate" = false; # disable urlbar trending search suggestions
                    "browser.urlbar.addons.featureGate" = false; # // [FF115+]
                    "browser.urlbar.mdn.featureGate" = false; # // [FF117+] [HIDDEN PREF]
                    "browser.urlbar.pocket.featureGate" = false; # // [FF116+] [DEFAULT: false]
                    "browser.urlbar.weather.featureGate" = false; # // [FF108+] [DEFAULT: false]
                    "browser.urlbar.yelp.featureGate" = false; # // [FF124+] [DEFAULT: false]
                    "browser.formfill.enable" = false; # disable search and form history
                    "browser.search.separatePrivateDefault" = false; # true enable separate default search engine in Private Windows and its UI setting [FF70+]
                    "browser.search.separatePrivateDefault.ui.enabled" = false; # // [FF71+]
                    "signon.autofillForms" = false; # disable auto-filling username & password form fields can leak in cross-site forms *and* be spoofed 
                    # [NOTE] Username & password is still available when you enter the field
                    "signon.formlessCapture.enabled" = false; # disable formless login capture for Password Manager
                    # limit (or disable) HTTP authentication credentials dialogs triggered by sub-resources hardens against potential credentials phishing
                    # 0 = don't allow sub-resources to open HTTP authentication credentials dialogs
                    # 1 = don't allow cross-origin sub-resources to open HTTP authentication credentials dialogs
                    # 2 = allow sub-resources to open HTTP authentication credentials dialogs (default)
                    "network.auth.subresource-http-auth-allow" = 1; #
                    "browser.cache.disk.enable" = true; # dont clear cache
                    "browser.privatebrowsing.forceMediaMemoryCache" = true; # // [FF75+]
                    "media.memory_cache_max_size" = 65536; #
                    "browser.sessionstore.privacy_level" = 2; #
                    "toolkit.winRegisterApplicationRestart" = false; # disable automatic Firefox start and session restore after reboot
                    "browser.shell.shortcutFavicons" = false; #
                    "security.ssl.require_safe_negotiation" = true; #
                    "security.tls.enable_0rtt_data" = false; #
                    "security.OCSP.enabled" = 1; # // [DEFAULT: 1]
                    "security.OCSP.require" = true; #
                    "security.cert_pinning.enforcement_level" = 2; #
                    "security.remote_settings.crlite_filters.enabled" = true; #
                    "security.pki.crlite_mode" = 2; #
                    "dom.security.https_only_mode" = true; # // [FF76+]
                    "dom.security.https_only_mode_send_http_background_request" = false; #
                    "security.ssl.treat_unsafe_negotiation_as_broken" = true; #
                    "browser.xul.error_pages.expert_bad_cert" = true; #
                    "network.http.referer.XOriginTrimmingPolicy" = 2; #
                    "privacy.userContext.enabled" = true; #
                    "privacy.userContext.ui.enabled" = true; #
                    "media.peerconnection.ice.proxy_only_if_behind_proxy" = true; #
                    "media.peerconnection.ice.default_address_only" = true; #
                    "dom.disable_window_move_resize" = true; #
                    "browser.download.start_downloads_in_tmp_dir" = true; # // [FF102+]
                    "browser.helperApps.deleteTempFileOnExit" = true; #
                    "browser.uitour.enabled" = false; #
                    "devtools.debugger.remote-enabled" = false; # // [DEFAULT: false]
                    "permissions.manager.defaultsUrl" = ""; #
                    "webchannel.allowObject.urlWhitelist" = ""; #
                    "network.IDN_show_punycode" = true; #
                    "pdfjs.disabled" = false; # // [DEFAULT: false]
                    "pdfjs.enableScripting" = false; # // [FF86+]
                    "browser.tabs.searchclipboardfor.middleclick" = false; # // [DEFAULT: false NON-LINUX]
                    "browser.contentanalysis.default_allow" = false; # // [FF124+] [DEFAULT: false]
                    # ------------------ #
                    # -- DOWNLOADS ----- #
                    # ------------------ #
                    "browser.download.useDownloadDir" = true; # false will enable user interaction for security by always asking where to download
                    "browser.download.alwaysOpenPanel" = false; # disable downloads panel opening on every download
                    "browser.download.manager.addToRecentDocs" = false; # disable adding downloads to the system's "recent documents" list
                    "browser.download.always_ask_before_handling_new_types" = true; # enable user interaction for security by always asking how to handle new mimetypes.
                    #
                    # ------------------- #
                    # -- EXTENSIONS ----- #
                    # ------------------- #
                    #
                    # limit allowed extension directories
                    # 1=profile, 2=user, 4=application, 8=system, 16=temporary, 31=all
                    # The pref value represents the sum: e.g. 5 would be profile and application directories
                    # [SETUP-CHROME] Breaks usage of files which are installed outside allowed directories
                    "extensions.enabledScopes" = 5; # [HIDDEN PREF]
                    "extensions.postDownloadThirdPartyPrompt" = false; # disable bypassing 3rd party extension install prompts

                    # ------------------------------------------- #
                    # -- ETP (ENHANCED TRACKING PROTECTION) ----- #
                    # ------------------------------------------- #

                    "browser.contentblocking.category" = "strict"; # enable ETP Strict Mode [HIDDEN PREF]

                    # ETP Strict Mode enables Total Cookie Protection (TCP)
                    # [NOTE] Adding site exceptions disables all ETP protections for that site and increases the risk of
                    # cross-site state tracking e.g. exceptions for SiteA and SiteB means PartyC on both sites is shared
                    #
                    # ------------------------------ #
                    # -- SHUTDOWN & SANITIZING ----- #
                    # ------------------------------ #
                    #
                    # false since i need presistance
                    # set/enforce what items to clear on shutdown
                    "privacy.sanitize.sanitizeOnShutdown" = true; #
                    "privacy.clearOnShutdown.cache" = false; #     // [DEFAULT: true]
                    "privacy.clearOnShutdown_v2.cache" = false; #  // [FF128+] [DEFAULT: true]
                    "privacy.clearOnShutdown.downloads" = false; # // [DEFAULT: true]
                    "privacy.clearOnShutdown.formdata" = false; #  // [DEFAULT: true]
                    "privacy.clearOnShutdown.history" = false; #   // [DEFAULT: true]
                    "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = false; # // [FF128+] [DEFAULT: true]
                    "privacy.clearOnShutdown.cookies" = false; # // Cookies
                    "privacy.clearOnShutdown.offlineApps" = false; # // Site Data
                    "privacy.clearOnShutdown.sessions" = false; #  // Active Logins [DEFAULT: true]
                    "privacy.clearOnShutdown_v2.cookiesAndStorage" = false; # // Cookies, Site Data, Active Logins [FF128+]
                    #
                    # ------------------------------------------------------------ #
                    # -- SANITIZE SITE DATA: IGNORES "ALLOW" SITE EXCEPTIONS ----- #
                    # ------------------------------------------------------------ #
                    #
                    "privacy.clearSiteData.cache" = false; #
                    "privacy.clearSiteData.cookiesAndStorage" = false; # // keep false until it respects "allow" site exceptions
                    "privacy.clearSiteData.historyFormDataAndDownloads" = false; #
                    "privacy.cpd.cache" = false; #    // [DEFAULT: true]
                    "privacy.clearHistory.cache" = false; #
                    "privacy.cpd.formdata" = false; # // [DEFAULT: true]
                    "privacy.cpd.history" = false; #  // [DEFAULT: true]
                    "privacy.clearHistory.historyFormDataAndDownloads" = false; #
                    "privacy.cpd.cookies" = false; #
                    "privacy.cpd.sessions" = false; # // [DEFAULT: true]
                    "privacy.cpd.offlineApps" = false; # // [DEFAULT: false]
                    "privacy.clearHistory.cookiesAndStorage" = false; #
                    "privacy.sanitize.timeSpan" = 0; #
                    #
                    # --
                    # -- FPP (fingerprintingProtection) ----- #
                    # --
                    #
                    "privacy.resistFingerprinting" = true; # // [FF41+]
                    "privacy.window.maxInnerWidth" = 1600; #
                    "privacy.window.maxInnerHeight" = 900; #
                    "privacy.resistFingerprinting.block_mozAddonManager" = true; #
                    "privacy.resistFingerprinting.letterboxing" = true; # // [HIDDEN PREF]
                    "privacy.spoof_english" = 1; #
                    "browser.display.use_system_colors" = false; # // [DEFAULT: false NON-WINDOWS]
                    "widget.non-native-theme.enabled" = true; # // [DEFAULT: true]
                    "browser.link.open_newwindow" = 3; # // [DEFAULT: 3]
                    "browser.link.open_newwindow.restriction" = 0; #
                    "webgl.disabled" = true; # enabling can cause Fingerprinting
                    "extensions.blocklist.enabled" = true; # // [DEFAULT: true]
                    "network.http.referer.spoofSource" = false; # // [DEFAULT: false]
                    "security.dialog_enable_delay" = 1000; # // [DEFAULT: 1000]
                    "privacy.firstparty.isolate" = false; # // [DEFAULT: false]
                    "extensions.webcompat.enable_shims" = true; # // [HIDDEN PREF] [DEFAULT: true]
                    "security.tls.version.enable-deprecated" = false; # // [DEFAULT: false]
                    "extensions.webcompat-reporter.enabled" = false; # // [DEFAULT: false]
                    "extensions.quarantinedDomains.enabled" = true; # // [DEFAULT: true]
                    "browser.startup.homepage_override.mstone" = "ignore"; # // [HIDDEN PREF]
                    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false; #
                    "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false; #
                    "browser.urlbar.showSearchTerms.enabled" = false; #
                    "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                    "browser.toolbars.bookmarks.visibility" = "never"; # removes pocket stories
                    "browser.download.dir" = "/home/abhi/downloads";
                    "browser.download.folderList" = 2;
                    "dom.event.clipboardevents.enabled" = false;
                    # -- firefox signing
                    "identity.fxaccounts.toolbar.defaultVisible" = false;	
                    "identity.fxaccounts.toolbar.enabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled.monitorEnabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled.relayEnabled" = false;
                    "identity.fxaccounts.toolbar.pxiToolbarEnabled.vpnEnabled" = false;
                    # -- New tab page
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
                        { title = "NixOS"; url = "https://nixos.org";} #1
                        { title = "MyNixOs"; url = "https://mynixos.com";} #2
                        { title = "NixOS Search"; url = "https://search.nixos.org/packages";} #10
                        { title = "Nix Pills"; url = "https://nixos.org/guides/nix-pills/";} #15
                        { title = "NixOS WiKi"; url = "https://nixos.wiki/";} #14
                        { title = "Arch WiKi"; url = "https://wiki.archlinux.org/title/Main_page";} #13
                        # { title = "Arch WiKi"; url = "https://wiki.archlinux.org/title/Main_page"; customScreenshotURL = ../../../assets/logos/pinterest.png;} #13
                        { title = "Rust Doc"; url = "https://doc.rust-lang.org/stable/book";} #3
                        { title = "Crates"; url = "https://crates.io";} #4
                        { title = "Youtube"; url = "https://www.youtube.com";} #5
                        { title = "Reddit"; url = "https://www.reddit.com";} #6
                        { title = "ChatGPT"; url = "https://chatgpt.com";} #7
                        { title = "Github"; url = "https://github.com/abhi-xyz";} #8
                        { title = "Catppuccin"; url = "https://catppuccin.com/palette";} #9
                        { title = "X"; url = "https://x.com";} #11
                        { title = "Hianime"; url = "https://hianime.to/home";} #12
                        { title = "Jellyfin Server"; url = "http://localhost:8096/web/index.html#/home.html";} #16
                        { title = "Nerd Icons"; url = "https://www.nerdfonts.com/cheat-sheet";} #17
                        { title = "Unsplash"; url = "https://unsplash.com/t/wallpapers";} #18
                        { title = "Pinterest"; url = "https://www.pinterest.com/";} #19
                        { title = "My website"; url = "https://abhi-xyz.github.io/site/";} #20
                        { title = "Flipkart"; url = "https://www.flipkart.com/";} #21
                        { title = "Amazon"; url = "https://www.amazon.in/";} #22
                        { title = "proton mail"; url = "https://mail.proton.me/u/0/inbox";} #23
                        { title = "proton drive"; url = "https://drive.proton.me/u/0/o9nuqW7Gp1ylV4va0CoH_jprUWbtjIqbNW92RS7Cd-y74X10XrlOQQ7IJuN7kGpeGeNI0zxuVx5mxZdUXOWxpQ==/folder/Won0u630O7IEf1vKCNcuYoDCLcCnxTv6JLPxR3o_TH7ZJUTuz6OM72G04qm4Sp4roRmN9GwEPSvaFsBvBodCCQ==";} #24
                        { title = "Abhinandh"; url = "https://abhinandh.srht.site/";} #25
                        { title = "Color Picker"; url = "https://hslpicker.com/";} #26
                        { title = "Localhost:8080"; url = "127.0.0.1:8080";} #27
                        { title = "Org-roam"; url = "https://www.orgroam.com/manual.html";} #28
                        { title = "Org mode"; url = "https://orgmode.org/manual/index.html#SEC_Contents";} #29
                        { title = "Localhost:8080"; url = "localhost:8080";} #30
                        { title = "Localhost:8080"; url = "localhost:8080";} #31
                        { title = "Localhost:8080"; url = "localhost:8080";} #32
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
                    coding = {
                        color = "green";
                        icon = "chill"; # only few icons are available to see the list of available icons leave it blank or put any thing and rebuild nix wll then show the list of available icons.
                        id = 3;
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
@-moz-document url("about:newtab"), url("about:home"), url(about:privatebrowsing) {
  .top-site-outer .tile {
    background-color: rgba(30 30 46 / 0.1) !important;
  }
  .top-site-outer:hover {
    background-color: rgba(73 77 100 / 1) !important;
  }
}

@-moz-document url("about:home"), url("about:newtab"){
  .logo-and-wordmark{ display: none !important; }
}

@-moz-document url("about:newtab"), url("about:home"){
  .search-handoff-button{ display: none !important; }
}

@-moz-document url("about:home"), url("about:newtab"){
  .icon.icon-pin-small{ display: none !important }
}

@-moz-document url("about:home"), url("about:newtab"){
  .tile > .icon-wrapper{
    width: 0% !important;
    height: 0% !important;
  }
  .icon-pin-small{ display: none !important; }
}
                '';

                # User content
                # 1. removes dirty padding on top of icon in home screen
                # 2. hover on icons on home screen will show specified color
                # 3. removes the url bal in center on the home screen
                # 4. removes pinned icon indicator on home page
                # 5. changed home page icon width & height to 0, means no icon only text

                userChrome = ''
/* -------------------------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------- Gray Extensions color */
/* -------------------------------------------------------------------------------------------------------------------------- */

toolbar .toolbarbutton-1:not(#firefox-view-button):not(#star-button) {
    filter: grayscale(100%)!important;
}
toolbar .toolbarbutton-1:not(#firefox-view-button):not(#star-button):hover {
    filter: grayscale(0%)!important;
}

/* -------------------------------------------------------------------------------------------------------------------------- */
/* ---------------------------------------------------------------------------------------------------- Clean extensions menu */
/* -------------------------------------------------------------------------------------------------------------------------- */

#unified-extensions-view {
  --uei-icon-size: 20px !important; /* Icons size */
  width: 280px !important; /* Panel width */
}

.panel-header,
.unified-extensions-item-message-deck,
.unified-extensions-item-menu-button.subviewbutton {
  display: none !important; /* Hide panel header, permissions items and setting buttons */
}

.panel-subview-footer-button {
  text-align-last: center !important; /* Center text on footer */
}

/* -------------------------------------------------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------- Removes Items from Tab Context Menu */
/* -------------------------------------------------------------------------------------------------------------------------- */

menuseparator,
#context_openANewTab,
#context_newTab,
#context_bookmarkTab,
#context_moveTabOptions,
#context_reloadTab,
#context_selectAllTabs,
#context_closeDuplicateTabs,
#context_closeTabOptions,
#context_toggleMuteTab,
#context_pinTab,
#context_unpinTab,
#context_openTabInWindow,
#context_sendTabToDevice_separator,
#context_sendTabToDevice,
#context_reloadAllTabs,
#context_bookmarkAllTabs,
#context_closeTabsToTheEnd,
#context_closeOtherTabs,
#context_undoCloseTab,
#context_closeTab,
menuitem.share-tab-url-item
{ display: none !important }

/* -------------------------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------------------------- Tab icon is close button */
/* -------------------------------------------------------------------------------------------------------------------------- */

#TabsToolbar { visibility: collapse !important; }
#sidebar-header { visibility: collapse !important; }
#titlebar { appearance: none !important }

/* -------------------------------------------------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------- Creates animated border around active tab */
/* -------------------------------------------------------------------------------------------------------------------------- */

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/tab_animated_active_border.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Creates a colorful animated border around active tab */

@keyframes filter{from{ filter: hue-rotate(0deg) } to { filter: hue-rotate(360deg) }}
 
.tabbrowser-tab[selected] > .tab-stack::before{
  grid-area: 1/1;
  content: "";
  display: inherit;
  margin-block: var(--tab-block-margin);
  border-radius: var(--tab-border-radius);
  z-index: 0;
  background-image: conic-gradient(
    rgb(203, 166, 247),
    rgb(147, 153, 178) 70deg,
    rgb(166, 173, 200) 105deg,
    rgb(186, 194, 222) 160deg,
    rgb(205, 214, 244) 200deg,
    rgb(180, 190, 254) 255deg,
    rgb(203, 166, 247) 290deg,
    rgb(203, 166, 247) 360deg);
  background-size: cover;
  background-position: center;
  animation: filter steps(30) 2s infinite;
}
.tab-background[selected]{
  border: 1px solid transparent !important;
  outline: none !important;
  background-clip: padding-box !important;
}

/* -------------------------------------------------------------------------------------------------------------------------- */
/* --------------------------------------------------------------------------------------------------------- slim scrollabars */
/* -------------------------------------------------------------------------------------------------------------------------- */

/* Source file https://github.com/MrOtherGuy/firefox-csshacks/tree/master/chrome/minimal_in-UI_scrollbars.css made available under Mozilla Public License v. 2.0
See the above repository for updates as well as full license text. */

/* Changes various in-UI scrollabars to be slim and more subtle */

.panel-subview-body,
#permList,
scrollbar{
 color: inherit;
 scrollbar-color: currentColor transparent;
 scrollbar-width: thin 
}


/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------- Icon only Tab ( not enabled ) */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* ------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------------------------------------------- */
/* -------------------------------------------------------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------------------------------------------------------- */
                '';

                # usreChrome
                # Clean extensions menu
                # 3. Removes Items from Tab Context Menu

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
                        (extension "catppuccin-mocha-lavender-git" "{8446b178-c865-4f5c-8ccc-1d7887811ae3}")
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
