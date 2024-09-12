{ pkgs, colorpencil, ... }:
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
                ",l" = ''config-cycle spellcheck.languages ["en-US"]'';
            };
            prompt = {
                "<ctrl-y>" = "prompt-yes";
            };
        };
        settings = {
            colors = {
                completion = {
                    category.bg = "${colorpencil.cat_base}";
                    category.border.bottom = "${colorpencil.cat_mantle}";
                    category.border.top = "${colorpencil.cat_overlay2}";
                    category.fg = "${colorpencil.cat_green}";
                    even.bg = "${colorpencil.cat_mantle}";
                    odd.bg = "${colorpencil.cat_crust}";
                    fg = "${colorpencil.cat_subtext0}";
                    item.selected.bg = "${colorpencil.cat_surface2}";
                    item.selected.border.bottom = "${colorpencil.cat_surface2}";
                    item.selected.border.top = "${colorpencil.cat_surface2}";
                    item.selected.fg = "${colorpencil.cat_text}";
                    item.selected.match.fg = "${colorpencil.cat_rosewater}";
                    match.fg = "${colorpencil.cat_text}";
                    scrollbar.bg = "${colorpencil.cat_crust}";
                    scrollbar.fg = "${colorpencil.cat_surface2}";
                };
                hints = {
                    bg = "${colorpencil.cat_peach}";
                    fg = "${colorpencil.cat_mantle}";
                };
                prompts = {
                    bg = "${colorpencil.cat_mantle}";
                    fg = "${colorpencil.cat_text}";
                    selected.bg = "${colorpencil.cat_surface2}";
                    selected.fg = "${colorpencil.cat_rosewater}";
                };
                tabs = {
                    bar.bg = "${colorpencil.cat_crust}";
                    even.bg = "${colorpencil.cat_surface2}";
                    odd.bg = "${colorpencil.cat_surface1}";
                    even.fg = "${colorpencil.cat_overlay2}";
                    odd.fg = "${colorpencil.cat_overlay2}";
                    indicator.error = "${colorpencil.cat_red}";
                    indicator.system = "none";
                    selected.even.bg = "${colorpencil.cat_base}";
                    selected.odd.bg = "${colorpencil.cat_base}";
                    selected.even.fg = "${colorpencil.cat_text}";
                    selected.odd.fg = "${colorpencil.cat_text}";
                };
                messages = {
                    error.bg = "${colorpencil.cat_overlay0}";
                    info.bg = "${colorpencil.cat_overlay0}";
                    warning.bg = "${colorpencil.cat_overlay0}";
                    error.border = "${colorpencil.cat_mantle}";
                    info.border = "${colorpencil.cat_mantle}";
                    warning.border = "${colorpencil.cat_mantle}";
                    error.fg = "${colorpencil.cat_red}";
                    info.fg = "${colorpencil.cat_text}";
                    warning.fg = "${colorpencil.cat_peach}";
                };
                statusbar = {
                    normal.bg = "${colorpencil.cat_base}";
                    insert.bg = "${colorpencil.cat_crust}";
                    command.bg = "${colorpencil.cat_base}";
                    caret.bg = "${colorpencil.cat_base}";
                    caret.selection.bg = "${colorpencil.cat_base}";
                    progress.bg = "${colorpencil.cat_base}";
                    passthrough.bg = "${colorpencil.cat_base}";
                    normal.fg = "${colorpencil.cat_text}";
                    insert.fg = "${colorpencil.cat_rosewater}";
                    command.fg = "${colorpencil.cat_text}";
                    passthrough.fg = "${colorpencil.cat_peach}";
                    caret.fg = "${colorpencil.cat_peach}";
                    caret.selection.fg = "${colorpencil.cat_peach}";
                    url.error.fg = "${colorpencil.cat_red}";
                    url.fg = "${colorpencil.cat_text}";
                    url.hover.fg = "${colorpencil.cat_sky}";
                    url.success.http.fg = "${colorpencil.cat_teal}";
                    url.success.https.fg = "${colorpencil.cat_green}";
                    url.warn.fg = "${colorpencil.cat_yellow}";
                    private.bg = "${colorpencil.cat_mantle}";
                    private.fg = "${colorpencil.cat_subtext1}";
                    command.private.bg = "${colorpencil.cat_base}";
                    command.private.fg = "${colorpencil.cat_subtext1}";
                };
                downloads = {
                    bar.bg = "${colorpencil.cat_base}";
                    error.bg = "${colorpencil.cat_base}";
                    start.bg = "${colorpencil.cat_base}";
                    stop.bg = "${colorpencil.cat_base}";
                    error.fg = "${colorpencil.cat_red}";
                    start.fg = "${colorpencil.cat_blue}";
                    stop.fg = "${colorpencil.cat_green}";
                    system.fg = "none";
                    system.bg = "none";
                };
                keyhint = {
                    bg = "${colorpencil.cat_mantle}";
                    fg = "${colorpencil.cat_text}";
                    suffix.fg = "${colorpencil.cat_subtext1}";
                };
                contextmenu = {
                    menu.bg = "${colorpencil.cat_base}";
                    menu.fg = "${colorpencil.cat_text}";
                    disabled.bg = "${colorpencil.cat_mantle}";
                    disabled.fg = "${colorpencil.cat_overlay0}";
                    selected.bg = "${colorpencil.cat_overlay0}";
                    selected.fg = "${colorpencil.cat_rosewater}";
                };
                webpage.bg = "${colorpencil.cat_base}";
            };
        };
        extraConfig = ''
            config.set("colors.webpage.darkmode.enabled", True)
        '';
    };
}
