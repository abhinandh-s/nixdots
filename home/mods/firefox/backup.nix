{ pkgs, ... }:
let
    # font = "Cascadia Code";
in
    {
    programs.firefox = {
        enable = true;
        package = pkgs.firefox;  # pkgs.firefox-beta-bin;
        profiles = {
            "abhi" = {
                id = 0;
                isDefault = true;

                settings = {};
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

/* ----------------------------------------------------------- */
                '';
            };
        };
        policies = {
            ExtensionSettings = with builtins;
                let extension = shortId: uuid: {
                    name = uuid;
                    value = {
                        install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                        installation_mode = "force_installed"; # normal_installed
                    };
                };
                in listToAttrs [
                        (extension "darkreader" "addon@darkreader.org")
                        (extension "rsshub-radar" "i@diygod.me")
                        (extension "awesome-rss" "{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}")
                        (extension "ublock-origin" "uBlock0@raymondhill.net")
                        (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
                        (extension "catppuccin-mocha-teal" "{3f8844e2-3fc1-4104-9773-0f4bb98eab69}")
                    ];
        };
    };
}

