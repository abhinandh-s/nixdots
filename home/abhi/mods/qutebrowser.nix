{ config, pkgs, theme, ... }:
{
    programs.qutebrowser = {
        enable = true;
        package = pkgs.qutebrowser;
        quickmarks = {
            nixpkgs = "https://github.com/NixOS/nixpkgs";
            home-manager = "https://github.com/nix-community/home-manager";
        };
        keyBindings = {
            normal = {
                "<ctrl-v>" = "spawn mpv {url}";
                ",p" = "spawn --userscript qute-pass";
                ",l" = ''config-cycle spellcheck.languages ["en-GB"] ["en-US"]'';
            };
            prompt = {
                "<ctrl-y>" = "prompt-yes";
            };
        };
        settings = {
            colors = {
                completion = {
                    category.bg = "${theme.cat_base}";
                    category.border.bottom = "${theme.cat_mantle}";
                    category.border.top = "${theme.cat_overlay2}";
                    category.fg = "${theme.cat_green}";
                    even.bg = "${theme.cat_mantle}";
                    odd.bg = "${theme.cat_crust}";
                    fg = "${theme.cat_subtext0}";
                    item.selected.bg = "${theme.cat_surface2}";
                    item.selected.border.bottom = "${theme.cat_surface2}";
                    item.selected.border.top = "${theme.cat_surface2}";
                    item.selected.fg = "${theme.cat_text}";
                    item.selected.match.fg = "${theme.cat_rosewater}";
                    match.fg = "${theme.cat_text}";
                    scrollbar.bg = "${theme.cat_crust}";
                    scrollbar.fg = "${theme.cat_surface2}";
                };
                hints = {
                    bg = "${theme.cat_peach}";
                    fg = "${theme.cat_mantle}";
                };
                prompts = {
                    bg = "${theme.cat_mantle}";
                    #      border = "1px solid " + "${theme.cat_overlay0}";
                    fg = "${theme.cat_text}";
                    selected.bg = "${theme.cat_surface2}";
                    selected.fg = "${theme.cat_rosewater}";
                };
                tabs = {
                    bar.bg = "${theme.cat_crust}";
                    even.bg = "${theme.cat_surface2}";
                    odd.bg = "${theme.cat_surface1}";
                    even.fg = "${theme.cat_overlay2}";
                    odd.fg = "${theme.cat_overlay2}";
                    indicator.error = "${theme.cat_red}";
                    indicator.system = "none";
                    selected.even.bg = "${theme.cat_base}";
                    selected.odd.bg = "${theme.cat_base}";
                    selected.even.fg = "${theme.cat_text}";
                    selected.odd.fg = "${theme.cat_text}";
                };
                messages = {
                    error.bg = "${theme.cat_overlay0}";
                    info.bg = "${theme.cat_overlay0}";
                    warning.bg = "${theme.cat_overlay0}";
                    error.border = "${theme.cat_mantle}";
                    info.border = "${theme.cat_mantle}";
                    warning.border = "${theme.cat_mantle}";
                    error.fg = "${theme.cat_red}";
                    info.fg = "${theme.cat_text}";
                    warning.fg = "${theme.cat_peach}";
                };
                statusbar = {
                    normal.bg = "${theme.cat_base}";
                    insert.bg = "${theme.cat_crust}";
                    command.bg = "${theme.cat_base}";
                    caret.bg = "${theme.cat_base}";
                    caret.selection.bg = "${theme.cat_base}";
                    progress.bg = "${theme.cat_base}";
                    passthrough.bg = "${theme.cat_base}";
                    normal.fg = "${theme.cat_text}";
                    insert.fg = "${theme.cat_rosewater}";
                    command.fg = "${theme.cat_text}";
                    passthrough.fg = "${theme.cat_peach}";
                    caret.fg = "${theme.cat_peach}";
                    caret.selection.fg = "${theme.cat_peach}";
                    url.error.fg = "${theme.cat_red}";
                    url.fg = "${theme.cat_text}";
                    url.hover.fg = "${theme.cat_sky}";
                    url.success.http.fg = "${theme.cat_teal}";
                    url.success.https.fg = "${theme.cat_green}";
                    url.warn.fg = "${theme.cat_yellow}";
                    private.bg = "${theme.cat_mantle}";
                    private.fg = "${theme.cat_subtext1}";
                    command.private.bg = "${theme.cat_base}";
                    command.private.fg = "${theme.cat_subtext1}";
                };
                downloads = {
                    bar.bg = "${theme.cat_base}";
                    error.bg = "${theme.cat_base}";
                    start.bg = "${theme.cat_base}";
                    stop.bg = "${theme.cat_base}";
                    error.fg = "${theme.cat_red}";
                    start.fg = "${theme.cat_blue}";
                    stop.fg = "${theme.cat_green}";
                    system.fg = "none";
                    system.bg = "none";
                };
                keyhint = {
                    bg = "${theme.cat_mantle}";
                    fg = "${theme.cat_text}";
                    suffix.fg = "${theme.cat_subtext1}";
                };
                contextmenu = {
                    menu.bg = "${theme.cat_base}";
                    menu.fg = "${theme.cat_text}";
                    disabled.bg = "${theme.cat_mantle}";
                    disabled.fg = "${theme.cat_overlay0}";
                    selected.bg = "${theme.cat_overlay0}";
                    selected.fg = "${theme.cat_rosewater}";
                };
                webpage.bg = "${theme.cat_base}";
            };
            #            # tabs.tabs_are_windows = true;
        };
        extraConfig = ''
config.set("colors.webpage.darkmode.enabled", True)
        '';
    };
}
