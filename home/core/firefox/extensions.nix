{ lib, ... }:
let
    inherit (lib) mkForce;
in {
    ExtensionSettings = with builtins;
        let extension = shortId: uuid: defaultArea: {
            name = uuid;
            value = {
                install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
                installation_mode = "force_installed"; # normal_installed
                default_area = defaultArea;
                blocked_install_message = "Fucking forget it";
            };
        };
        in listToAttrs [
                (extension "*" "" "menupanel")
                (extension "custom-new-tab-page" "custom-new-tab-page@mint.as" "menupanel")
                (extension "darkreader" "addon@darkreader.org" "menupanel")
                (extension "rsshub-radar" "i@diygod.me" "navbar")
                (extension "awesome-rss" "{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}" "menupanel")
                (extension "ublock-origin" "uBlock0@raymondhill.net" "navbar")
                (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}" "menupanel")
                (extension "catppuccin-mocha-teal" "{3f8844e2-3fc1-4104-9773-0f4bb98eab69}" "menupanel")
            ];
}


#     "*" = {
    #         installation_mode = "blocked"; # blocks all addons except the ones specified below
    #         
    #     };
    #     # darkreader:
    #     "{addon@darkreader.org}" = {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
    #         installation_mode = "force_installed";
    #         default_area = "navbar"; # navbar | menupanel
    #     };
    #     # uBlock Origin:
    #     "uBlock0@raymondhill.net" = {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    #         installation_mode = "force_installed";
    #         default_area = "navbar"; # navbar | menupanel
    #     };
    #     # Rsshub Radar:
    #     "i@diygod.me" = {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/rsshub-radar/latest.xpi";
    #         installation_mode = "force_installed";
    #         default_area = "navbar"; # navbar | menupanel
    #     };
    #     "{3f8844e2-3fc1-4104-9773-0f4bb98eab69}" = {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/catppuccin-mocha-teal/latest.xpi";
    #         installation_mode = "force_installed";
    #     };
    #     "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
    #         installation_mode = "force_installed";
    #     };
    #     "{97d566da-42c5-4ef4-a03b-5a2e5f7cbcb2}" = {
    #         install_url = "https://addons.mozilla.org/firefox/downloads/latest/awesome-rss/latest.xpi";
    #         installation_mode = "force_installed";
    #     };



    # "3rdparty".Extensions = {
    #     "uBlock0@raymondhill.net".adminSettings = {
    #         userSettings = rec {
    #             uiTheme = "dark";
    #             uiAccentCustom = true;
    #             uiAccentCustom0 = "#ffffff";
    #             cloudStorageEnabled = mkForce false; # Security liability?
    #             importedLists = [
    #                 "https://filters.adtidy.org/extension/ublock/filters/3.txt"
    #                 "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
    #             ];
    #             externalLists = lib.concatStringsSep "\n" importedLists;
    #         };
    #         selectedFilterLists = [
    #             "CZE-0"
    #             "adguard-generic"
    #             "adguard-annoyance"
    #             "adguard-social"
    #             "adguard-spyware-url"
    #             "easylist"
    #             "easyprivacy"
    #             "https://github.com/DandelionSprout/adfilt/raw/master/LegitimateURLShortener.txt"
    #             "plowe-0"
    #             "ublock-abuse"
    #             "ublock-badware"
    #             "ublock-filters"
    #             "ublock-privacy"
    #             "ublock-quick-fixes"
    #             "ublock-unbreak"
    #             "urlhaus-1"
    #         ];
    #     };
    # };
